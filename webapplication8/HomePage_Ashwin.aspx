<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage_Ashwin.aspx.vb" Inherits="WebApplication8.Appointment" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

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

    <!-- JQuery / Javascript Scripts-->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.js"></script>

    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $(".slide-trigger").collapsable(); // trigger for mobile navigation
            $('#borderedDiv').hide();
            $('#Confirmationbox').hide();
            $('#validateappointment').remove();
            $('#Button2').click(function () { 
                $('#borderedDiv').toggle("medium");
                // $('Button2').toggle("slow");
            });
            //$('#custCheckbox').attr("checked", false);
            $('#btnsubmit1').click(function () {
                var dentistemail = $('#TextBox8').val();
                alert(dentistemail);
                if (dentistemail=='' || dentistemail == undefined ||  dentistemail == null){
                    $('#TextBox8').focus();
                    $('#TextBox8').after('<div id="validateappointment"  ><font color="red">Please select Email!</font></div>');
                }
            
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
    <style type="text/css">
        .mGrid {
            position: absolute;
            left: 472px;
            top: 241px;
            height: 48px;
            width: 752px;
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
            font-family: Calibri;
            color: #474747;
        }

            .mGrid td {
                padding: 2px;
                border: solid 1px #c1c1c1;
            }

            .mGrid th {
                padding: 4px 2px;
                color: #fff;
                border-left: solid 1px #525252;
                font-size: 0.9em;
            }

           </style>
</head>
<body>

    <form id="homepage" runat="server">
        <div id="container">
            <div id="header">
                <div id="logo">
                    <a href="index.html">
                        <img src="images/logo.png" width="392" height="94" alt="" /></a>
                </div>
            </div>
            <!-- close header -->
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
                <h1 id="mainTitle">Howdy! </h1>
               
                <%-- <div class="intro">
                    <p><b>To request an appointment, please fill out the form below letting us know which days and times are best for you. A representative will get in touch with you to confirm your appointment.Phone your dental office directly and speak with the office personnel to avoid any cancellation fees. Thank you.</b></p>
                </div>--%>
                <div class="width800">
                    <div>

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid" PagerStyle-CssClass="pgr" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" HeaderStyle-BackColor="Gray" />
                                <asp:BoundField DataField="Visit_Date" HeaderText="Visit_Date" SortExpression="Visit_Date" HeaderStyle-BackColor="Gray" ReadOnly="True" />
                                <asp:BoundField DataField="Visit_Time" HeaderText="Visit_Time" SortExpression="Visit_Time" HeaderStyle-BackColor="Gray" />
                                <asp:BoundField DataField="Dentist" HeaderText="Dentist" ReadOnly="True" SortExpression="Dentist" HeaderStyle-BackColor="Gray" />
                            </Columns>

                            <PagerStyle CssClass="pgr"></PagerStyle>
                        </asp:GridView>

                       
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                   <br />        
                          <br />
                    <br />
                   <br />       
                    <br />        
                  
                                 

                    <asp:Button ID="Button2" runat="server" Text="Button" OnClientClick="return false" Style="margin-left: 220px"  /><asp:Label ID="Label26" runat="server" CssClass="labelClass">Click on this box if you want to Update Information</asp:Label>
                    <br />
                    
                    <div id="borderedDiv">
                        <h3 class="frontpage_heading" style="align-content: center">Update Information</h3>
                        <br />

                        <div>
                            <asp:Label ID="Label18" runat="server" Width="100px" CssClass="labelClass">First Name </asp:Label><asp:TextBox ID="fname" runat="server" Width="200px" ReadOnly="true" CssClass="roundtextbox" autofocus="autofocus"></asp:TextBox>
                            <asp:Label ID="Label19" runat="server" Width="100px" CssClass="labelClass margingleft20">Last Name</asp:Label><asp:TextBox ID="TextBox5" runat="server" Width="200px" ReadOnly="true" CssClass="roundtextbox"></asp:TextBox>
                        </div>
                        <br />
                        <div class="rowElem">
                            <asp:Label ID="Label12" runat="server" Width="100px" CssClass="labelClass">Street</asp:Label><asp:TextBox ID="TextBox6" CssClass="roundtextbox" runat="server" Width="200px"></asp:TextBox>
                            <asp:Label ID="Label15" runat="server" Width="100px" CssClass="labelClass margingleft20">Zip Code</asp:Label><asp:TextBox ID="TextBox7" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        </div>
                        <br />
                        <div class="rowElem">
                            <asp:Label ID="Label16" runat="server" Width="100px" CssClass="labelClass">Email</asp:Label><asp:TextBox ID="TextBox8" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                            <asp:Label ID="Label17" runat="server" Width="120px" CssClass="labelClass">Phone Number</asp:Label><asp:TextBox ID="TextBox9" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        </div>
                        <br />
                        <div class="rowElem">
                            <asp:Label ID="Label118" runat="server" Width="100px" CssClass="labelClass">SSN</asp:Label><asp:TextBox ID="TextBox10" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                            <asp:Label ID="Label119" runat="server" Width="100px" CssClass="labelClass margingleft20">Date of Birth</asp:Label><asp:TextBox ID="TextBox11" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        </div>

                        <%--<h3 class="frontpage_heading" style="align-content: center">Schedule Appointment</h3>
                        <br />
                        <asp:Label runat="server" CssClass="labelClass marginright20  floatleft" ID="pidlable" Width="100px">   Patient ID</asp:Label><asp:TextBox ID="pidtextbox" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Width="100px" CssClass="labelClass  floatleft">Date</asp:Label>
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server"></asp:ToolkitScriptManager>
                        <span>
                            <asp:TextBox ID="txtpiddate" runat="server" CssClass="roundtextbox" Width="200px"></asp:TextBox>
                            <asp:CalendarExtender

                                ID="CalendarExtender1"
                                TargetControlID="txtpiddate"
                                StartDate="<%# DateTime.Now.AddDays(3) %>" EndDate="<%# DateTime.Now.AddDays(15)%>"
                                runat="server" />
                        </span>
                        <asp:Label ID="Label9" runat="server" Width="100px" CssClass="labelClass margingleft20">Time</asp:Label><asp:DropDownList runat="server" ID="pdrpdnwtime" CssClass="roundtextbox" Width="120px">
                            <asp:ListItem Value="1" Selected="True"> 8:00-10:00 AM </asp:ListItem>
                            <asp:ListItem Value="2"> 10:00-12:00 PM</asp:ListItem>
                            <asp:ListItem Value="3"> 1:00-3:00 PM</asp:ListItem>
                            <asp:ListItem Value="4"> 3:00-5:00 PM</asp:ListItem>
                        </asp:DropDownList>
                        <br />--%>
                        <div class="width800">
                            <asp:Button ID="btnsubmit1" OnClientClick="return false" runat="server" Text="Submit" CssClass="styled-button" />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Group6_DTCConnectionString %>" SelectCommand="  select ([Patient_First_Name] + ' ' + [Patient_Last_Name]) AS Name , CONVERT(VARCHAR(10), [Visit_Date], 101)AS Visit_Date,[Visit_Time],([Dentist_First_Name] + ' ' + [Dentist_Last_Name]) AS Dentist 
  FROM [Group6_DTC].[dbo].[VISIT] INNER JOIN [Group6_DTC].[dbo].[PATIENT] ON [PATIENT].[Patient_ID]=[VISIT].[Patient_ID]
  INNER JOIN [Group6_DTC].[dbo].[DENTIST] ON [DENTIST].[Dentist_ID]=[VISIT].[DENTIST_ID] 
  WHERE [Patient_First_Name] = 'Aaron'
  ORDER BY [Patient_First_Name];"></asp:SqlDataSource>
                        </div>
                      <%-- </div>
                </div>
                <div id="form_container_left">
                    <%--<h3 class="frontpage_heading" style="align-content: center">Update Information</h3>
                    <br />
                    <div>
                        <asp:Label ID="Label1" runat="server" Width="100px" CssClass="labelClass">First Name </asp:Label><asp:TextBox runat="server" Width="200px" ID="txtfirstname" CssClass="roundtextbox" autofocus="autofocus"></asp:TextBox>
                        <asp:Label ID="Label5" runat="server" Width="100px" CssClass="labelClass margingleft20">Last Name</asp:Label><asp:TextBox ID="txtlastname" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                    </div>
                    <br />
                    <div class="rowElem">
                        <asp:Label ID="Label2" runat="server" Width="100px" CssClass="labelClass">Street</asp:Label><asp:TextBox ID="txtZipcode" CssClass="roundtextbox" runat="server" Width="200px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Width="100px" CssClass="labelClass margingleft20">Zip Code</asp:Label><asp:TextBox ID="txtphone" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                    </div>
                    <br />
                    <div class="rowElem">
                        <asp:Label ID="Label4" runat="server" Width="100px" CssClass="labelClass">Email</asp:Label><asp:TextBox ID="txtemail" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        <asp:Label ID="Label13" runat="server" Width="120px" CssClass="labelClass">Phone Number</asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                    </div> 
                    <br />
                    <div class="rowElem">
                        <asp:Label ID="Label14" runat="server" Width="100px" CssClass="labelClass">SSN</asp:Label><asp:TextBox ID="TextBox2" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>
                        <asp:Label ID="Label7" runat="server" Width="100px" CssClass="labelClass margingleft20">Date of Birth</asp:Label><asp:TextBox ID="TextBox3" runat="server" Width="200px" CssClass="roundtextbox"></asp:TextBox>   
                    </div>
                        
                        <br />
                        <div>
                            <br />
                            <asp:Label ID="Label10" runat="server" Width="100px" CssClass="labelClass">Time</asp:Label>
                            <%--<asp:DropDownList runat="server" CssClass="roundtextbox" Width="120px" ID="drpdwnapttime" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Appointment_Time" DataValueField="Appointment_Time">
                                <%--<asp:ListItem Value="8:00  AM" Selected="True"> 8:00  AM </asp:ListItem>
                                <asp:ListItem Value="9:00  AM">9:00  AM</asp:ListItem>
                                <asp:ListItem Value="10:00  AM">10:00  AM</asp:ListItem>
                                <asp:ListItem Value="11:00  AM">11:00  AM</asp:ListItem>
                                <asp:ListItem Value="1:00  PM">1:00  AM</asp:ListItem>
                                <asp:ListItem Value="2:00  PM">2:00  PM</asp:ListItem>
                                <asp:ListItem Value="3:00  PM">3:00  PM</asp:ListItem>
                                <asp:ListItem Value="4:00  PM">4:00  PM</asp:ListItem>
                                <asp:ListItem Value="5:00  PM">5:00  PM</asp:ListItem>
                            </asp:DropDownList>
                               <asp:Label ID="Label11" runat="server" Width="100px" CssClass="labelClass marginleft110">Doctor</asp:Label><asp:DropDownList runat="server" CssClass="roundtextbox" Width="120px" ID="drpdwnDoctors" AutoPostBack="True">
                                <asp:ListItem Value="1" Selected="True">Jeffery Hill </asp:ListItem>
                                <asp:ListItem Value="2">Alton Watson</asp:ListItem>
                                <asp:ListItem Value="3">Janet Reid</asp:ListItem>
                                <asp:ListItem Value="4">Michael Chandler</asp:ListItem>
                                <asp:ListItem Value="5">Lori Lovette</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div id="Confirmationbox">
                            <p>Congratulations! We have received your appointments details. We will soon call you to confirm the appointment. Please note that the appointment timings are tentative and will be confirmed on the call.</p>
                        </div>--%>
                    </div>
                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DTCDentalConnectionString %>" SelectCommand="SELECT Appointment_Time FROM APPOINTMENT_TIME WHERE (Appointment_Time NOT IN (SELECT Appointment_Time FROM APPOINTMENT AS A WHERE (Appointment_Date = @date_selected) AND (Dentist_ID = @Dentist_ID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtStartDate" DefaultValue="" Name="date_selected" PropertyName="Text" />
                            <asp:ControlParameter ControlID="drpdwnDoctors" DefaultValue="1" Name="Dentist_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <br />

                    <%--<div class="width800">
                        <asp:Button runat="server" Text="Submit" CssClass="styled-button" OnClientClick="return false" ID="btnSubmit" />
                    </div>--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
