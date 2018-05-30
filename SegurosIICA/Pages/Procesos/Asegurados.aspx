<%@ Page Title="Asegurados" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Asegurados.aspx.vb" Inherits="SegurosIICA.Asegurados" MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/jscript" language="javascript">
        function textboxMultilineMaxNumber(txt, maxLen) {
            try {
                if (txt.value.length > (maxLen - 1))

                    return false;
            } catch (e) {
            }
        }
    </script>
    <script type="text/jscript" language="javascript">
        function contarLetras(txt, lbl) {
            lbl.value = txt.value.length
        }
    </script>
    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />
    <asp:HiddenField ID="hdf_Asegurado" runat="server" />
    <asp:HiddenField ID="hdf_Familiar" runat="server" />
    <asp:HiddenField ID="hdf_lastUpdate" runat="server" />
    <asp:SqlDataSource ID="sqlDS_Observaciones" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Info_Asegurado" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Asegurados" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
            <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="4" Name="Operacion" Type="Int32" />
            <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="txt_Observaciones" Name="Observaciones" PropertyName="Text" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Registro de Asegurados"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">
        <asp:Panel ID="pnl_Asegurados" runat="server">

            <div class="row margin-top-10 margin-bottom-30">
                <div class="col-md-2">
                    <asp:Localize ID="lcl_SedeFiltro" runat="server" Text="Filtrar por Sede"></asp:Localize>
                    <asp:DropDownList ID="ddl_SedeFiltro" runat="server" CssClass="form-control" DataSourceID="sqlDS_SedeFiltro" DataTextField="Nombre" DataValueField="id_Sedes" Width="100%" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="sqlDS_SedeFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Sedes" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-2">
                    <asp:Localize ID="lcl_ClaseFiltro" runat="server" Text="Filtrar por Clase"></asp:Localize>
                    <asp:DropDownList ID="ddl_ClaseFiltro" runat="server" CssClass="form-control" DataSourceID="sqlDS_ClaseFiltro" DataTextField="Descripcion" DataValueField="id_Clases" Width="98%" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="sqlDS_ClaseFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Clases" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-8">

                </div>
            </div>

            <asp:GridView ID="gv_Asegurados" runat="server" CssClass="table table-bordered" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlDS_Asegurados" DataKeyNames="id_Asegurado,NombreCompleto,lastUpdate">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Asegurado" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-saved glyphicons-iica"></span></asp:LinkButton>
                            <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-remove glyphicons-iica"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                            <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                            <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                            <asp:LinkButton ID="lnk_Detalle" runat="server" ClientIDMode="AutoID" CommandName="Detalle" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") & "," & Eval("id_Asegurado") %>' ToolTip="Detalle Asegurado" CssClass="btn btn-default"><span class="glyphicon glyphicon-list-alt glyphicons-iica"></span></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cod_Asegurado" SortExpression="Cod_Asegurado">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_CodAsegurado" runat="server" Text='<%# Bind("Cod_Asegurado") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_CodAsegurado" runat="server" Display="Dynamic" cssclass="error-span" ErrorMessage="Campo Obligatorio" ValidationGroup="Asegurado" ControlToValidate="txt_CodAsegurado" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_CodAsegurado" runat="server" Text='<%# Eval("Cod_Asegurado") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Nombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido1" SortExpression="Apellido1">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Apellido1" runat="server" Text='<%# Bind("Apellido1") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Apellido1" runat="server" Text='<%# Eval("Apellido1") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido2" SortExpression="Apellido2">
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_Apellido2" runat="server" Text='<%# Bind("Apellido2") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Apellido2" runat="server" Text='<%# Eval("Apellido2") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sede" SortExpression="Sede">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_Sede" runat="server" CssClass="form-control" DataSourceID="sqlDS_Sede" DataTextField="Nombre" DataValueField="id_Sedes" SelectedValue='<%# Bind("FK_id_Sedes") %>' Width="98%"></asp:DropDownList>
                            <asp:SqlDataSource ID="sqlDS_Sede" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Sedes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="rfv_Sede" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="ddl_Sede" ValidationGroup="Asegurado" InitialValue="0" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Sede" runat="server" Text='<%# Eval("Sede") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="15%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clase" SortExpression="Clase">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_Clase" runat="server" CssClass="form-control" DataSourceID="sqlDS_Clase" DataTextField="Descripcion" DataValueField="id_Clases" SelectedValue='<%# Bind("FK_id_Clases") %>' Width="98%"></asp:DropDownList>
                            <asp:SqlDataSource ID="sqlDS_Clase" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Clases" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="rfv_Clase" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="ddl_Clase" cssclass="error-span" Display="Dynamic" InitialValue="0" ValidationGroup="Asegurado" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Clase" runat="server" Text='<%# Eval("Clase") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="15%" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination-ys" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqlDS_Asegurados" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Asegurados" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Asegurados" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_PRO_Man_Asegurados" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Asegurados" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                    <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                    <asp:Parameter Name="Cod_Asegurado" Type="Int32" />
                    <asp:Parameter Name="FK_id_Clases" Type="Int32" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido1" Type="String" />
                    <asp:Parameter Name="Apellido2" Type="String" />
                    <asp:Parameter Name="FK_id_Sedes" Type="Int32" />
                    <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                    <asp:ControlParameter ControlID="ddl_SedeFiltro" Name="SedeFiltro" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddl_ClaseFiltro" Name="ClaseFiltro" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                    <asp:Parameter Name="Cod_Asegurado" Type="Int32" />
                    <asp:Parameter Name="FK_id_Clases" Type="Int32" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido1" Type="String" />
                    <asp:Parameter Name="Apellido2" Type="String" />
                    <asp:Parameter Name="FK_id_Sedes" Type="Int32" />
                    <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="pnl_Detalle" runat="server" Visible="false">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#0" data-toggle="tab">
                    <asp:Localize ID="lcl_Generales" runat="server" Text="Generales"></asp:Localize></a>
                </li>
                <li><a href="#1" data-toggle="tab">
                    <asp:Localize ID="lcl_Coberturas" runat="server" Text="Coberturas"></asp:Localize></a>
                </li>
                <li><a href="#2" data-toggle="tab">
                    <asp:Localize ID="lcl_Familiares" runat="server" Text="Familiares"></asp:Localize></a>
                </li>
                <li><a href="#3" data-toggle="tab">
                    <asp:Localize ID="lcl_Observaciones" runat="server" Text="Observaciones"></asp:Localize></a>
                </li>
            </ul>

            <div class="tab-content margin-top-30">
                <div class="tab-pane  active" id="0">
                    <span class="page-titles">
                        <asp:Localize ID="lcl_Funcionario" runat="server"></asp:Localize>
                    </span>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <span class="page-titles">
                                <asp:Localize ID="lcl_DatosAsegurado" runat="server" Text="Datos Generales del Asegurado"></asp:Localize>
                            </span>

                            <asp:LinkButton runat="server" class="btn edit-profile" ID="lnkBtn_EditarID" ToolTip="Editar">
                                <span class="glyphicon glyphicon-pencil imagen-edit-profile"></span>
                            </asp:LinkButton>
                            <div class="margin-top-30">

                                <asp:FormView ID="fv_DatosAsegurado" runat="server" DataKeyNames="id_Asegurado, lastUpdate" DataSourceID="sqlDS_DatosAsegurado" Width="100%">
                                    <EditItemTemplate>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Tipo" runat="server" Text="Tipo:" AssociatedControlID="ddl_Tipo"></asp:Label>
                                                <asp:DropDownList ID="ddl_Tipo" runat="server" CssClass="form-control" SelectedValue='<%# Bind("TipoFuncionario") %>' Width="98%">
                                                    <asp:ListItem Value="0" Text="-- Seleccionar --"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="IICA"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="CATIE"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Otro"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Email" runat="server" Text="Email:" AssociatedControlID="txt_Email"></asp:Label>
                                                <asp:TextBox ID="txt_Email" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" Width="98%" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Cargo" runat="server" Text="Cargo:" AssociatedControlID="txt_Cargo"></asp:Label>
                                                <asp:TextBox ID="txt_Cargo" runat="server" Text='<%# Bind("CargoAsegurado") %>' CssClass="form-control" Width="98%" />
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Nacimiento" runat="server" Text="Fec. Nacimiento:" AssociatedControlID="txt_Nacimiento"></asp:Label>
                                                <asp:TextBox ID="txt_Nacimiento" runat="server" Text='<%# Bind("FechaNacimiento", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                              
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Telefono" runat="server" Text="Teléfono:" AssociatedControlID="txt_Telefono"></asp:Label>
                                                <asp:TextBox ID="txt_Telefono" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control" Width="98%" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_FechaIngIICA" runat="server" Text="Ingreso al IICA:" AssociatedControlID="txt_FechaIngresoIICA"></asp:Label>
                                                <asp:TextBox ID="txt_FechaIngresoIICA" runat="server" Text='<%# Bind("FechaIngresoIICA", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_FechaSalidaIICA" runat="server" Text="Salida del IICA:" AssociatedControlID="txt_FechaSalidaIICA"></asp:Label>
                                                <asp:TextBox ID="txt_FechaSalidaIICA" runat="server" Text='<%# Bind("FechaSalidaIICA", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_FechaIngresoRetirado" runat="server" Text="Ingreso Retirado:" AssociatedControlID="txt_FechaIngresoRetirado"></asp:Label>
                                                <asp:TextBox ID="txt_FechaIngresoRetirado" runat="server" Text='<%# Bind("FechaIngresoRetirado", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Salario" runat="server" Text="Salario:" AssociatedControlID="txt_Salario"></asp:Label>
                                                <asp:TextBox ID="txt_Salario" runat="server" Text='<%# Bind("Salario", "{0:N}") %>' CssClass="form-control" Width="98%" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_SalarioFecha" runat="server" Text="Actualización de Salario:" AssociatedControlID="txt_SalarioFechaActualizacion"></asp:Label>
                                                <asp:TextBox ID="txt_SalarioFechaActualizacion" runat="server" Text='<%# Bind("SalarioFechaActualizacion", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_EstadoCivil" runat="server" Text="Casado S/N:" AssociatedControlID="chkb_EstadoCivil"></asp:Label>
                                                <asp:CheckBox ID="chkb_EstadoCivil" runat="server" Checked='<%# Bind("EstadoCivil") %>' />

                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_Sapiens" runat="server" Text="Sapiens:" AssociatedControlID="chkb_Sapiens"></asp:Label>
                                                <asp:CheckBox ID="chkb_Sapiens" runat="server" Checked='<%# Bind("Sapiens") %>' />

                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_CtaPresupuesto" runat="server" Text="Cuenta Presupuestaria:" AssociatedControlID="txt_Cuenta"></asp:Label>
                                                <asp:TextBox ID="txt_Cuenta" runat="server" Text='<%# Bind("CuentaPresupuesto") %>' CssClass="form-control" Width="98%" />
                                            </div>
