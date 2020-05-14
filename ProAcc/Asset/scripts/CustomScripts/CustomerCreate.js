$(document).ready(function () {
    $("#create").prop("disabled", true);
    $("#txtName").keypress(function (event) {
        var inputValue = event.which;
        // allow letters and whitespaces only.
        if (inputValue != 38) {
            if (!(inputValue >= 65 && inputValue <= 123) && (inputValue != 32 && inputValue != 0)) {
                event.preventDefault();
                $("#lblName").html("Not Allowed").show().fadeOut("slow");
            }
        }
    });
    $("#txtwork").keypress(function (event) {
        var inputValue = event.which;
        // allow letters and whitespaces only.

        if (!(inputValue >= 65 && inputValue <= 123) && (inputValue != 32 && inputValue != 0)) {
            event.preventDefault();
            $("#lblwork").html("Not Allowed").show().fadeOut("slow");
        }

    });

    $("#EstimatedSale").keypress(function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            $("#lblEstimatedSale").html("Money Only").show().fadeOut("slow");
            return false;
        }
    });
    $("#txtAltMobId").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#lblAltMob").html("Numbers Only").show().fadeOut("slow");
            return false;
        }
    });
    $("#txtMobId").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#lblMob").html("Numbers Only").show().fadeOut("slow");
            return false;
        }
    });

    $("#EstimatedSale").bind('copy paste cut', function (e) {
        e.preventDefault();
    });

    $("#txtName").on('change', function () {
        debugger;
        var CustName = $("#txtName").val().trim();
        if (CustName == "") {
            $("#lblName").html("Please Enter valid Consultant name").show().fadeOut(2000);
        }
        else {
            $.ajax({
                url:  "/Customers/CheckCustomersNameAvailability",
                type: "GET",
                data: { namedata: CustName },
                dataType: "json",
                success: function (data) {
                    if (data != "success") {
                        $("#lblName").html("This Customer name is already taken,please select another").show();

                    }
                    else {
                        $("#lblName").html("").hide();
                    }

                },
                error: function (err) {

                    alert(err);
                }
            });
        }
        ValidateButton();
    });
    $("#txtwork").on('change', function () {
        ValidateButton();
    });
    $("#txtMobId").on('change', function () {
        ValidateButton();
    });
    $("#txtAltMobId").on('change', function () {
        ValidateButton();
    });
    $("#CustomerUserName").on('change', function () {

        var CustUserName = $("#CustomerUserName").val().trim();
        if (CustUserName == "") {
            $("#lblName").html("Please Enter valid Customer User name").show().fadeOut(2000);
        }
        else {
            $.ajax({
                url: "/Consultants/CheckConsultantsUsernameAvailability",
                type: "GET",
                data: { userdata: CustUserName },
                dataType: "json",
                success: function (data) {
                    if (data != "success") {
                        $("#Status1").html("This User name is already taken,please select another").show();

                    }
                    else {
                        $("#Status1").html("").hide();
                    }

                },
                error: function (err) {

                    alert(err);
                }
            });
        }
        ValidateButton();
    });
    $("#txtPassword").on('change', function () {
        ValidateButton();
    });
    $("#txtConfirmPassword").on('change', function () {
        ValidateButton();
    });
    $("#EstimatedSale").on('change', function () {
        ValidateButton();
    });
    $("#txtEmail").on('change', function () {
        ValidateButton();
    });
    $("#txtAltEmail").on('change', function () {
        ValidateButton();
    });
    $("#txtLastDt").on('change', function () {
        ValidateButton();
    });
    $("#txtNextDt").on('change', function () {
        ValidateButton();
    });
    $("#LeadStatus").on('change', function () {
        ValidateButton();
    });
    $("#LeadSource").on('change', function () {
        ValidateButton();
    });
    $("#Comments").on('change', function () {
        ValidateButton();
    });

    $("#txtLastDt,#txtNextDt").keypress(function (e) {
        return false;
    });
    $("#txtLastDt,#txtNextDt").keydown(function (e) {
        return false;
    });
    $(function () {

        $('#txtLastDt').focus(function () {
            $('#txtLastDt').datepicker('show');
        });
        $('#txtNextDt').focus(function () {
            $('#txtNextDt').datepicker('show');
        });


        $("#txtLastDt").datepicker({
            showOn: "button",
            buttonImage: "/Asset/images/calendar-512.png",
            buttonImageOnly: true,
            buttonText: "Select date",
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            beforeShow: function (textbox, instance) {
                instance.dpDiv.css({
                    marginLeft: textbox.offsetWidth + (-200) + 'px'
                    //Here -176 is the width of my datepicker div, you can change according to your need.
                });
            }
        });

        $("#txtNextDt").datepicker({
            showOn: "button",
            buttonImage: "/Asset/images/calendar-512.png",
            buttonImageOnly: true,
            buttonText: "Select date",
            dateFormat:"dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            beforeShow: function (textbox, instance) {
                instance.dpDiv.css({
                    marginLeft: textbox.offsetWidth + (-200) + 'px'
                    //Here -176 is the width of my datepicker div, you can change according to your need.
                });
            }
        });
    });
    
    

    function ValidateButton() {
        debugger;
        var txtLastDt = $("#txtLastDt").val();
        var txtNextDt = $("#txtNextDt").val();
        var Name = $("#txtName").val();
        var Work = $("#txtwork").val();
        var Mobile = $("#txtMobId").val();
        var Email = $("#txtEmail").val();
        var CustomerUserName = $("#CustomerUserName").val();
        var Password = $("#txtPassword").val();
        var ConfirmPassword = $("#txtConfirmPassword").val();

        var lblName = $("#lblName").text(); // val();
        var lblwork = $("#lblwork").text();
        var lblMob = $("#lblMob").text();
        var lblEmail = $("#lblEmail").text();
        var Status = "";
        var lblAltPwd = $("#lblAltPwd").text();

        if (Name.length > 0 && Work.length > 0 && Mobile.length > 0 && Email.length > 0 && CustomerUserName.length > 0 && Password.length > 0 && ConfirmPassword.length > 0 
            && lblName == "" && lblwork == "" && lblMob == "" && lblEmail == "" && Status == "" && lblAltPwd == "" && txtLastDt != "" && txtNextDt != "") {
            $("#create").prop("disabled", false);
        }
        else {
            $("#create").prop("disabled", true);
        }


    }


});
