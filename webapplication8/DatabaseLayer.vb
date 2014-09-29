
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Public Class DatabaseLayer
    Dim myDA As SqlDataAdapter
    Dim myDT As DataSet
    Public Shared Function saveAppointment(ByVal apttime As String, ByVal aptdate As Date, ByVal dentistid As Integer, ByVal pid As Integer) As Boolean
        Try
            Dim connectionstrng As String = "Data Source=DELL-PC;Initial Catalog=DTCDental;Integrated Security=True"
            Dim con As SqlConnection = New SqlConnection(connectionstrng)
            Dim cmd As New SqlCommand("dbo.sp_storedprocedure", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@pid", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@dentistid", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@aptdate", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@apttime", SqlDbType.VarChar, 50)
            cmd.Parameters("@pid").Value = pid
            cmd.Parameters("@dentistid").Value = dentistid
            cmd.Parameters("@aptdate").Value = aptdate
            cmd.Parameters("@apttime").Value = apttime
            con.Open()
            Dim row As Integer = cmd.ExecuteNonQuery()
            con.Close()
        Catch sqlExc As SqlException
            MsgBox(sqlExc.Message, MsgBoxStyle.Information, "Our servers are busy. Please try after some time")
        Catch ex As Exception
            Throw ex
        End Try
        Return True
    End Function
    Public Shared Function verifylogin(ByVal loginid As String, ByVal password As String) As Integer
        Dim pid As Integer
        Dim connectionstrng As String = "Data Source=DELL-PC;Initial Catalog=DTCDental;Integrated Security=True"
        Dim con As SqlConnection = New SqlConnection(connectionstrng)
        Dim cmd As New SqlCommand
        Dim selectSQL As String
        selectSQL = "SELECT patientid from login where loginid = ( '" & (loginid) & "' )  and password = ( '" & (password) & "')"
        pid = 0
        Try
            con.Open()
            cmd = New SqlCommand(selectSQL, con)
            cmd.ExecuteNonQuery()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If (reader.Read()) Then
                pid = reader(0)
            End If
            cmd.Dispose()
            con.Close()

        Catch ex As Exception
            Throw ex
        End Try
        Return pid
    End Function
    Public Shared Function SavePatientDetails(ByVal email As String, ByVal password As String, ByVal firstname As String, ByVal lastname As String, ByVal address As String, ByVal city As String, ByVal state As String, ByVal zipcode As String, ByVal phone As String) As Boolean
        Dim connectionstrng As String = "Data Source=DELL-PC;Initial Catalog=DTCDental;Integrated Security=True"
        Dim con As SqlConnection = New SqlConnection(connectionstrng)
        Dim cmd As New SqlCommand("dbo.[sp_SavePatientDetails]", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@firstname", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@lastname", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@phone", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@zipcode", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@address", SqlDbType.VarChar, 100)
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@city", SqlDbType.VarChar, 50)
        cmd.Parameters.Add("@state", SqlDbType.VarChar, 50)
        cmd.Parameters("@firstname").Value = firstname
        cmd.Parameters("@lastname").Value = lastname
        cmd.Parameters("@phone").Value = phone
        cmd.Parameters("@zipcode").Value = zipcode
        cmd.Parameters("@email").Value = email
        cmd.Parameters("@address").Value = address
        cmd.Parameters("@state").Value = state
        cmd.Parameters("@city").Value = city
        cmd.Parameters("@password").Value = password
        con.Open()
        Dim row As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return True
    End Function
    Public Shared Function GetAvailableAppointmentTime(ByVal appointmentdate As Date, ByVal dentistId As Integer) As List(Of String)
        Dim times As New List(Of String)
        Dim connectionstrng As String = "Server=tcp:yfvu61d6sw.database.windows.net,1433;Database=Group6_DTC;User ID=dtcdental14@yfvu61d6sw;Password=B3ckerInfo631;Trusted_Connection=False;Encrypt=True;Connection Timeout=300;"
        Dim con As SqlConnection = New SqlConnection(connectionstrng)
        Dim cmd As New SqlCommand("dbo.[sp_GetAppointmentTimes]", con)
        Try
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@date_selected", SqlDbType.Date)
            cmd.Parameters.Add("@Dentist_ID", SqlDbType.Int)
            cmd.Parameters("@date_selected").Value = appointmentdate
            cmd.Parameters("@Dentist_ID").Value = dentistId
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()

            While reader.Read
                times.Add(reader.Item("Appointment_Time"))
            End While
            con.Close()
        Catch sqlex As SqlException
            Throw sqlex
        Catch ex As Exception
            Throw ex
        End Try
        

        Return times
    End Function

    Public Shared Function updatePatientDetails(ByVal middlename As String, ByVal address As String, ByVal city As String, ByVal state As String, ByVal zipcode As String, ByVal phone As String, ByVal secphone As String, ByVal ssn As String, ByVal dob As Date) As Boolean
        Dim connectionstrng As String = "Data Source=DELL-PC;Initial Catalog=DTCDental;Integrated Security=True"
        Dim con As SqlConnection = New SqlConnection(connectionstrng)
        Dim cmd As New SqlCommand("dbo.[sp_SavePatientDetails]", con)
        cmd.CommandType = CommandType.StoredProcedure
        Try
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@middlename", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@ssn", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@phone", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@secphone", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@zipcode", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@address", SqlDbType.VarChar, 100)
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@state", SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@dob", SqlDbType.Date)
            cmd.Parameters.Add("@pid", SqlDbType.Int)
            cmd.Parameters("@middlename").Value = middlename
            cmd.Parameters("@ssn").Value = ssn
            cmd.Parameters("@phone").Value = phone
            cmd.Parameters("@zipcode").Value = zipcode
            cmd.Parameters("@secphone").Value = secphone
            cmd.Parameters("@address").Value = address
            cmd.Parameters("@state").Value = state
            cmd.Parameters("@city").Value = city
            cmd.Parameters("@dob").Value = dob
            cmd.Parameters("@pid").Value = GlobalClass.Globalpid
            con.Open()
            Dim row As Integer = cmd.ExecuteNonQuery()
            con.Close()
        Catch sqlex As SqlException
            Throw sqlex
        Catch ex As Exception
            Throw ex
        End Try

        Return True
    End Function

End Class
