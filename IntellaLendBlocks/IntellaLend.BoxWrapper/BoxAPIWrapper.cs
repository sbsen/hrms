using Box.V2;
using Box.V2.Auth;
using Box.V2.Config;
using Box.V2.Exceptions;
using Box.V2.Models;
using IntellaLend.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace IntellaLend.BoxWrapper
{
    public class BoxAPIWrapper
    {
        #region Members
        private BoxConfig boxConfig;        
        public BoxUserToken UserToken;
        private string AuthCode;
        private BoxClient boxClient;
        private OAuthSession Session;
        private BoxAPIWrapperDataAccess dataAccess;
        #endregion

        #region Public Members
        public bool IsValidToken {
            get {
                return ValidateToken();
            }
        }

        public string BoxAuthURL
        {
            get
            {
                return boxConfig.AuthCodeUri.AbsoluteUri;
            }
        }


        #endregion

        #region Constructors
        private BoxAPIWrapper()
        { }

        public BoxAPIWrapper(string tenantSchema, Int64 userID)
        {
            userID = 1;
            dataAccess = new BoxAPIWrapperDataAccess(tenantSchema);
            UserToken = dataAccess.GetUserToken(userID);
            if (UserToken.UserID != 0)
            {
                boxConfig = new BoxConfig(BoxAPIWrapperDataAccess.BoxClientID, BoxAPIWrapperDataAccess.BoxClientSecretID, new Uri(BoxAPIWrapperDataAccess.BoxRedirectURL));
                Session = new OAuthSession(UserToken.Token, UserToken.RefreshToken, UserToken.ExpireTime, UserToken.TokenType);
                boxClient = new BoxClient(boxConfig, Session);
                boxClient.Auth.SessionAuthenticated += NewSessionEventHandler;                
            }
            else
            {
                UserToken.UserID = userID;
                boxConfig = new BoxConfig(BoxAPIWrapperDataAccess.BoxClientID, BoxAPIWrapperDataAccess.BoxClientSecretID, new Uri(BoxAPIWrapperDataAccess.BoxRedirectURL));
                boxClient = new BoxClient(boxConfig);
                boxClient.Auth.SessionAuthenticated += NewSessionEventHandler;
            }
        }
              
        #endregion

        #region events
        public void NewSessionEventHandler(object sender, EventArgs e)
        {            
            UpdateUserToken();
        }

        private bool ValidateToken()
        {
            try
            {                
                var test= Task.Run(() => boxClient.FoldersManager.GetFolderItemsAsync("0", 1, 0)).GetAwaiter().GetResult();
                return true;
            }
            catch (Exception ex)
            {
                if (HandleException(ex).GetType() == typeof(BoxSessionInvalid))
                    return false;
                else
                    throw HandleException(ex);
            }
        }

        private void UpdateUserToken()
        {
            if (boxClient.Auth.Session != null)
            {
                UserToken.Token = boxClient.Auth.Session.AccessToken;
                UserToken.RefreshToken = boxClient.Auth.Session.RefreshToken;
                UserToken.ExpireTime = boxClient.Auth.Session.ExpiresIn;
                UserToken.TokenType = boxClient.Auth.Session.TokenType;
                dataAccess.UpdateUserToken(UserToken);
            }
        }

        #endregion

        #region Methods

        public TokenValidation CheckUserBoxToken()
        {            
            return new TokenValidation()
            {
                TokenStatus = string.IsNullOrEmpty(UserToken.Token)?0: IsValidToken ? 1:2,
                BoxAuthURL = boxConfig.AuthCodeUri.AbsoluteUri
            };
        }

        public bool GenrateToken(string authCode)
        {
            try
            {
                AuthCode = authCode;
                Task.Run(() => boxClient.Auth.AuthenticateAsync(AuthCode)).GetAwaiter().GetResult();
                var result = IsValidToken;
                if (result)
                {
                    //Update here if event not triggered
                    UpdateUserToken();
                }
                return IsValidToken;
            }
            catch (Exception ex)
            {
                throw HandleException(ex);
            }    
            
        }

        public BoxCollection GetFolderDetails(string id, int limit, int offSet, string fileFilters = "")
        {
            try
            {   
                BoxCollection collection = new BoxCollection();
                List<BoxEntity> result = new List<BoxEntity>();

                var items = Task.Run(() => boxClient.FoldersManager.GetFolderItemsAsync(id, limit, offSet,
                    new List<string>() { BoxFolder.FieldName,
                        BoxFolder.FieldPathCollection,
                        BoxFolder.FieldModifiedAt ,
                     BoxFolder.FieldSize}
                    )).GetAwaiter().GetResult();

                foreach (var item in items.Entries)
                {
                    if (item.Type == "file" && !string.IsNullOrEmpty(fileFilters))
                    {
                        string fileExtension = Path.GetExtension(item.Name);
                        if (!fileFilters.Split(',').Contains(fileExtension))
                        {
                            continue;
                        }
                    }

                    var boxEnt = new BoxEntity()
                    {
                        Type = item.Type,
                        Id = item.Id,
                        Name = item.Name,
                        ParentPath = GetParentPath(item.PathCollection),
                        Size = item.Size,
                        ModifiedTime = item.ModifiedAt

                    };
             

                    result.Add(boxEnt);

                }
                collection.BoxEntities = result;
                collection.Limit = items.Limit;
                collection.Offset = items.Offset;
                collection.TotalCount = items.TotalCount;
                BoxFolder folderDetails = Task.Run(() => boxClient.FoldersManager.GetInformationAsync(id)).GetAwaiter().GetResult();
                collection.Path = GetFolderPath(folderDetails);
                collection.Path.Add(new BoxEntity() { Id= folderDetails.Id, Name= folderDetails.Name });

                return collection;
            }
            catch (Exception ex)
            {
                throw HandleException(ex);
            }
        }

        public BoxEntity GetFileDetails(string id)
        {
            try
            {
                BoxFile fileDetails = Task.Run(() => boxClient.FilesManager.GetInformationAsync(id)).GetAwaiter().GetResult();
                BoxEntity file = new BoxEntity();
                file.Id = fileDetails.Id;
                file.Name = fileDetails.Name;
                file.ModifiedTime = fileDetails.ModifiedAt;
                file.Size = fileDetails.Size;
                file.Id = fileDetails.Id;
                file.ParentPath = GetParentPath(fileDetails.PathCollection);
                return file;
            }
            catch (Exception ex)
            {
                throw HandleException(ex);
            }
           
        }


        private string GetParentPath(BoxCollection<BoxFolder> folderCollextion)
        {
            string path = "";
            foreach (var item in folderCollextion.Entries)
            {
                path += "/" + item.Name;
            }
            return path;
        }

        private List<BoxEntity> GetFolderPath(BoxFolder folderDetails)
        {
            List<BoxEntity> paths = new List<BoxEntity>();
            
            foreach (var item in folderDetails.PathCollection.Entries)
            {
                paths.Add(new BoxEntity() { Name = item.Name, Id = item.Id });
            }
            return paths;
        }


        public static byte[] ReadStreamBytesFully(Stream input)
        {
            byte[] buffer = new byte[16 * 1024];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        public byte[] DownloadFile(string fileId)
        {
            try
            {
                return ReadStreamBytesFully(Task.Run(() => boxClient.FilesManager.DownloadStreamAsync(fileId)).GetAwaiter().GetResult());
            }
            catch (Exception ex)
            {
                throw HandleException(ex);
            }
        }

        public Exception HandleException(Exception ex)
        {

            if ((ex != null && ex.GetType() == typeof(BoxSessionInvalidatedException))|| string.IsNullOrEmpty(ex.Message))
            {
                return new BoxSessionInvalid("Box token releated exception.Please relogin to get new token");
            }

            try
            {
                BoxException bex = JsonConvert.DeserializeObject<BoxException>(ex.Message);
                if (bex != null && bex.ContextInfo != null && bex.ContextInfo.BoxErrors != null && bex.ContextInfo.BoxErrors.Count > 0)
                    return new Exception(bex.ContextInfo.BoxErrors[0].Message);
                else if (!string.IsNullOrEmpty(bex.Message))
                    return new Exception(bex.Message);
            }
            catch (Exception jex)
            {
            }
            try
            {
                BoxSingleException bex = JsonConvert.DeserializeObject<BoxSingleException>(ex.Message);
                if (bex != null && !string.IsNullOrEmpty(bex.Message))
                    return new Exception(bex.Message);            
            }
            catch (Exception jex)
            {
            }


            return new Exception(ex.Message);
        }

        #endregion
    }

    #region Models

    
    public class BoxCollection
    {
        public List<BoxEntity> BoxEntities { get; set; }
        public Int64 TotalCount { get; set; }
        public int Limit { get; set; }
        public int Offset { get; set; }
        public List<BoxEntity> Path { get; set; }
    }

    public class BoxEntity
    {
        public bool Selected { get; set; }
        public Int64 Priority { get; set; }
        public string Type { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public DateTime? ModifiedTime { get; set; }
        public string ParentPath { get; set; }
        public long? Size { get; set; }
    }

    #endregion

    #region ExceptionClass

    public class TokenValidation
    {
        public int TokenStatus { get; set; }
        public string BoxAuthURL { get; set; }
    }

    public class BoxSingleException
    {
        [JsonProperty(PropertyName = "error")]
        public string Error { get; set; }
        [JsonProperty(PropertyName = "error_description")]
        public string Message { get; set; }     
    }

    public class BoxException
    {
        [JsonProperty(PropertyName = "type")]
        public string Type { get; set; }
        [JsonProperty(PropertyName = "status")]
        public int Status { get; set; }
        [JsonProperty(PropertyName = "context_info")]
        public BoxErrorCollection ContextInfo { get; set; }
        [JsonProperty(PropertyName = "message")]
        public string Message { get; set; }
    }

    public class BoxErrorCollection
    {
        [JsonProperty(PropertyName = "errors")]
        public List<BoxError> BoxErrors { get; set; }
    }

    public class BoxError
    {
        [JsonProperty(PropertyName = "reason")]
        public string Reason { get; set; }
        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }
        [JsonProperty(PropertyName = "message")]
        public string Message { get; set; }
    }


    public class BoxSessionInvalid : Exception
    {
        public BoxSessionInvalid()
        : base() { }

        public BoxSessionInvalid(string message)
        : base(message) { }
    }
    #endregion
}
