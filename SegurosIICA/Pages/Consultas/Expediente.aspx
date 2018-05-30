<%@ Page Title="Expediente de Asegurado" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Expediente.aspx.vb" Inherits="SegurosIICA.Expediente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />
    <asp:HiddenField ID="hdf_Asegurado" runat="server" />

    <asp:SqlDataSource ID="sqlDS_Observaciones" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Info_Asegurado" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Asegurados" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
            <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
      <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Expedientes de Asegurados"></asp:Localize>
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

            <asp:GridView ID="gv_Asegurados" runat="server" CssClass="table table-bordered" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlDS_Asegurados" DataKeyNames="id_Asegurado">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>                       
                            <asp:LinkButton ID="lnk_Detalle" runat="server" ClientIDMode="AutoID" CommandName="Detalle" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") & "," & Eval("id_Asegurado") %>' ToolTip="Detalle Asegurado" CssClass="btn btn-default"><span class="glyphicon glyphicon-list-alt glyphicons-iica"></span></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="8%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cod_Asegurado" SortExpression="Cod_Asegurado">
                        <ItemTemplate>
                            <asp:Label ID="lbl_CodAsegurado" runat="server" Text='<%# Eval("Cod_Asegurado") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="45%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sede" SortExpression="Sede">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Sede" runat="server" Text='<%# Eval("Sede") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="15%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clase" SortExpression="Clase">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Clase" runat="server" Text='<%# Eval("Clase") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" Width="15%" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination-ys" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqlDS_Asegurados" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Asegurados" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                    <asp:ControlParameter ControlID="ddl_SedeFiltro" Name="SedeFiltro" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddl_ClaseFiltro" Name="ClaseFiltro" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="pnl_Detalle" runat="server" Visible="false">

            <span class="page-titles">
                <asp:Localize ID="lcl_DatosAsegurado" runat="server" Text="Datos Generales del Asegurado"></asp:Localize>
            </span>
            <div class="margin-top-30">
                <asp:FormView ID="fv_DatosAsegurado" runat="server" DataKeyNames="id_Asegurado, lastUpdate" DataSourceID="sqlDS_DatosAsegurado" Width="100%">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Codigo" runat="server" Text="Código:" AssociatedControlID="ltl_Codigo"></asp:Label>
                                <asp:Literal ID="ltl_Codigo" runat="server" Text='<%# Eval("Cod_Asegurado") %>' />
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Nombre" runat="server" Text="Nombre:" AssociatedControlID="ltl_Nombre"></asp:Label>
                                <asp:Literal ID="ltl_Nombre" runat="server" Text='<%# Eval("NombreCompleto") %>' />
                            </div>
                            <div class="col-md-5">
                                <asp:Label ID="lbl_Email" runat="server" Text="Email:" AssociatedControlID="ltl_Email"></asp:Label>
                                <asp:Literal ID="ltl_Email" runat="server" Text='<%# Eval("Email") %>' />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Cargo" runat="server" Text="Cargo:" AssociatedControlID="ltl_Cargo"></asp:Label>
                                <asp:Literal ID="ltl_Cargo" runat="server" Text='<%# Eval("CargoAsegurado") %>' />
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Nacimiento" runat="server" Text="Fec.Nacimiento:" AssociatedControlID="ltl_Nacimiento"></asp:Label>
                                <asp:Literal ID="ltl_Nacimiento" runat="server" Text='<%# Eval("FechaNacimiento", "{0:d}") %>' />
                            </div>
                            <div class="col-md-5">
                                <asp:Label ID="lbl_FechaIngIICA" runat="server" Text="Ingreso al IICA:" AssociatedControlID="ltl_FechaIngresoIICA"></asp:Label>
                                <asp:Literal ID="ltl_FechaIngresoIICA" runat="server" Text='<%# Eval("FechaIngresoIICA", "{0:d}") %>' />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Telefono" runat="server" Text="Teléfono:" AssociatedControlID="ltl_Telefono"></asp:Label>
                                <asp:Literal ID="ltl_Telefono" runat="server" Text='<%# Eval("Telefono") %>' />
                            </div>

                            <div class="col-md-3">
                                <asp:Label ID="lbl_EstadoCivil" runat="server" Text="Casado S/N:" AssociatedControlID="chkb_EstadoCivil_1"></asp:Label>
                                <asp:CheckBox ID="chkb_EstadoCivil_1" runat="server" Checked='<%# Eval("EstadoCivil") %>' Enabled="false" />
                            </div>
                        </div>
                        
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="sqlDS_DatosAsegurado" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Info_Asegurado" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Asegurados" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div class="margin-top-30">
                    <span class="page-titles">
                        <asp:Localize ID="Localize1" runat="server" Text="Seguros Vigentes Registrados"></asp:Localize>
                    </span>

                    <asp:GridView ID="gv_Coberturas" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_Coberturas" Width="100%" DataKeyNames="id_Cobertura">
                        <Columns>
                            <asp:TemplateField HeaderText="Seguro" SortExpression="Seguro">
                                <ItemTemplate>
                                    <asp:Literal ID="ltr_TipoSeguro" runat="server" Text='<%# Eval("Seguro") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                <ItemTemplate>
                                    <asp:Literal ID="ltr_Monto" runat="server" Text='<%# Eval("Monto", "{0:N}") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="10%" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ingreso" SortExpression="FechaIngreso">
                                <ItemTemplate>
                                    <asp:Literal ID="ltr_FechaIngreso" runat="server" Text='<%# Eval("FechaIngreso", "{0:d}") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Vehículo" SortExpression="Item">
                                <ItemTemplate>
                                    <asp:Literal ID="ltr_Item" runat="server" Text='<%# Eval("Item") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Factores" SortExpression="FactorPorcentaje">
                                <ItemTemplate>
                                    <asp:Literal ID="ltr_FacPor" runat="server" Text='<%# Eval("FactorPorcentaje") %>'></asp:Literal>
                                    <asp:Literal ID="ltr_FacMon" runat="server" Text='<%# Eval("FactorMonto") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lbl_SinSegurosVigente" runat="server" Font-Bold="True" ForeColor="Red" Text="No tiene Seguros Registrados"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDS_Coberturas" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Coberturas" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="margin-top-30">

                    <span class="page-titles">
                        <asp:Localize ID="Localize2" runat="server" Text="Familiares"></asp:Localize>
                    </span>

                    <asp:GridView ID="gv_Familiares" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="id_Familiar" DataSourceID="sqlDS_Familiares" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Codigo Grupo" SortExpression="CodAseguradoGrupo">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_CodAseguradoGrupo" runat="server" Text='<%# Eval("CodAseguradoGrupo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Datos del Familiar" SortExpression="Nombre">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_NombreFamiliar" runat="server" Text="Nombre:" AssociatedControlID="lbl_NombreFamiliar"></asp:Label>
                                            <asp:Label ID="lbl_NombreFamiliar" runat="server" Text='<%# Eval("NombreCompleto") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_NacimientoFamiliar" runat="server" Text="Fec.Nacimiento:" AssociatedControlID="lbl_NacimientoFamiliar"></asp:Label>
                                            <asp:Label ID="lbl_NacimientoFamiliar" runat="server" Text='<%# Eval("FechaNacimiento", "{0:d}") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_Tipo" runat="server" Text="Tipo:" AssociatedControlID="lbl_TipoFamiliar"></asp:Label>
                                            <asp:Label ID="lbl_TipoFamiliar" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <span class="page-titles">
                                        <asp:Localize ID="Localize1" runat="server" Text="Seguros del Familiar"></asp:Localize>
                                    </span>
                                    <asp:HiddenField ID="hdf_Familiar" runat="server" Value='<%# Eval("id_Familiar") %>' />
                                    <asp:GridView ID="gv_CoberturasFamiliares" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_CoberturasFamiliares" Width="100%" DataKeyNames="id_Cobertura">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Seguro" SortExpression="Seguro">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltr_TipoSeguroFam" runat="server" Text='<%# Eval("Seguro") %>'></asp:Literal>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="20%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltr_MontoFam" runat="server" Text='<%# Eval("Monto", "{0:N}") %>'></asp:Literal>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ingreso" SortExpression="FechaIngreso">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltr_FechaIngresoFam" runat="server" Text='<%# Eval("FechaIngreso", "{0:d}") %>'></asp:Literal>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vehículo" SortExpression="Item">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltr_ItemFam" runat="server" Text='<%# Eval("Item") %>'></asp:Literal>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="20%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Factores" SortExpression="FactorPorcentaje">
                                                <ItemTemplate>
                                                    <asp:Literal ID="ltr_FacPorFam" runat="server" Text='<%# Eval("FactorPorcentaje") %>'></asp:Literal>
                                                    <asp:Literal ID="ltr_FacMonFam" runat="server" Text='<%# Eval("FactorMonto") %>'></asp:Literal>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <asp:Label ID="lbl_SinSeguros" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="Red" Text="El familiar no tiene seguros relacionados"></asp:Label>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_CoberturasFamiliares" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Coberturas" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="4" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_Asegurado" DefaultValue="" Name="id_Asegurado" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_Familiar" DefaultValue="" Name="id_Familiar" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="80%" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lbl_SinFamiliares" runat="server" Font-Bold="True" ForeColor="Red" Text="No tiene familiares registrados"></asp:Label>
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDS_Familiares" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Familiares" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Familiares">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Asegurado" Name="FK_id_Asegurado" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="page-titles">
                                <asp:Localize ID="lcl_ComentariosPlan" runat="server" Text="Observaciones"></asp:Localize>
                            </span>
                            <asp:TextBox ID="txt_Observaciones" TextMode="MultiLine" Rows="5" runat="server" Width="98%" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row margin-top-30">
                    <div class="col-md-12">
                        <asp:LinkButton ID="lnkBtn_Regresar" runat="server" CssClass="btn btn-iica-green">
                            <span class="glyphicon glyphicon-arrow-left imagen-enviar"></span>
                            <asp:Localize ID="lcl_Regresar" runat="server" Text="Regresar"></asp:Localize>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
