Imports System.Net.Mail
Imports System.Configuration

Public Class Mailing

    Private CuentaSistema As Net.Mail.MailAddress
    Private _Host As String
    Private _Port As Integer

    Public Sub New(ByVal adminMail As String, ByVal appName As String, ByVal host As String, ByVal port As Integer)
        CuentaSistema = New MailAddress(adminMail, appName)
        _Host = host
        _Port = port
    End Sub

    Public Function EnvioCorreo(ByVal subject As String, ByVal cuerpoCorreo As String, ByVal correoSolicitante As String, ByVal correosCopia As String) As Boolean

        Dim correo As New Net.Mail.MailMessage

        Dim smtp As New SmtpClient
        smtp.Host = _Host
        smtp.Port = _Port
        '--------- ENVIO CORREO AL SOLICITANTE ----------------
        correo.From = CuentaSistema
        correo.IsBodyHtml = True
        correo.Subject = subject
        Try
            correo.To.Add(correoSolicitante)
            If correosCopia <> "" Then
                correo.CC.Add(correosCopia)
            End If
        Catch e As Exception
            correo.To.Clear()
            correo.CC.Clear()
            correo.To.Add(CuentaSistema)
            correo.Subject += "_ERROR al enviar este Correo:" + correo.ToString
            smtp.Send(correo)
            Return False
        End Try
        correo.Body = cuerpoCorreo
        Try
            smtp.Send(correo)
            correo.To.Clear()
            Return True
        Catch ex As Exception

            correo.To.Clear()
            correo.CC.Clear()
            correo.To.Add(CuentaSistema)
            correo.Subject += "_ERROR al enviar este Correo"
            smtp.Send(correo)
            Throw New Exception(ex.Message)
            Return False
        End Try
    End Function
End Class
