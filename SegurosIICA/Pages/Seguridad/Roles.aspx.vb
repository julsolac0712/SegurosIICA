Imports System.Data.SqlClient

Public Class Roles
    Inherits Base_Page

    Private dataSetArbol As System.Data.DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("Admin") Is Nothing Then
        Else
        End If
    End Sub

#Region "Acciones Grid"
    Protected Sub gv_Roles_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Roles.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                    btn = CType(e.Row.FindControl("lnk_Opciones"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Roles - Created")
        End Try
    End Sub
    Protected Sub gv_Roles_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Roles.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Roles - Deleted")
        End If
    End Sub
    Protected Sub gv_Roles_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Roles.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Roles - Update")
        End If
    End Sub
    Protected Sub gv_Roles_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Roles.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub

    Protected Sub gv_Roles_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_Roles.RowCommand
        Dim values() As String

        If e.CommandName.Equals("Opciones") Then

            values = Split(e.CommandArgument, ",")

            Dim rowIndex As Integer = Integer.Parse(values(0))

            hdf_Rol.Value = gv_Roles.DataKeys(rowIndex)("id_Rol")

            pnl_Roles.Visible = True

            If e.CommandArgument IsNot Nothing Then
                lcl_Usuario.Text = values(1)
            End If


            sqlDS_MainMenu.DataBind()
            CargarOpciones()

            gv_Roles.DataBind()


        End If
    End Sub

#End Region

    Protected Sub chkList_MainMenu_SelectedIndexChanged(sender As Object, e As EventArgs) Handles chkList_MainMenu.SelectedIndexChanged
        Dim i As Integer

        For i = 0 To chkList_MainMenu.Items.Count - 1

            If chkList_MainMenu.Items(i).Selected = True Then

                AccesoDatos.ActualizaRol(chkList_MainMenu.Items(i).Value, 1, hdf_Rol.Value, 1)

            Else
                AccesoDatos.ActualizaRol(chkList_MainMenu.Items(i).Value, 1, hdf_Rol.Value, 0)

            End If
        Next
    End Sub

    Private Sub CargarOpciones()
        Dim ds_datosSin As New DataSet
        Dim dt_dtSin As DataTable

        ds_datosSin = AccesoDatos.Get_OpcionesRoles(hdf_Rol.Value, 3)
        dt_dtSin = ds_datosSin.Tables("Table")
        If dt_dtSin.Rows.Count > 0 Then
            For vAN_Indice As Integer = 0 To dt_dtSin.Rows.Count - 1
                For Each item As ListItem In chkList_MainMenu.Items
                    If dt_dtSin.Rows(vAN_Indice).Item("Activo").ToString = "1" Then
                        item.Selected = True
                    End If
                Next
            Next vAN_Indice
        End If
    End Sub

End Class