<%--                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_LicenciaDesde" runat="server" Text="Licencia Desde:" AssociatedControlID="txt_LicenciaDesde"></asp:Label>
                                                <asp:TextBox ID="txt_LicenciaDesde" runat="server" Text='<%# Bind("LicenciaDesde", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_txt_LicenciaHasta" runat="server" Text="Licencia Hasta:" AssociatedControlID="txt_LicenciaHasta"></asp:Label>
                                                <asp:TextBox ID="txt_LicenciaHasta" runat="server" Text='<%# Bind("LicenciaHasta", "{0:d}") %>' CssClass="form-control" Width="98%" TextMode="Date" />
                                            </div>--%>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="row margin-top-10">
                                            <div class="col-md-2">
                                                <asp:Button ID="btn_Guardar_Edit" runat="server" Text="Guardar Formulario" CssClass="btn btn-iica-green" CommandName="Update" CausesValidation="true" ValidationGroup="Registro" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" CssClass="btn btn-iica-green" CommandName="Cancel" OnClick="btn_Cancelar_Click" />
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Tipo" runat="server" Text="Tipo:" AssociatedControlID="ltl_Tipo"></asp:Label>
                                                <asp:Literal ID="ltl_Tipo" runat="server" Text='<%# Eval("Tipo") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Email" runat="server" Text="Email:" AssociatedControlID="ltl_Email"></asp:Label>
                                                <asp:Literal ID="ltl_Email" runat="server" Text='<%# Eval("Email") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Cargo" runat="server" Text="Cargo:" AssociatedControlID="ltl_Cargo"></asp:Label>
                                                <asp:Literal ID="ltl_Cargo" runat="server" Text='<%# Eval("CargoAsegurado") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Nacimiento" runat="server" Text="Fec.Nacimiento:" AssociatedControlID="ltl_Nacimiento"></asp:Label>
                                                <asp:Literal ID="ltl_Nacimiento" runat="server" Text='<%# Eval("FechaNacimiento", "{0:d}") %>' />
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Telefono" runat="server" Text="Teléfono:" AssociatedControlID="ltl_Telefono"></asp:Label>
                                                <asp:Literal ID="ltl_Telefono" runat="server" Text='<%# Eval("Telefono") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_FechaIngIICA" runat="server" Text="Ingreso al IICA:" AssociatedControlID="ltl_FechaIngresoIICA"></asp:Label>
                                                <asp:Literal ID="ltl_FechaIngresoIICA" runat="server" Text='<%# Eval("FechaIngresoIICA", "{0:d}") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_FechaSalidaIICA" runat="server" Text="Salida del IICA:" AssociatedControlID="ltl_FechaSalidaIICA"></asp:Label>
                                                <asp:Literal ID="ltl_FechaSalidaIICA" runat="server" Text='<%# Eval("FechaSalidaIICA", "{0:d}") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_FechaIngresoRetirado" runat="server" Text="Ingreso Retirado:" AssociatedControlID="ltl_FechaIngresoRetirado"></asp:Label>
                                                <asp:Literal ID="ltl_FechaIngresoRetirado" runat="server" Text='<%# Eval("FechaIngresoRetirado", "{0:d}") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Salario" runat="server" Text="Salario:" AssociatedControlID="ltl_Salario"></asp:Label>
                                                <asp:Literal ID="ltl_Salario" runat="server" Text='<%# Eval("Salario", "{0:N}") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_SalarioFecha" runat="server" Text="Actualización de Salario:" AssociatedControlID="ltl_SalarioFechaActualizacion"></asp:Label>
                                                <asp:Literal ID="ltl_SalarioFechaActualizacion" runat="server" Text='<%# Eval("SalarioFechaActualizacion", "{0:d}") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_EstadoCivil" runat="server" Text="Casado S/N:" AssociatedControlID="chkb_EstadoCivil_1"></asp:Label>
                                                <asp:CheckBox ID="chkb_EstadoCivil_1" runat="server" Checked='<%# Eval("EstadoCivil") %>' Enabled="false" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Sapiens" runat="server" Text="Sapiens:" AssociatedControlID="chkb_Sapiens_1"></asp:Label>
                                                <asp:CheckBox ID="chkb_Sapiens_1" runat="server" Checked='<%# Eval("Sapiens") %>' Enabled="false" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_CtaPresupuesto" runat="server" Text="Cuenta Presupuestaria:" AssociatedControlID="ltl_Cuenta"></asp:Label>
                                                <asp:Literal ID="ltl_Cuenta" runat="server" Text='<%# Eval("CuentaPresupuesto") %>' />
                                            </div>
