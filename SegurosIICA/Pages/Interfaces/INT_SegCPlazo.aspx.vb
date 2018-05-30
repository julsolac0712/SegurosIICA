Imports System.IO
Public Class INT_SegCPlazo
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lnk_Cargar.Attributes.Add("onclick", "document.getElementById('" + fu_Cargar.ClientID + "').click(); return false;")
    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim folderPath As String = Server.MapPath("~/Files/")
        If Not Directory.Exists(folderPath) Then
            Directory.CreateDirectory(folderPath)
        End If

        fu_Cargar.SaveAs(folderPath & Path.GetFileName(fu_Cargar.FileName))
        '   lblMessage.Text = Path.GetFileName(fu_Cargar.FileName) + " ha sido cargado."
    End Sub
End Class