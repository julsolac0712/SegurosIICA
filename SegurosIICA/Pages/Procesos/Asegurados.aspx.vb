Public Class Asegurados
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


        Else
            hdf_Asegurado.Value = ViewState("id")
            hdf_Familiar.Value = ViewState("id_Familiar")
        End If
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

                If IsDBNull(ds.Rows.Item(0)("lastUpdate")) = False Then
                    hdf_lastUpdate.Value = ds.Rows.Item(0)("lastUpdate").ToString
                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error al cargar Obervaciones")
            Session("Error") = ""
            Response.Redirect("~/pages/ErrorGeneral.aspx", False)
        End Try

    End Sub


#Region "Datos Asegurados"
    Protected Sub gv_Asegurados_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Asegurados.RowCreated
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

                    btn = CType(e.Row.FindControl("lnk_Detalle"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos en Autos")
        End Try
    End Sub

    Protected Sub gv_Asegurados_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Asegurados.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Asegurados_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Asegurados.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Asegurados_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Asegurados.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub

    Protected Sub gv_Asegurados_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_Asegurados.RowCommand
        Dim values() As String

        If e.CommandName.Equals("Detalle") Then

            values = Split(e.CommandArgument, ",")

            Dim rowIndex As Integer = Integer.Parse(values(0))

            hdf_Asegurado.Value = gv_Asegurados.DataKeys(rowIndex)("id_Asegurado")

            pnl_Detalle.Visible = True

            If e.CommandArgument IsNot Nothing Then
                lcl_Funcionario.Text = gv_Asegurados.DataKeys(rowIndex)("NombreCompleto")
            End If

            gv_Coberturas.DataBind()
            gv_CoberturasFamiliares.DataBind()
            gv_Familiares.DataBind()

            CargaObservaciones()

            ViewState("id") = hdf_Asegurado.Value

        End If
    End Sub

    Protected Sub sqlDS_DatosAsegurado_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sqlDS_DatosAsegurado.Updated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Tipo Ambito - Update")
        End If
    End Sub

    Protected Sub fv_DatosAsegurado_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles fv_DatosAsegurado.ItemUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Datos Asegurado")
        End If
    End Sub

#End Region

#Region "Coberturas"
    Protected Sub gv_Coberturas_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Coberturas.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Cobertura"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Cobertura"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Cobertura"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos en Coberturas")
        End Try
    End Sub

    Protected Sub gv_Coberturas_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Coberturas.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Coberturas_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Coberturas.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos en Autos")
        End If
    End Sub

    Protected Sub gv_Coberturas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Coberturas.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionCoberturas.Value = 1
        Else
            hdf_OperacionCoberturas.Value = 2
        End If
    End Sub
#End Region

#Region "Familiares"
    Protected Sub gv_Familiares_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Familiares.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton
                    Dim lbl As Label

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Familiar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Familiar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Familiar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                    btn = CType(e.Row.FindControl("lnk_Coberturas_Familiar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    lbl = CType(e.Row.FindControl("lbl_CodAseguradoGrupo"), Label)
                    If Not btn Is Nothing Then
                        lbl.Visible = False
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos Familiares")
        End Try
    End Sub

    Protected Sub gv_Familiares_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Familiares.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos Familiares")
        End If
    End Sub

    Protected Sub gv_Familiares_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Familiares.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos Familiares")
        End If
    End Sub

    Protected Sub gv_Familiares_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Familiares.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionFamiliar.Value = 1
        Else
            hdf_OperacionFamiliar.Value = 2
        End If
    End Sub
#End Region

#Region "Acciones Generales"
    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        lnkBtn_EditarID.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles lnkBtn_EditarID.Click
        fv_DatosAsegurado.ChangeMode(FormViewMode.Edit)
        ' lnkBtn_EditarID.Visible = False
    End Sub

    Protected Sub lnkBtn_Observaciones_Click(sender As Object, e As EventArgs) Handles lnkBtn_Observaciones.Click
        Try

            sqlDS_Observaciones.Update()

        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos en Observaciones")
        End Try
    End Sub

#End Region

#Region "Coberturas Familiares"
    Protected Sub gv_CoberturasFamiliares_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_CoberturasFamiliares.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_CoberturaFam"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_CoberturaFam"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_CoberturaFam"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Datos de Coberturas Familiares")
        End Try
    End Sub

    Protected Sub gv_CoberturasFamiliares_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_CoberturasFamiliares.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Coberturas Familiares")
        End If
    End Sub

    Protected Sub gv_CoberturasFamiliares_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_CoberturasFamiliares.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Datos de Coberturas Familiares")
        End If
    End Sub

    Protected Sub gv_CoberturasFamiliares_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_CoberturasFamiliares.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionCoberturaFamiliar.Value = 1
        Else
            hdf_OperacionCoberturaFamiliar.Value = 2
        End If
    End Sub

    Protected Sub gv_Familiares_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_Familiares.RowCommand
        Dim values() As String
        ' Dim codigo As String


        If e.CommandName.Equals("Detalle_Familiar") Then

            values = Split(e.CommandArgument, ",")

            Dim rowIndex As Integer = Integer.Parse(values(0))

            hdf_Familiar.Value = gv_Familiares.DataKeys(rowIndex)("id_Familiar")

            pnl_SegurosFamiliares.Visible = True

            If e.CommandArgument IsNot Nothing Then

                ' codigo = CType(gv_Familiares.DataKeys(rowIndex)("CodAseguradoGrupo"), String)
                lcl_NombreFamiliar.Text = gv_Familiares.DataKeys(rowIndex)("NombreCompleto")
            End If
            gv_CoberturasFamiliares.DataBind()
            gv_Familiares.DataBind()

            ViewState("id_Familiar") = hdf_Familiar.Value

        End If
    End Sub

#End Region

#Region "Filtros"
    Protected Sub ddl_SedeFiltro_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_SedeFiltro.SelectedIndexChanged
        pnl_Detalle.Visible = False
    End Sub

    Protected Sub ddl_ClaseFiltro_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_ClaseFiltro.SelectedIndexChanged
        pnl_Detalle.Visible = False
    End Sub

#End Region

End Class