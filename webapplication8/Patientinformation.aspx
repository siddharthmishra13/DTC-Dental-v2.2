<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Patientinformation.aspx.vb" Inherits="WebApplication8.Patientinformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DTC Dental | Contact</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" title="style1" />
    <link rel="alternate stylesheet" type="text/css" href="css/style2.css" title="style2" media="screen" />
    <link rel="alternate stylesheet" type="text/css" href="css/style3.css" title="style3" media="screen" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $('#SignUpButton').click(function (e) {
                e.preventDefault();
                $('#form_container_signup2').hide();
                $('#form_container').slideDown();
                $('#txtlogin').attr("disabled", true);
                $('#txtpassword').attr("disabled", true);
                $('#btnlogin').attr("disabled", true);
                $('#SignUpButton').hide();
                $('#cancelBtn').show();
            });

            $('#cancelBtn').click(function (e) {
                e.preventDefault();
                $('#form_container').hide();
                $('#txtlogin').attr("disabled", false);
                $('#txtpassword').attr("disabled", false);
                $('#btnlogin').attr("disabled", false);
                $('#SignUpButton').show();
                $('#cancelBtn').hide();
                $('#form_container_signup2').show("slide");
            });

        });
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <div id="container">
            <div id="header">
                <div id="logo">
                    <a href="index.html">
                        <img src="images/logo.png" width="392" height="94" alt="" /></a>
                </div>
            </div>
            <!-- close header -->
            <div id="h_navcontainer">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="Appointment.aspx">Appointment</a></li>
                    <li><a href="gallery.html">Sign In</a></li>
                </ul>
            </div>
            <div id="page_wrap">
                <div id="form_container_patientinfo">
                    <h3 class="frontpage_heading" style="align-content: center">Account Details</h3>
                    <br />
                    <p>Hi,<asp:Label runat="server" ID="lblPatientfirstname">John</asp:Label> you can check you account details, appointment history and medical reports here. Clcik on update button if you want to update your account information.</p>
                    <div>
                        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="styled-button_margin" />
<br />
                        <br />
                        <asp:Label ID="Label13" runat="server" Width="120px" CssClass="labelClass">Email</asp:Label><asp:TextBox ID="TextBox3" runat="server" TextMode="Email" Width="220px" placeholder="e.g Jamesbond@spy.com" CssClass="roundtextbox"></asp:TextBox>
                       <asp:Label ID="Label1" runat="server" Width="120px" CssClass="labelClass">Confirm Email</asp:Label><asp:TextBox ID="TextBox4" runat="server" TextMode="Email" Width="220px" placeholder="e.g Jamesbond@spy.com" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Width="120px" CssClass="labelClass">Address Line 1</asp:Label><asp:TextBox runat="server" Width="220px" ID="TextBox5" CssClass="roundtextbox" placeholder="Street Name, Apartment #"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Width="120px" CssClass="labelClass ">City</asp:Label><asp:TextBox ID="TextBox6" runat="server" Width="220px" placeholder="e.g. College Station" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                       <asp:Label ID="Label9" runat="server" Width="120px" CssClass="labelClass ">State</asp:Label><asp:TextBox ID="TextBox7" runat="server" Width="220px" placeholder="e.g. Texas or TX" CssClass="roundtextbox"></asp:TextBox>
                       <asp:Label ID="Label2" runat="server" Width="120px" CssClass="labelClass">Zip Code</asp:Label><asp:TextBox ID="TextBox1" TextMode="Number" CssClass="roundtextbox" placeholder="e.g. 77840" runat="server" Width="220px"></asp:TextBox>
                         <br />
                        <br />
                        
                        <asp:Label ID="Label3" runat="server" Width="120px" CssClass="labelClass ">Phone</asp:Label><asp:TextBox ID="TextBox2" TextMode="Phone" placeholder="e.g. 799-739-5618" runat="server" Width="220px" CssClass="roundtextbox"></asp:TextBox>
                    </div>
                    <br />
                    <br />
                    <div class="width800">
                        <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="styled-button_margin" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
