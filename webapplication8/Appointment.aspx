<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Appointment.aspx.vb" Inherits="WebApplication8.Appointment" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DTC Dental | Contact</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" title="style1" />
    <link rel="alternate stylesheet" type="text/css" href="css/style2.css" title="style2" media="screen" />
    <link rel="alternate stylesheet" type="text/css" href="css/style3.css" title="style3" media="screen" />
    <!-- Set viewport for mobile devices -->
    <meta name="viewport" content="initial-scale=1.0, width=device-width" />

    <!-- JQuery / Javascript Scripts-->
    <script type="text/javascript" src="js/jquery.js"></script>

    <script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $(".slide-trigger").collapsable(); // trigger for mobile navigation
        $('#Confirmationbox').hide();

        $('#txtStartDate').blur(function () {
            $('#txtStartDate').attr('disable', true);
            var value = $('#drpdwnDoctors').val();
            $('#validateappointment1').remove();
            if (value != "" || value != null || value != undefined) {
                var aptdate = $('#txtStartDate').val();
                var dentistid = $('#drpdwnDoctors').val();
                $("#drpdwnapttime").empty();
                $.ajax({
                    type: "POST",
                    url: "Appointment.aspx/populateDropdown",
                    data: '{aptdate:' + '"' + aptdate + '"' + ',dentistid:' + '"' + dentistid + '"' + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var options = $("#drpdwnapttime");
                        var resultData = data['d'];
                        $.each(resultData, function (key, value) {
                            options.append($("<option />").val(value).text(value));
                        })
                    }
                });
            }
        });

        $("#drpdwnDoctors").change(function () {
            var aptdate = $('#txtStartDate').val();
            $('#validateappointment2').remove();
            var dentistid = $('#drpdwnDoctors').val();
            $("#drpdwnapttime").empty();
            $.ajax({
                type: "POST",
                url: "Appointment.aspx/populateDropdown",
                data: '{aptdate:' + '"' + aptdate + '"' + ',dentistid:' + '"' + dentistid + '"' + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var options = $("#drpdwnapttime");
                    var resultData = data['d'];
                    $.each(resultData, function (key, value) {
                        options.append($("<option />").val(value).text(value));
                    })
                }
            });
        });

        /* 
        $('#txtStartDate').change(function () {
            alert(14);
        })
        $('#txtStartDate').bind('input', function () {
           
            alert(15);
        });*/
        $('#btnSubmit').click(function () {
            $('#validateappointment1').remove();
            $('#validateappointment2').remove();
            var apttime = $('#drpdwnapttime').val();
            var aptdate = $('#txtStartDate').val();
            var dentistid = $('#drpdwnDoctors').val();
            if (aptdate == "") {
                $('#txtStartDate').focus();
                $('#txtStartDate').after('<div id="validateappointment1" class="validateappointment"  ><font color="red">Please select a date!</font></div>');
            }
            if (dentistid == "") {
                $('#drpdwnDoctors').focus();
                $('#drpdwnDoctors').after('<div id="validateappointment2" class="validateappointment"  ><font color="red">Please select a doctor!</font></div>');
            }



            $.ajax({
                type: "POST",
                url: "Appointment.aspx/saveAppointment",
                data: '{apttime:' + '"' + apttime + '"' + ',aptdate:' + '"' + aptdate + '"' + ',dentistid:' + '"' + dentistid + '"' + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#Confirmationbox').show();
                    // Do something interesting here.
                }
            });
        });

    });
    </script>
    <script type="text/javascript"> /* MOBILE COLLAPSE MENU */
    (function ($) {
        $.fn.collapsable = function (options) {
            // iterate and reformat each matched element
            return this.each(function () {
                // cache this:
                var obj = $(this);
                var tree = obj.next('.navigation');
                obj.click(function () {
                    if (obj.is(':visible')) { tree.toggle(); }
                });
                $(window).resize(function () {
                    if ($(window).width() <= 570) { tree.attr('style', ''); };
                });
            });
        };
    })(jQuery);</script>
</head>
<body>
    <form id="appointment" runat="server">
        <div id="container">
            <div id="header">
                <div id="logo">
                    <a href="index.html">
                        <img src="images/logo.png" width="392" height="94" alt="" /></a>
                </div>
            </div>
            <!-- close header -->
            <div id="h_navcontainer">
                <!-- Header Container -->
                <nav class="group">
                    <h2 class="navheader slide-trigger">&#8801 Menu<span></span></h2>
                    <!-- Mobile Navigation Title -->
                    <ul class="navigation group">
                        <li><a href="index.html" class="sel" id="navbtn">Home</a></li>
                        <li><a href="Services.html">Services</a></li>
                        <li><a href="Dentists.html">Dentists</a></li>
                        <li><a href="SignUp.aspx">Sign In</a></li>
                        <li><a href="contact.html">Contact Us</a></li>

                    </ul>
                </nav>
                <h2 class="navheader collapse-trigger"><span></span></h2>
                <!-- Mobile Header Navigation Trigger -->
                <br />
                <br />
            </div>
            <!-- close h_navcontainer -->
            <div id="page_wrap">
                <h1 class="pagetitle">Request a Dentist Appointment</h1>
                <h2 class="title">Convenient Hours and Locations — Just For You</h2>
                <div class="intro">
                    <p id="appointment_text"><b>To request an appointment, please fill out the form below letting us know which days and times are best for you. A representative will get in touch with you to confirm your appointment.Phone your dental office directly and speak with the office personnel to avoid any cancellation fees. Thank you.</b></p>
                </div>
                
                <div id="form_container_left">
                    <h3 class="frontpage_heading">Schedule Appointment</h3>
                    <br />

                        <asp:Label ID="Label4" runat="server" Width="15%" CssClass="labelClass  marginright20per">Date:</asp:Label> <asp:TextBox ID="txtStartDate" runat="server" CssClass="roundtextbox_appointment" ></asp:TextBox>
                        <span>
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server"></asp:ToolkitScriptManager>
                            <asp:CalendarExtender
                                ID="calendarContainerOverride"
                                StartDate="<%# DateTime.Now.AddDays(3) %>" EndDate="<%# DateTime.Now.AddDays(15)%>"
                                TargetControlID="txtStartDate"
                                runat="server" />
                        </span>
                        <br />
                            <br />
                            <asp:Label ID="Label10" runat="server" Width="15%" CssClass="labelClass  marginright20per">Doctor:</asp:Label><asp:DropDownList runat="server" CssClass="roundtextbox_appointment" Width="160px" ID="drpdwnDoctors" AutoPostBack="false">
                                <asp:ListItem Selected="True" Value="" Text="Select.."></asp:ListItem>
                                <asp:ListItem Value="1">Jeffery Hill </asp:ListItem>
                                <asp:ListItem Value="2">Alton Watson</asp:ListItem>
                                <asp:ListItem Value="3">Janet Reid</asp:ListItem>
                                <asp:ListItem Value="4">Michael Chandler</asp:ListItem>
                                <asp:ListItem Value="5">Lori Lovette</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="Label7" runat="server" Width="15%" CssClass="labelClass  marginright20per">Time:</asp:Label><asp:DropDownList runat="server" CssClass="roundtextbox_appointment" Width="160px" ID="drpdwnapttime" AutoPostBack="True">
                            </asp:DropDownList>
                    <br />
<br />
                            <asp:Button runat="server" Text="Submit" CssClass="styled-button" OnClientClick="return false" ID="btnSubmit" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
