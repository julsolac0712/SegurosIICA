<%@ Page Title="Registro de Autos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RegistroAutos.aspx.vb" Inherits="SegurosIICA.RegistroAutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />

    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Registro de Autos"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">
        <asp:UpdatePanel ID="upAjax_Autos" runat="server">
            <ContentTemplate>

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
                        <asp:Localize ID="lcl_TipoFiltro" runat="server" Text="Filtrar por Tipo"></asp:Localize>
                        <asp:DropDownList ID="ddl_TipoFiltro" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True">
                            <asp:ListItem Value="0" Text="--Seleccionar--"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Personal"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Oficial"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">

                        <asp:Localize ID="lcl_PeriodoFiltro" runat="server" Text="Filtrar por Año"></asp:Localize>
                        <asp:DropDownList ID="ddl_PeriodoFiltro" runat="server" CssClass="form-control" Width="100%" DataSourceID="sqlDS_PeriodoFiltro" DataTextField="Periodo" DataValueField="id_Periodo" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="sqlDS_PeriodoFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Periodos" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>

                <asp:GridView ID="gv_Autos" CssClass="table table-bordered" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_RegistroAuto" DataSourceID="sqlDS_Autos">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                    <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="vgGrid" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-saved glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"><span class="glyphicon glyphicon-floppy-remove glyphicons-iica"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datos Generales" SortExpression="Item">
                            <EditItemTemplate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Item" runat="server" Text="Item:" AssociatedControlID="txt_Item"></asp:Label>
                                        <asp:TextBox ID="txt_Item" runat="server" Text='<%# Bind("Item") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Placa" runat="server" Text="Placa:" AssociatedControlID="txt_Placa"></asp:Label>
                                        <asp:Textbox ID="txt_Placa" runat="server" Text='<%# Bind("Placa") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                                    </div>
                                </div>
                       <%--         <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Marca" runat="server" Text="Marca:" AssociatedControlID="ddl_Marca"></asp:Label>
                                        <asp:DropDownList ID="ddl_Marca" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_Marca" DataTextField="Descripcion" DataValueField="id_MarcaAuto" SelectedValue='<%# Bind("FK_id_MarcaAuto") %>'></asp:DropDownList>
                                        <asp:SqlDataSource ID="sqlDS_Marca" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Marcas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Modelo" runat="server" Text="Modelo:" AssociatedControlID="txt_Modelo"></asp:Label>
                                        <asp:Textbox ID="txt_Modelo" runat="server" Text='<%# Bind("Modelo") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Periodo" runat="server" Text="Año:" AssociatedControlID="ddl_Periodo"></asp:Label>
                                        <asp:DropDownList ID="ddl_Periodo" runat="server" CssClass="form-control" Width="98%" DataSourceID="sqlDS_Periodo" DataTextField="Periodo" DataValueField="id_Periodo" SelectedValue='<%# Bind("FK_Anno") %>'></asp:DropDownList>
                                        <asp:SqlDataSource ID="sqlDS_Periodo" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Periodos" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lbl_tit_Descripcion" runat="server" Text="Descripción:" AssociatedControlID="txt_Descripcion"></asp:Label>
                                        <asp:Textbox ID="txt_Descripcion" runat="server" Text='<%# Bind("MarcaAuto") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                                    </div>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Panel ID="pnl_Generales" runat="server">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_Item2" runat="server" Text="Item:" AssociatedControlID="lbl_Item"></asp:Label>
                                            <asp:Label ID="lbl_Item" runat="server" Text='<%# Eval("Item") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_Placa2" runat="server" Text="Placa:" AssociatedControlID="lbl_Placa"></asp:Label>
                                            <asp:Label ID="lbl_Placa" runat="server" Text='<%# Eval("Placa") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lbl_tit_Anno2" runat="server" Text="Año:" AssociatedControlID="lbl_Anno"></asp:Label>
                                            <asp:Label ID="lbl_Anno" runat="server" Text='<%# Eval("Periodo") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lbl_tit_Descripcion2" runat="server" Text="Descripción:" AssociatedControlID="lbl_Descripcion"></asp:Label>
                                            <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Eval("MarcaAuto") %>'></asp:Label>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="30%" />
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Numeración" SortExpression="Num_Chasis">
                            <EditItemTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lbl_tit_NumMotor" runat="server" Text="No. Motor:" AssociatedControlID="txt_NumMotor"></asp:Label>
                                        <asp:TextBox ID="Txt_NumMotor" runat="server" Text='<%# Bind("Num_Motor") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lbl_tit_NumChasis" runat="server" Text="No. Chasis / Vin:" AssociatedControlID="txt_NumChasis"></asp:Label>
                                        <asp:TextBox ID="Txt_NumChasis" runat="server" Text='<%# Bind("Num_Chasis") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                    </div>
                                </div>
                           <%--     <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lbl_tit_NumVim" runat="server" Text="No. Vin:" AssociatedControlID="txt_NumVim"></asp:Label>
                                        <asp:TextBox ID="Txt_NumVim" runat="server" Text='<%# Bind("Num_Vim") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                                    </div>
                                </div>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Panel ID="pnl_Numeracion" runat="server">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lbl_NumMotor2" runat="server" Text="Motor:" AssociatedControlID="lbl_NumMotor"></asp:Label>
                                            <asp:Label ID="lbl_NumMotor" runat="server" Text='<%# Bind("Num_Motor") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lbl_NumChasis2" runat="server" Text="Chasis:" AssociatedControlID="lbl_NumChasis"></asp:Label>
                                            <asp:Label ID="lbl_NumChasis" runat="server" Text='<%# Bind("Num_Chasis") %>'></asp:Label>
                                        </div>
                                    </div>
                                  <%--  <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lbl_NumVim2" runat="server" Text="Vin:" AssociatedControlID="lbl_NumVim"></asp:Label>
                                            <asp:Label ID="lbl_NumVim" runat="server" Text='<%# Bind("Num_Vim") %>'></asp:Label>
                                        </div>
                                    </div>--%>
                                </asp:Panel>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="20%" />
                        </asp:TemplateField>                      
                        <asp:TemplateField HeaderText="Sede" SortExpression="Nombre">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_Sede" runat="server" CssClass="form-control" DataSourceID="sqlDS_Sede" DataTextField="Nombre" DataValueField="id_Sedes" SelectedValue='<%# Bind("FK_id_Sedes") %>' Width="98%"></asp:DropDownList>
                                <asp:SqlDataSource ID="sqlDS_Sede" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Sedes" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Sede" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Oficial/Personal" SortExpression="TipoVehiculo">
                            <EditItemTemplate>                                
                                <asp:DropDownList ID="ddl_TipoVehiculo" runat="server" CssClass="form-control" SelectedValue='<%# Bind("TipoVehiculo") %>' Width="98%">
                                    <asp:ListItem Value="1" Text="Personal"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Oficial"></asp:ListItem>
                                </asp:DropDownList>                              
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_TipoVehiculo" runat="server" Text='<%# Bind("DescTipo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
                <asp:SqlDataSource ID="sqlDS_Autos" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_PRO_Get_Lista_Autos" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_PRO_Man_Autos" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_PRO_Man_Autos" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_PRO_Man_Autos" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="Placa" Type="String" />
                        <asp:Parameter Name="FK_id_MarcaAuto" Type="Int32" />
                        <asp:Parameter Name="Modelo" Type="String" />
                        <asp:Parameter Name="FK_Anno" Type="Int32" />
                        <asp:Parameter Name="Num_Motor" Type="String" />
                        <asp:Parameter Name="Num_Chasis" Type="String" />
                        <asp:Parameter Name="Num_Vim" Type="String" />
                        <asp:Parameter Name="FK_id_Sedes" Type="Int32" />
                        <asp:Parameter Name="TipoVehiculo" Type="Int32" />
                        <asp:Parameter Name="Estado" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        <asp:ControlParameter ControlID="ddl_SedeFiltro" Name="SedeFiltro" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddl_TipoFiltro" Name="TipoFiltro" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddl_PeriodoFiltro" Name="PeriodoFiltro" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="Placa" Type="String" />
                        <asp:Parameter Name="FK_id_MarcaAuto" Type="Int32" />
                        <asp:Parameter Name="Modelo" Type="String" />
                        <asp:Parameter Name="FK_Anno" Type="Int32" />
                        <asp:Parameter Name="Num_Motor" Type="String" />
                        <asp:Parameter Name="Num_Chasis" Type="String" />
                        <asp:Parameter Name="Num_Vim" Type="String" />
                        <asp:Parameter Name="FK_id_Sedes" Type="Int32" />
                        <asp:Parameter Name="TipoVehiculo" Type="Int32" />
                        <asp:Parameter Name="Estado" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
