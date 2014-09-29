Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration
Public Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <WebMethod(EnableSession:=True)>
    Public Shared Function verifylogin(ByVal loginid As String, ByVal password As String) As Integer
        Dim pid As Integer
        Try
            pid = DatabaseLayer.verifylogin(loginid, password)
            GlobalClass.Globalpid = pid
        Catch ex As Exception
            Throw ex
        End Try

        Return pid
    End Function

    <WebMethod()> _
    Public Shared Function SavePatientDetails(ByVal email As String, ByVal password As String, ByVal firstname As String, ByVal lastname As String, ByVal city As String, ByVal state As String, ByVal zipcode As String, ByVal address As String, ByVal phone As String) As Boolean
        Try
            'DatabaseLayer.SavePatientDetails(email, password, firstname, lastname, address, city, state, zipcode, phone)
        Catch ex As Exception

        End Try

        Return True
    End Function

    ' , ByVal firstname As String, ByVal lastname As String, ByVal city As String, ByVal zipcode As String, ByVal state As String, ByVal address As String, ByVal phone As String
End Class