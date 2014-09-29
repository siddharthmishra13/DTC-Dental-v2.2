
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration

Public Class Appointment


    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    <WebMethod()> _
    Public Shared Function saveAppointment(ByVal apttime As String, ByVal aptdate As Date, ByVal dentistid As Integer) As Boolean


        Try
            DatabaseLayer.saveAppointment(apttime, aptdate, dentistid, GlobalClass.Globalpid)
        Catch ex As Exception
            Throw ex
        End Try
        Return True
    End Function
    <WebMethod()> _
    Public Shared Function populateDropdown(ByVal aptdate As Date, ByVal dentistid As Integer) As List(Of String)
        Dim apttime As New List(Of String)
        Try
            apttime = DatabaseLayer.GetAvailableAppointmentTime(aptdate, dentistid)
        Catch ex As Exception
            Throw ex
        End Try
        Return apttime
    End Function
End Class