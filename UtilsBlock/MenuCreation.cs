using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data;
using MTSEntBlocks.DataBlock;
using System.Xml;
using System.Web;
using System.Xml.Linq;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;

namespace MTSEntBlocks.UtilsBlock
{
    public class Menulinks
    {
        StringBuilder Strgetmenu = new StringBuilder();
       
        public string readmenu(string username, string xmlFilePath, bool menurange,string Authoritylevel)
        {
            string currUlr = HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.Replace("~", "..");
            List<string> lstAccessUrl = new List<string>();
            Dictionary<string, int> dicHierarchyMenu = new Dictionary<string, int>();
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                string menustring = "";
                if (File.Exists(xmlFilePath))
                {
                    xmlDoc.Load(xmlFilePath);
                    XmlElement template = (XmlElement)xmlDoc.SelectSingleNode("//appmenus/menutemplate");
                    XmlElement menus = (XmlElement)xmlDoc.SelectSingleNode("//appmenus/menus");
                   
                    string[] level = Authoritylevel.Split(',');
                    menustring = writemenu(template, menus, level, menurange, ref lstAccessUrl, ref dicHierarchyMenu);
                }
                SessionHelper.AccessUrls = lstAccessUrl;

                return menustring;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public string writemenu(XmlElement template, XmlElement menus, string[] level, bool menurange, ref List<string> lstAccessUrl, ref Dictionary<string, int> dicHierarchyMenu)
        {
            try
            {
                int maxUserLevel = int.Parse(level[0]);
                if (menurange)
                {
                    foreach (XmlElement menu in menus)
                    {
                        int menuLevel = int.Parse(menu.GetAttribute("level"));
                        string text = menu.GetAttribute("text");
                        if (dicHierarchyMenu.ContainsKey(text))
                        {
                            dicHierarchyMenu[text] = (dicHierarchyMenu[text] == maxUserLevel || maxUserLevel == menuLevel) ? maxUserLevel : dicHierarchyMenu[text] > menuLevel ? menuLevel : dicHierarchyMenu[text];
                        }
                        else
                        {
                            dicHierarchyMenu.Add(text, menuLevel);
                        }
                    }
                }

                foreach (XmlElement menu in menus)
                {
                    int menuLevel = int.Parse(menu.GetAttribute("level"));

                    if (Array.Exists(level, lev => lev == menuLevel.ToString()) || (menurange == true && (menuLevel <= maxUserLevel)))
                    {
                        string baseurl = HttpContext.Current.Request.ApplicationPath;
                        baseurl = baseurl.Length == 1 ? string.Empty : baseurl;
                        string menuTemplate = template.SelectSingleNode(menu.GetAttribute("menutemplate")).InnerText;
                        string url = baseurl + menu.GetAttribute("url");
                        string text = menu.GetAttribute("text");
                        if (menurange)
                        {
                            int existinglevel;
                            dicHierarchyMenu.TryGetValue(text, out existinglevel);
                            if (menuLevel == existinglevel)
                            {
                                if (menu.HasChildNodes)
                                {
                                    if (menuTemplate.Contains("display:none"))
                                    {
                                        if (menuLevel == maxUserLevel)
                                        {
                                            lstAccessUrl.Add(url);
                                        }
                                    }
                                    else
                                    {
                                        lstAccessUrl.Add(url);
                                    }
                                    Strgetmenu.Append(String.Format(menuTemplate, url, text));
                                    writemenu(template, menu, level, menurange, ref lstAccessUrl, ref dicHierarchyMenu);
                                }
                                else
                                {
                                    if (menuTemplate.Contains("display:none"))
                                    {
                                        if (menuLevel == maxUserLevel)
                                        {
                                            lstAccessUrl.Add(url);
                                        }
                                    }
                                    else
                                    {
                                        lstAccessUrl.Add(url);
                                    }
                                    Strgetmenu.Append(String.Format(menuTemplate, url, text));
                                }
                            }
                        }
                        else
                        {
                            if (menu.HasChildNodes)
                            {
                                lstAccessUrl.Add(url);
                                Strgetmenu.Append(String.Format(menuTemplate, url, text));
                                writemenu(template, menu, level, menurange, ref lstAccessUrl, ref dicHierarchyMenu);
                            }
                            else
                            {
                                lstAccessUrl.Add(url);
                                Strgetmenu.Append(String.Format(menuTemplate, url, text));
                            }
                        }
                    }
                }

                return Strgetmenu.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
