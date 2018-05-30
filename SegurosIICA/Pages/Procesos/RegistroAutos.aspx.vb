Public Class RegistroAutos
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub gv_Autos_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Autos.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton
                    Dim lbl As Label
                    Dim pnl As Panel

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

                    pnl = CType(e.Row.FindControl("pnl_Generales"), Panel)
                    If Not pnl Is Nothing Then
                        pnl.Visible = False
                    End If

                    pnl = CType(e.Row.FindControl("pnl_Numeracion"), Panel)
                    If Not pnl Is Nothing Then
                        pnl.Visible = False
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos en Autos")
        End Try
    End Sub

    Protected Sub gv_Autos_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Autos.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Autos_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Autos.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Autos_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Autos.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub
End Class