<%--                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_LicenciaDesde" runat="server" Text="Licencia Desde:" AssociatedControlID="ltl_LicenciaDesde"></asp:Label>
                                                <asp:Literal ID="ltl_LicenciaDesde" runat="server" Text='<%# Eval("LicenciaDesde", "{0:d}") %>' />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_LicenciaHasta" runat="server" Text="Licencia Hasta:" AssociatedControlID="ltl_LicenciaHasta"></asp:Label>
                                                <asp:Literal ID="ltl_LicenciaHasta" runat="server" Text='<%# Eval("LicenciaHasta", "{0:d}") %>' />
                                            </div>--%>
                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="sqlDS_DatosAsegurado" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Info_Asegurado" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Asegurados" UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="2" />
                                        <asp:Parameter Name="Cod_Asegurado" Type="Int32" />
                                        <asp:Parameter Name="FK_id_Clases" Type="Int32" />
                                        <asp:Parameter Name="Nombre" Type="String" />
                                        <asp:Parameter Name="Apellido1" Type="String" />
                                        <asp:Parameter Name="Apellido2" Type="String" />
                                        <asp:Parameter Name="FK_id_Sedes" Type="Int32" />
                                        <asp:Parameter Name="CargoAsegurado" Type="String" />
                                        <asp:Parameter Name="CuentaPresupuesto" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="Telefono" Type="String" />
                                        <asp:Parameter Name="FechaIngresoIICA" Type="DateTime" />
                                        <asp:Parameter Name="FechaSalidaIICA" Type="DateTime" />
                                        <asp:Parameter Name="FechaIngresoRetirado" Type="DateTime" />
                                        <asp:Parameter Name="Salario" Type="Double" />
                                        <asp:Parameter Name="SalarioFechaActualizacion" Type="DateTime" />
                                        <asp:Parameter Name="EstadoCivil" Type="Int32" />
                                        <asp:Parameter Name="TipoFuncionario" Type="Int32" />
                                        <asp:Parameter Name="LicenciaDesde" Type="DateTime" />
                                        <asp:Parameter Name="LicenciaHasta" Type="DateTime" />
                                        <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <br />
                                <br />

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="tab-pane" id="1">
                    <span class="page-titles">
                        <asp:Localize ID="lcl_tabCoberturas" runat="server" Text="Coberturas Asegurado Directo"></asp:Localize>
                    </span>
                    <asp:HiddenField ID="hdf_OperacionCoberturas" runat="server" />
                    <div class="margin-top-30">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gv_Coberturas" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_Coberturas" Width="100%" DataKeyNames="id_Cobertura" AllowPaging="True" AllowSorting="True">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="lnk_Guardar_Cobertura" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Coberturas" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-saved glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Cancelar_Cobertura" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-remove glyphicons-iica"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_Editar_Cobertura" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Eliminar_Cobertura" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Agregar_Cobertura" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Seguro" SortExpression="Seguro">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_TipoSeguro" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_TipoSeguro" DataTextField="Descripcion" DataValueField="id_Seguro" SelectedValue='<%# Bind("FK_id_Seguro") %>'></asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlDS_TipoSeguro" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Seguros" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="rfv_TipoSeguro" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="ddl_TipoSeguro" ValidationGroup="Coberturas" InitialValue="0" Text="*"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_TipoSeguro" runat="server" Text='<%# Eval("Seguro") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Monto" runat="server" Text='<%# Bind("Monto") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_Monto" runat="server" Text='<%# Eval("Monto", "{0:N}") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" HorizontalAlign="Right"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ingreso" SortExpression="FechaIngreso">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_FechaIngreso" runat="server" Text='<%# Bind("FechaIngreso", "{0:d}") %>' TextMode="Date" CssClass="form-control" Width="98%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_FechaIngreso" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="txt_FechaIngreso" ValidationGroup="Coberturas" Text="*"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FechaIngreso" runat="server" Text='<%# Eval("FechaIngreso", "{0:d}") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salida" SortExpression="FechaSalida">
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <asp:TextBox ID="txt_FechaSalida" runat="server" Text='<%# Bind("FechaSalida", "{0:d}") %>' TextMode="Date" CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_MotivoSalida" runat="server" Text="Motivo:" AssociatedControlID="txt_MotivoSalida"></asp:Label>
                                                        <asp:TextBox ID="txt_MotivoSalida" runat="server" Text='<%# Bind("MotivoSalida") %>' TextMode="MultiLine" Rows="3" CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FechaSalida" runat="server" Text='<%# Eval("FechaSalida", "{0:d}") %>'></asp:Literal>
                                                <asp:Literal ID="ltr_MotivoSalida" runat="server" Text='<%# Eval("MotivoSalida") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="25%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item" SortExpression="Item">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_Items" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_Items" DataTextField="Descripcion" DataValueField="id_RegistroAuto" SelectedValue='<%# Bind("FK_id_RegistroAuto") %>'></asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlDS_Items" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Autos" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_Item" runat="server" Text='<%# Eval("Item") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Factores" SortExpression="FactorPorcentaje">
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_FacPor" runat="server" Text="Porcentaje:" AssociatedControlID="Txt_FacPor"></asp:Label>
                                                        <asp:TextBox ID="Txt_FacPor" runat="server" Text='<%# Bind("FactorPorcentaje") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_FacMon" runat="server" Text="Monto:" AssociatedControlID="Txt_FacMon"></asp:Label>
                                                        <asp:TextBox ID="Txt_FacMon" runat="server" Text='<%# Bind("FactorMonto") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FacPor" runat="server" Text='<%# Eval("FactorPorcentaje") %>'></asp:Literal>
                                                <asp:Literal ID="ltr_FacMon" runat="server" Text='<%# Eval("FactorMonto") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="pagination-ys" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sqlDS_Coberturas" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Coberturas" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Coberturas" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_PRO_Man_Coberturas" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Coberturas" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="hdf_OperacionCoberturas" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="Monto" Type="Double" />
                                        <asp:Parameter Name="FechaIngreso" Type="DateTime" />
                                        <asp:Parameter Name="FechaSalida" Type="DateTime" />
                                        <asp:Parameter Name="MotivoSalida" Type="String" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="FK_id_Familiar" Type="Int32" />
                                        <asp:Parameter Name="FK_id_RegistroAuto" Type="Int32" />
                                        <asp:Parameter Name="FactorPorcentaje" Type="Double" />
                                        <asp:Parameter Name="FactorMonto" Type="Double" />
                                        <asp:Parameter Name="FK_id_Seguro" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hdf_OperacionCoberturas" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="Monto" Type="Double" />
                                        <asp:Parameter Name="FechaIngreso" Type="DateTime" />
                                        <asp:Parameter Name="FechaSalida" Type="DateTime" />
                                        <asp:Parameter Name="MotivoSalida" Type="String" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="FK_id_Familiar" Type="Int32" />
                                        <asp:Parameter Name="FK_id_RegistroAuto" Type="Int32" />
                                        <asp:Parameter Name="FactorPorcentaje" Type="Double" />
                                        <asp:Parameter Name="FactorMonto" Type="Double" />
                                        <asp:Parameter Name="FK_id_Seguro" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="tab-pane" id="2">
                    <span class="page-titles">
                        <asp:Localize ID="lcl_tabFamiliares" runat="server" Text="Familiares del Asegurado"></asp:Localize>
                    </span>
                    <asp:HiddenField ID="hdf_OperacionFamiliar" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_Familiares" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="id_Familiar,lastUpdate,NombreCompleto" DataSourceID="sqlDS_Familiares" Width="100%" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnk_Guardar_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Familiar" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-saved glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Cancelar_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-remove glyphicons-iica"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_Editar_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Eliminar_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Agregar_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Coberturas_Familiar" runat="server" ClientIDMode="AutoID" CommandName="Detalle_Familiar" ToolTip="Coberturas" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") & "," & Eval("id_Familiar") %>' CssClass="btn btn-default"><span class="glyphicon glyphicon-list-alt glyphicons-iica"></span></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CodAseguradoGrupo" SortExpression="CodAseguradoGrupo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_CodAseguradoGrupo" runat="server" Text='<%# Bind("CodAseguradoGrupo") %>' CssClass="form-control" Width="98%" Enabled="false"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_CodAseguradoGrupo" runat="server" Text='<%# Eval("CodAseguradoGrupo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_NombreFamiliar" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_NombreFamiliar" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="txt_NombreFamiliar" ValidationGroup="Familiar" Text="*"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_NombreFamiliar" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apellido1" SortExpression="Apellido1">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Apellido1Fam" runat="server" Text='<%# Bind("Apellido1") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Apellido1Fam" runat="server" Text='<%# Eval("Apellido1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apellido2" SortExpression="Apellido2">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Apellido2Fam" runat="server" Text='<%# Bind("Apellido2") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Apellido2Fam" runat="server" Text='<%# Eval("Apellido2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nacimiento" SortExpression="FechaNacimiento">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_NacimientoFamiliar" runat="server" Text='<%# Bind("FechaNacimiento", "{0:d}") %>' TextMode="Date" CssClass="form-control" Width="98%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_NacimientoFamiliar" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="txt_NacimientoFamiliar" ValidationGroup="Familiar" Text="*"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_NacimientoFamiliar" runat="server" Text='<%# Eval("FechaNacimiento", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddl_TipoFamiliar" runat="server" CssClass="form-control" Width="98%" SelectedValue='<%# Bind("id_TipoFamiliar") %>'>
                                                <asp:ListItem Value="0" Text="-- Seleccionar --"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Cónyuge"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Hijo"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfv_TipoFamiliar" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" cssclass="error-span" ControlToValidate="ddl_TipoFamiliar" ValidationGroup="Familiar" InitialValue="0" Text="*"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_TipoFamiliar" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="pagination-ys" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlDS_Familiares" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Familiares" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Familiares" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_PRO_Man_Familiares" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Familiares" UpdateCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="hdf_OperacionFamiliar" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                    <asp:Parameter Name="CodAseguradoGrupo" Type="String" />
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="Apellido1" Type="String" />
                                    <asp:Parameter Name="Apellido2" Type="String" />
                                    <asp:Parameter Name="FechaNacimiento" Type="DateTime" />
                                    <asp:Parameter Name="id_TipoFamiliar" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="hdf_OperacionFamiliar" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                    <asp:Parameter Name="CodAseguradoGrupo" Type="String" />
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="Apellido1" Type="String" />
                                    <asp:Parameter Name="Apellido2" Type="String" />
                                    <asp:Parameter Name="FechaNacimiento" Type="DateTime" />
                                    <asp:Parameter Name="id_TipoFamiliar" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:HiddenField ID="hdf_OperacionCoberturaFamiliar" runat="server" />
                            <asp:Panel ID="pnl_SegurosFamiliares" runat="server" Visible="false">
                                <span class="page-titles">
                                    <asp:Localize ID="lcl_NombreFamiliar" runat="server"></asp:Localize>
                                </span>
                                <asp:GridView ID="gv_CoberturasFamiliares" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_CoberturasFamiliares" Width="100%" DataKeyNames="id_Cobertura" AllowPaging="True" AllowSorting="True">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="lnk_Guardar_CoberturaFam" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="vgGrid" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-saved glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Cancelar_CoberturaFam" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-remove glyphicons-iica"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_Editar_CoberturaFam" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Eliminar_CoberturaFam" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                <asp:LinkButton ID="lnk_Agregar_CoberturaFam" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Seguro" SortExpression="Seguro">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_TipoSeguroFam" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_TipoSeguroFam" DataTextField="Descripcion" DataValueField="id_Seguro" SelectedValue='<%# Bind("FK_id_Seguro") %>'></asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlDS_TipoSeguroFam" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Seguros" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_TipoSeguroFam" runat="server" Text='<%# Eval("Seguro") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_MontoFam" runat="server" Text='<%# Bind("Monto") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_MontoFam" runat="server" Text='<%# Eval("Monto", "{0:N}") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ingreso" SortExpression="FechaIngreso">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_FechaIngresoFam" runat="server" Text='<%# Bind("FechaIngreso", "{0:d}") %>' TextMode="Date" CssClass="form-control" Width="98%"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FechaIngresoFam" runat="server" Text='<%# Eval("FechaIngreso", "{0:d}") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salida" SortExpression="FechaSalida">
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <asp:TextBox ID="txt_FechaSalidaFam" runat="server" Text='<%# Bind("FechaSalida", "{0:d}") %>' TextMode="Date" CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_MotivoSalidaFam" runat="server" Text="Motivo:" AssociatedControlID="txt_MotivoSalidaFam"></asp:Label>
                                                        <asp:TextBox ID="txt_MotivoSalidaFam" runat="server" Text='<%# Bind("MotivoSalida") %>' TextMode="MultiLine" Rows="3" CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FechaSalidaFam" runat="server" Text='<%# Eval("FechaSalida", "{0:d}") %>'></asp:Literal>
                                                <asp:Literal ID="ltr_MotivoSalidaFam" runat="server" Text='<%# Eval("MotivoSalida") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="25%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item" SortExpression="Item">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_ItemsFam" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_ItemsFam" DataTextField="Descripcion" DataValueField="id_RegistroAuto" SelectedValue='<%# Bind("FK_id_RegistroAuto") %>'></asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlDS_ItemsFam" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Autos" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_ItemFam" runat="server" Text='<%# Eval("Item") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Factores" SortExpression="FactorPorcentaje">
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_FacPorFam" runat="server" Text="Porcentaje:" AssociatedControlID="Txt_FacPorFam"></asp:Label>
                                                        <asp:TextBox ID="Txt_FacPorFam" runat="server" Text='<%# Bind("FactorPorcentaje") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lbl_FacMonFam" runat="server" Text="Monto:" AssociatedControlID="Txt_FacMonFam"></asp:Label>
                                                        <asp:TextBox ID="Txt_FacMonFam" runat="server" Text='<%# Bind("FactorMonto") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Literal ID="ltr_FacPorFam" runat="server" Text='<%# Eval("FactorPorcentaje") %>'></asp:Literal>
                                                <asp:Literal ID="ltr_FacMonFam" runat="server" Text='<%# Eval("FactorMonto") %>'></asp:Literal>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="10%" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="pagination-ys" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sqlDS_CoberturasFamiliares" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Coberturas" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Coberturas" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_PRO_Man_Coberturas" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Coberturas" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="FK_id_Familiar" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="hdf_OperacionCoberturaFamiliar" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="Monto" Type="Double" />
                                        <asp:Parameter Name="FechaIngreso" Type="DateTime" />
                                        <asp:Parameter Name="FechaSalida" Type="DateTime" />
                                        <asp:Parameter Name="MotivoSalida" Type="String" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Familiar" DefaultValue="1" Name="FK_id_Familiar" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="FK_id_RegistroAuto" Type="Int32" />
                                        <asp:Parameter Name="FactorPorcentaje" Type="Double" />
                                        <asp:Parameter Name="FactorMonto" Type="Double" />
                                        <asp:Parameter Name="FK_id_Seguro" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="5" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Familiar" DefaultValue="1" Name="id_Familiar" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hdf_OperacionCoberturaFamiliar" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="Monto" Type="Double" />
                                        <asp:Parameter Name="FechaIngreso" Type="DateTime" />
                                        <asp:Parameter Name="FechaSalida" Type="DateTime" />
                                        <asp:Parameter Name="MotivoSalida" Type="String" />
                                        <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="hdf_Familiar" DefaultValue="2" Name="FK_id_Familiar" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter Name="FK_id_RegistroAuto" Type="Int32" />
                                        <asp:Parameter Name="FactorPorcentaje" Type="Double" />
                                        <asp:Parameter Name="FactorMonto" Type="Double" />
                                        <asp:Parameter Name="FK_id_Seguro" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="tab-pane" id="3">
                    <asp:Panel ID="pnl_Observaciones" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>
                                            <asp:Localize ID="lcl_ComentariosPlan" runat="server" Text="Observaciones"></asp:Localize>
                                        </h4>
                                        <asp:TextBox ID="txt_Observaciones" TextMode="MultiLine" Rows="10" runat="server" Width="98%" CssClass="form-control" onkeyDown="contarLetras(this,lIndicador);" onkeypress="return textboxMultilineMaxNumber(this,500)"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="alinear-derecha float-left margin-left-8">
                                    <span class="localize-indicador-500-caracteres">
                                        <asp:Localize ID="lcl_cien" runat="server" Text="500/"></asp:Localize></span>
                                    <input readonly="readonly" type="text" name="lIndicador" maxlength="3" value="500" class="indicador-500-caracteres" />
                                </div>
                                <div class="row margin-top-10 margin-bottom-30 ">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="lnkBtn_Observaciones" runat="server" CssClass="btn btn-iica-green">
                                            <span class="glyphicon glyphicon-floppy-saved imagen-enviar"></span>
                                            <asp:Localize ID="lcl_EnviarRevision" runat="server" Text="Guardar"></asp:Localize>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                                
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

    </div>

</asp:Content>
