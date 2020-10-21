function InitializeGrid(table) {
    return table.dataTable({
        "iDisplayLength": 7,
        "aLengthMenu": [[7, 14, 25, 50, -1], [7, 14, 25, 50, "All"]],
        "bPaginate": true,
        "bFilter": true,
        "bInfo": true,
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        "oLanguage": {
            "sLengthMenu": "_MENU_ records per page"
        }
    });
}

function TableDataSelect(tableBody, oldValue, newValue, btns) {
    tableBody.click(function (event) {
        if ($(event.target.parentNode).hasClass('row_selected')) {
            $(event.target.parentNode).removeClass('row_selected');
        } else {
            $(oTable.fnSettings().aoData).each(function () {
                $(this.nTr).removeClass('row_selected');
            });
            $(event.target.parentNode).addClass('row_selected');
        }
    });
    oldValue.val('0');
    tableBody.click(function (e) {
        newValue.val($(e.target.parentNode).attr('id'));
        if ($("#HUserID").val() != "") {
            if (oldValue.val() != newValue.val()) {
                EnableButtons(btns)
                oldValue.val(newValue.val());
            }
            else {
                oldValue.val('0');
                DisableButtons(btns);
            }
        }
        else {
            DisableButtons(btns);
        }
    });
}

function DisableButtons(btns) {
    jQuery.each(btns, function () {
        $(this).attr("disabled", true);
    });
}

function EnableButtons(btns) {
    jQuery.each(btns, function () {
        $(this).removeAttr("disabled");
    });
}

function ShowAlertMsg(alertMsg) {
    if (alertMsg != null) {
        $("div#alertDiv").html(alertMsg);
        $("#alertDiv").show();
        setTimeout(function () {
            $("#alertDiv").hide('slow')
        }, 3000);
        alertMsg = null;
    }
}
