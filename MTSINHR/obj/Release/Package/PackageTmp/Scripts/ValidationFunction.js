



function checkForm(formName) {
        var rslt=false;
        $('#' + formName + ' :input').each(function () {
            rslt = false;
            $('.field-validation-valid').hide();

            if ($(this).prop('type') == 'select-multiple') {
                if ($(this).val() == '') {
                    $('.field-validation-valid').text($(this).attr('data-val-error-message'));
                    $('.field-validation-valid').show();
                    return false;
                } else {
                    rslt = true;
                }
            }
            if ($(this).prop('type') == 'select-one') {
                if ($(this).val() == '') {        //index() == 1) {
                    $('.field-validation-valid').text($(this).attr('data-val-error-message'));
                    $('.field-validation-valid').show();
                    return false;
                } else {
                    rslt = true;
                }
            } else if ($(this).prop('type') == 'text') {
                var str = $(this).val();
                str = str.replace(/^\s+/, "");
                $(this).val(str);
                var reg = new RegExp($(this).attr('data-val-regex-pattern'));

                if (!reg.test(str)) {
                    $('.field-validation-valid').text("Please use character only");
                    $('.field-validation-valid').show();
                    return false;
                } else {
                    rslt = true;
                }
               
            }

        });
        return rslt;
    };

function Close(modalid)
{
    $('#' + modalid).modal('hide');
}
