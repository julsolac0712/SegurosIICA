Imports System.Data
Imports Generic
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization

Public Class Base_Page
    Inherits System.Web.UI.Page

    Protected AccesoDatos As New Seguros_Utility(ConfigurationManager.ConnectionStrings("SegurosConnectionString").ToString())
    Protected AccesoDatosAPPS As New Seguros_Utility(ConfigurationManager.ConnectionStrings("APPSConnection").ToString)
    Protected gestorCorreos As New Generic.Mailing(ConfigurationManager.AppSettings("AdminMail"), "Seguros", ConfigurationManager.AppSettings("ServerMail"), CType(ConfigurationManager.AppSettings.Get("ServerMailPort"), Integer))
    Protected Encryptor As New Encryptor.Encryptor()
    Protected Cookies As New Cookies()
    Protected Gestor_Errores As New Error_Handling.Error_Handling(ConfigurationManager.AppSettings("LogPath"))
    Protected IDIntranet As Integer?

    'Inicializa las culturas
    Protected Overrides Sub InitializeCulture()
        MyBase.InitializeCulture()
        'If (Not String.IsNullOrEmpty(Request("lang"))) Then
        '    Session("lang") = Request("lang")
        'End If

        If (String.IsNullOrEmpty(Session("lang"))) Then
            Session("lang") = "es"
        End If

        Dim lang As String = Convert.ToString(Session("lang"))
        Dim culture As String = String.Empty

        If (lang.ToLower().CompareTo("es") = 0 Or String.IsNullOrEmpty(lang)) Then
            culture = "es-CR"
        Else
            If (lang.ToLower().CompareTo("en") = 0) Then
                culture = "en-US"
            End If
        End If

        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(culture)
        Thread.CurrentThread.CurrentUICulture = New CultureInfo(culture)
    End Sub


#Region "Validaciones"

    Protected Sub Get_Cookie_Intranet()
        Dim cookieIntranet = Cookies.getCookie(Request.Cookies, "UsrIntranet")
        If Not String.IsNullOrEmpty(cookieIntranet) Then
            IDIntranet = CType(cookieIntranet, Integer)
        End If
    End Sub

    Protected Function Get_SIOR_ID(ByVal idIntranet As Integer) As String
        Dim SIORID As String = String.Empty
        Dim lector As SqlDataReader = AccesoDatos.Get_SIOR_Usuario(idIntranet)
        If lector.HasRows Then
            While lector.Read()
                SIORID = lector.GetInt32(lector.GetOrdinal("ID_Funcionario")).ToString()
            End While
        End If
        Return SIORID
    End Function

    Protected Function DescargarArchivo(ByVal path As String) As Boolean
        Dim objFileInfo As System.IO.FileInfo
        Try
            If (Not (System.IO.File.Exists(path))) Then
                Session("StatusError") = "<p>El archivo a generar no existe. Favor comuníquese con su Administrador</p>"
                Return False
            End If

            objFileInfo = New System.IO.FileInfo(path)
            Response.Clear()

            Response.AddHeader("Content-Disposition", "attachment; filename=" + objFileInfo.Name)
            Response.AddHeader("Content-Length", Convert.ToString(objFileInfo.Length))

            Response.ContentType = "application/octet-stream"
            Response.WriteFile(objFileInfo.FullName)
        Catch ex As Exception
            Return False
        Finally
            Response.End()
        End Try
        Return True
    End Function

    Protected Function TieneArchivo(ByVal nombre As Object) As Boolean
        If (Not IsDBNull(nombre)) Then
            If (Not String.IsNullOrEmpty(nombre)) Then
                Return True
            End If
        End If
        Return False
    End Function

#End Region

End Class
