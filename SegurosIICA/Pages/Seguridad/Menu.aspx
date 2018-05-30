<%@ Page Title="Seguridad de Menú de Opciones" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Menu.aspx.vb" Inherits="SegurosIICA.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />

        <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
            <ContentTemplate>

                <span class="page-titles">
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Administración de Opciones de Menú"></asp:Localize>
                </span>
                <div class="margin-top-10 ">
                    <asp:GridView ID="gv_OpcionesMenu"  CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDS_OpcionesMenu" DataKeyNames="id_Menu" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ruta_Menu" SortExpression="Ruta_Menu">
                                <EditItemTemplate>
                                    <asp:Textbox ID="txt_Ruta" runat="server" Text='<%# Bind("Ruta_Menu") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Ruta" runat="server" Text='<%# Eval("Ruta_Menu") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                                <EditItemTemplate>
                                    <asp:textbox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="98%"></asp:textbox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chk_EstadoEdicion" runat="server" Checked='<%# Bind("Estado") %>'/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_Estado" runat="server" Checked='<%# Eval("Estado") %>' Enabled="false"/>
                                </ItemTemplate>
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Indice" SortExpression="Indice">
                                <EditItemTemplate>
                                    <asp:Textbox ID="txt_Indice" runat="server" Text='<%# Bind("Indice") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Indice" runat="server" Text='<%# Eval("Indice") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Menu Padre" SortExpression="id_Menu_Padre">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_OpcionesPadre" runat="server" CssClass="form-control" DataSourceID="sqlDS_OpcionesPadre" DataTextField="Descripcion" DataValueField="id_Menu" SelectedValue='<%# Bind("id_Menu_Padre") %>' Width="98%"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_OpcionesPadre" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_SEG_Get_Lista_Opciones" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Padre" runat="server" Text='<%# Eval("NombrePadre") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDS_OpcionesMenu" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_SEG_Get_Lista_Opciones" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_SEG_Man_Opciones" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_SEG_Man_Opciones" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_SEG_Man_Opciones" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                            <asp:Parameter Name="Ruta_Menu" Type="String" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Estado" Type="Int32" />
                            <asp:Parameter Name="Indice" Type="Int32" />
                            <asp:Parameter Name="id_Menu_Padre" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                            <asp:Parameter Name="Ruta_Menu" Type="String" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Estado" Type="Int32" />
                            <asp:Parameter Name="Indice" Type="Int32" />
                            <asp:Parameter Name="id_Menu_Padre" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
