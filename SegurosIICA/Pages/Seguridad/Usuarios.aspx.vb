Public Class Usuarios
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("Admin") Is Nothing Then
        Else
        End If
    End Sub

#Region "Grid Usuarios"
    Protected Sub gv_Usuarios_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Usuarios.RowCreated
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

                    btn = CType(e.Row.FindControl("lnk_Roles"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos de Usuario")
        End Try
    End Sub
    Protected Sub gv_Usuarios_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Usuarios.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Usuario")
        End If
    End Sub
    Protected Sub gv_Usuarios_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Usuarios.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub
    Protected Sub gv_Usuarios_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Usuarios.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Usuario")
        End If
    End Sub
    Protected Sub ddl_Funcionario_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim ddl As DropDownList = DirectCast(sender, DropDownList)

        hdf_ID.Value = ddl.SelectedValue


    End Sub
    Protected Sub gv_Usuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_Usuarios.RowCommand

        Dim values() As String

        If e.CommandName.Equals("Roles") Then

            values = Split(e.CommandArgument, ",")

            Dim rowIndex As Integer = Integer.Parse(values(0))

            hdf_ID.Value = gv_Usuarios.DataKeys(rowIndex)("id_Usuario")

            pnl_Roles.Visible = True

            If e.CommandArgument IsNot Nothing Then
                lcl_Usuario.Text = values(1)
            End If

            gv_Roles.DataBind()

        End If
    End Sub
#End Region
#Region "Grid Roles x Usuario"
    Protected Sub gv_Roles_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Roles.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Rol_Eliminar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Rol_Editar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Rol_Agregar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If



                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos de Roles por Usuario")
        End Try
    End Sub
    Protected Sub gv_Roles_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Roles.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacionrol.Value = 1
        Else
            hdf_Operacionrol.Value = 2
        End If
    End Sub
    Protected Sub gv_Roles_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Roles.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Roles por Usuario")
        End If
    End Sub
    Protected Sub gv_Roles_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Roles.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Roles por Usuario")
        End If
    End Sub
#End Region

End Class