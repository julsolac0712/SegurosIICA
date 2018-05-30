Public Class ParametrosGenerales
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            CargarDatos()

        End If

    End Sub

    Sub CargarDatos()

        Try
            Dim dView As New DataView
            dView = CType(sqlDS_Parametros.Select(DataSourceSelectArguments.Empty), DataView)
            Dim ds As New DataTable
            ds = dView.Table
            If ds.Rows.Count <> 0 Then

                ' ----------------------Datos de Parametros---------------------
                If IsDBNull(ds.Rows.Item(0)("Cta_Catie")) = False Then
                    txt_cta_CATIE.Text = ds.Rows.Item(0)("Cta_Catie").ToString
                Else
                    txt_cta_CATIE.Text = ""
                End If
                If IsDBNull(ds.Rows.Item(0)("CC_Catie")) = False Then
                    txt_CC.Text = ds.Rows.Item(0)("CC_Catie").ToString
                Else
                    txt_CC.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("id_Fondo_Catie")) = False Then
                    ddl_Fondo.SelectedValue = ds.Rows.Item(0)("id_Fondo_Catie").ToString
                Else
                    ddl_Fondo.SelectedValue = 0
                End If

                If IsDBNull(ds.Rows.Item(0)("PEP_Catie")) = False Then
                    txt_PEP.Text = ds.Rows.Item(0)("PEP_Catie").ToString
                Else
                    txt_PEP.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("Cta_Exfuncionarios")) = False Then
                    txt_cta_Exfun.Text = ds.Rows.Item(0)("Cta_Exfuncionarios").ToString
                Else
                    txt_cta_Exfun.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("CC_Exfuncionarios")) = False Then
                    txt_CC_Exfun.Text = ds.Rows.Item(0)("CC_Exfuncionarios").ToString
                Else
                    txt_CC_Exfun.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("id_Fondo_Exfuncionarios")) = False Then
                    ddl_Fondo_Exfun.SelectedValue = ds.Rows.Item(0)("id_Fondo_Exfuncionarios").ToString
                Else
                    ddl_Fondo_Exfun.SelectedValue = 0
                End If

                If IsDBNull(ds.Rows.Item(0)("Cta_Autos")) = False Then
                    txt_cta_Autos.Text = ds.Rows.Item(0)("Cta_Autos").ToString
                Else
                    txt_cta_Autos.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("Cta_Obligatorios")) = False Then
                    txt_cta_Obligatorio.Text = ds.Rows.Item(0)("Cta_Obligatorios").ToString
                Else
                    txt_cta_Obligatorio.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("FactorObligatorio")) = False Then
                    txt_factor.Text = ds.Rows.Item(0)("FactorObligatorio").ToString
                Else
                    txt_factor.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("Cta_VoluntariosPatrono")) = False Then
                    txt_cta_Voluntario.Text = ds.Rows.Item(0)("Cta_VoluntariosPatrono").ToString
                Else
                    txt_cta_Voluntario.Text = ""
                End If

                If IsDBNull(ds.Rows.Item(0)("Cta_Voluntarios")) = False Then
                    txt_cta_Voluntario2.Text = ds.Rows.Item(0)("Cta_Voluntarios").ToString
                Else
                    txt_cta_Voluntario2.Text = ""
                End If


            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error al cargar Parametros")
            Session("Error") = ""
            Response.Redirect("~/pages/ErrorGeneral.aspx", False)
        End Try


    End Sub

    Protected Sub lnkBtn_Guardar_Click(sender As Object, e As EventArgs) Handles lnkBtn_Guardar.Click
        Try

            sqlDS_Parametros.Update()

        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error al actualizar Parametros")
            Session("Error") = ""
            Response.Redirect("~/pages/ErrorGeneral.aspx", False)
        Finally
            CargarDatos()

        End Try
    End Sub
End Class