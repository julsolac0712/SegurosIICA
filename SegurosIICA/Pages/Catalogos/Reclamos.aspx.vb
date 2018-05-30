Public Class Reclamos
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


        End If
    End Sub

    Protected Sub gv_Reclamos_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Reclamos.RowCreated
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
                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos en Reclamos")
        End Try
    End Sub

    Protected Sub gv_Reclamos_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Reclamos.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Reclamos")
        End If
    End Sub

    Protected Sub gv_Reclamos_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Reclamos.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Reclamos")
        End If
    End Sub

    Protected Sub gv_Reclamos_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Reclamos.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub
End Class