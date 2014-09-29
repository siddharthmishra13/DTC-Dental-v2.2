
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <WebMethod()> _
    Public Shared Function updatePatientDetails(ByVal middlename As String, ByVal address As String, ByVal city As String, ByVal state As String, ByVal zipcode As String, ByVal phone As String, ByVal secphone As String, ByVal ssn As String, ByVal dob As Date) As Boolean
        DatabaseLayer.updatePatientDetails(middlename, address, city, state, zipcode, phone, secphone, ssn, dob)
        Return True
    End Function
End Class