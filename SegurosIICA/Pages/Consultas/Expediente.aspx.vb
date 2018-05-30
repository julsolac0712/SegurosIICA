Public Class Expediente
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub gv_Asegurados_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_Asegurados.RowCommand

        Dim values() As String

        If e.CommandName.Equals("Detalle") Then

            values = Split(e.CommandArgument, ",")

            Dim rowIndex As Integer = Integer.Parse(values(0))

            hdf_Asegurado.Value = gv_Asegurados.DataKeys(rowIndex)("id_Asegurado")

            pnl_Detalle.Visible = True

            'gv_Coberturas.DataBind()
            'gv_CoberturasFamiliares.DataBind()
            'gv_Familiares.DataBind()

            'CargaObservaciones()

            pnl_Asegurados.Visible = False

            ViewState("id") = hdf_Asegurado.Value

        End If

    End Sub

    Protected Sub lnkBtn_Regresar_Click(sender As Object, e As EventArgs) Handles lnkBtn_Regresar.Click
        pnl_Asegurados.Visible = True
        pnl_Detalle.Visible = False

    End Sub

    Sub CargaObservaciones()

        Try
            Dim dView As New DataView
            dView = CType(sqlDS_Observaciones.Select(DataSourceSelectArguments.Empty), DataView)
            Dim ds As New DataTable
            ds = dView.Table
            If ds.Rows.Count <> 0 Then

                If IsDBNull(ds.Rows.Item(0)("Observaciones")) = False Then
                    txt_Observaciones.Text = ds.Rows.Item(0)("Observaciones").ToString
                Else
                    txt_Observaciones.Text = ""
                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error al cargar Obervaciones")
            Session("Error") = ""
            Response.Redirect("~/pages/ErrorGeneral.aspx", False)
        End Try

    End Sub

End Class