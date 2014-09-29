<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SignUp.aspx.vb" Inherits="WebApplication8.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DTC Dental | Contact</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" title="style1" />
    <link rel="alternate stylesheet" type="text/css" href="css/style2.css" title="style2" media="screen" />
    <link rel="alternate stylesheet" type="text/css" href="css/style3.css" title="style3" media="screen" />
     <!-- Set viewport for mobile devices -->
    <meta name="viewport" content="initial-scale=1.0, width=device-width" />
    <script type="text/javascript" src="js/jquery.js"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $(".slide-trigger").collapsable(); // trigger for mobile navigation
            $('#form_container').hide();
            $('#cancelBtn').hide();
            $('#form_container_signup2').show();
            $('#btnlogin').click(function () {
    
                var loginid = $('#txtlogin').val();
                var password = $('#txtpassword').val();
                alert('{loginid:' + '"' + loginid + '"' + ',password:' + '"' + password + '"' + ' }');
                $.ajax({
                    type: "POST",
                    url: "SignUp.aspx/verifylogin",
                    data: '{loginid:' + '"' + loginid + '"' + ',password:' + '"' + password + '"' + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#Confirmationbox').show();
                        //alert(data.d);
                        // Do something interesting here.
                      window.location = 'Appointment.aspx?pid='+ data.d;
                    }
                });
            });
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
            $('#btnSignUp').click(function () {

                var firstname = $('#txtfirstname').val();
                var lastname = $('#txtlastname').val();
                var email = $('#txtemail').val();
                var password = $('#txtconfirmpassword').val();
                var city = $('#txtcity').val();
                var zipcode = $('#txtzipcode').val();
                var state = $('#txtState').val();
                var address = $('#txtaddress').val();
                var phone = $('#txtphone').val();
                // '"' + ',firstname:' + '"' + firstname + '"' + ',lastname:' + '"' + lastname + '"' + ',city:' + '"' + city + '"' + ',zipcode:' + '"' + zipcode + '"' + ',state:' + '"' + state + '"' + ',address:' + '"' + address + '"' +
                
                               
                           
                                
                   
                $.ajax({
                    type: "POST",
                    url: "SignUp.aspx/SavePatientDetails",
                    data: '{email:' + '"' + email + '"' + ',password:' + '"' + password + '"' + ',firstname:' + '"' + firstname + '"' + ',lastname:' + '"' + lastname + '"' + ',city:' + '"' + city + '"' + ',state:' + '"' + state + '"' + ',zipcode:' + '"' + zipcode + '"' + ',address:' + '"' + address + '"' + ',phone:' + '"' + phone + '"' + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#Confirmationbox').show();
                        //alert(data.d);
                        // Do something interesting here.
                        window.location = 'Appointment.aspx?pid=' + data.d;
                    }
                });
            });

        });

        //Function to insert dashes automatically in phone number field
        function maskInput(input, textbox, location, delimiter) {
            //Get the delimiter positons
            var locs = location.split(',');
            //Iterate until all the delimiters are placed in the textbox
            for (var delimCount = 0; delimCount <= locs.length; delimCount++) {
                for (var inputCharCount = 0; inputCharCount <= input.length; inputCharCount++) {
                    //Check for the actual position of the delimiter
                    if (inputCharCount == locs[delimCount]) {
                        //Confirm that the delimiter is not already present in that position
                        if (input.substring(inputCharCount, inputCharCount + 1) != delimiter) {
                            input = input.substring(0, inputCharCount) + delimiter + input.substring(inputCharCount, input.length);
                        }
                    }
                }
            }
            textbox.value = input;
        }
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
    <form id="signUp" runat="server">
       <div id="container"> <!-- Page Container -->
        <div id="header">
            <div id="logo"><a href="index.html">
                <img src="images/logo.png" class="logo_image" alt="" /></a></div>
        </div>
        
        <div id="h_navcontainer"> <!-- Header Container -->
            <nav class="group">
                <h2 class="navheader slide-trigger">&#8801 Menu<span></span></h2> <!-- Mobile Navigation Title -->
                <ul class="navigation group">
                    <li><a href="index.html" class="sel" id="navbtn">Home</a></li>
                    <li><a href="Services.html">Services</a></li>
                    <li><a href="Dentists.html">Dentists</a></li>
                    <li><a href="SignUp.aspx">Sign In</a></li>
                    <li><a href="contact.html">Contact Us</a></li>

                </ul>
            </nav>
            <h2 class="navheader collapse-trigger"><span></span></h2> <!-- Mobile Header Navigation Trigger -->
            <br />
            <br />
        </div>
        <!-- close h_navcontainer -->
            <div id="page_wrap">
                <h1 class="pagetitle">Sign Up</h1>
                <div id="form_container_signUp">
                    <h3 class="frontpage_heading" style="align-content: center">Log In</h3>
                    <asp:Label ID="Label11" runat="server" Width="120px" CssClass="labelClass_signup">Login ID: </asp:Label><asp:TextBox runat="server"  ID="txtlogin" CssClass="roundtextbox_signup" autofocus="autofocus"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Width="120px" CssClass="labelClass_signup">Password: </asp:Label><asp:TextBox ID="txtpassword" runat="server"  TextMode="password" CssClass="roundtextbox_signup"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnlogin" runat="server" OnClientClick="return false" Text="Submit" CssClass="styled-button_margin" /> 
                    <asp:Button ID="SignUpButton" OnClientClick="return false" runat="server" Text="Sign Up" CssClass="styled-button_signUp"  CausesValidation="False" UseSubmitBehavior="False" /> <!-- Buttons and Validation -->
                    <asp:Button ID="cancelBtn" OnClientClick="return false" runat="server" Text="Cancel" CssClass="styled-button_signUp" CausesValidation="False" UseSubmitBehavior="False"/>
                </div>

                <div id="form_container"> <!-- Sign Up Form --> 
                    <h3 class="frontpage_heading">Sign Up</h3>
                    <br />
                    <div>
                        <asp:Label ID="Label13" runat="server" Width="120px" CssClass="labelClass">Email:</asp:Label><asp:TextBox ID="txtemail" runat="server" TextMode="Email" Width="220px" placeholder="e.g Jamesbond@spy.com" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label14" runat="server" Width="120px" CssClass="labelClass">Password:</asp:Label><asp:TextBox ID="txtsignuppassword" TextMode="password" runat="server" Width="220px" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label15" runat="server" Width="120px" CssClass="labelClass">Confirm Password:</asp:Label><asp:TextBox ID="txtconfirmpassword" TextMode="password" runat="server" Width="220px" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Width="120px" CssClass="labelClass">First Name: </asp:Label><asp:TextBox runat="server" Width="220px" ID="txtfirstname" placeholder="e.g. James" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Width="120px" CssClass="labelClass ">Last Name:</asp:Label><asp:TextBox ID="txtlastname" runat="server" Width="220px" placeholder="e.g. Bond" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Width="120px" CssClass="labelClass">Address Line 1:</asp:Label><asp:TextBox runat="server" Width="220px" ID="txtaddress" CssClass="roundtextbox" placeholder="Street Name, Apartment #"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Width="120px" CssClass="labelClass ">City:</asp:Label><asp:TextBox ID="txtcity" runat="server" Width="220px" placeholder="e.g. College Station" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Width="120px" CssClass="labelClass ">State:</asp:Label><asp:TextBox ID="txtState" runat="server" Width="220px" placeholder="e.g. Texas or TX" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Width="120px" CssClass="labelClass">Zip Code:</asp:Label><asp:TextBox ID="txtzipcode" TextMode="Number" CssClass="roundtextbox" placeholder="e.g. 77840" runat="server" Width="220px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Width="120px" CssClass="labelClass ">Phone</asp:Label><asp:TextBox ID="txtphone" onKeyPress="javascript:return maskInput(this.value,this,'3,7','-');"  onblur="javascript:return maskInput(this.value,this,'3,7','-');" TextMode="Phone" placeholder="e.g. 799-739-5618" runat="server" Width="220px" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <!-- End Sign Up Form --> 
                    <br />
                    <br /> 
                    <!-- Button to Submit Form --> 
                    <div class="width800">
                        <asp:Button ID="btnSignUp" OnClientClick="return false" runat="server" Text="Submit" CssClass="styled-button_margin" />
                    </div>
                </div>
                <!-- Sign Up Information --> 
                <div id="form_container_signup2">
                    <div style="width: 100%">
                       
                    </div>
                                        <div>
                        <h2 id="sign_up_title">Affordable Family & Individual Dental Plans</h2>
                        <h3>Quality Assured Dentists - Clear Costs</h3>
                        <p>Welcome to DTC Dental, we provide affordable dental plan. We have the best in class facilities. At DTC dental we care about your care.</p>
                        
                        <p>If you are already a member please sign in to check your account details. Please sign up to enjoy a host of benifits like free first dental check up. Free assistance in chhosing the right dental plan for you and your family. </p>
                        
                        <p>If english is not your first language, we offer free translation services to help you understand your coverage and understanding. For more informaion call our office!</p>
                    </div>
                </div>
                <!-- End Sign Up Information --> 
            </div>
        </div>
    </form>
</body>
</html>
