<%@ Page Title="Administración de Usuarios" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.vb" Inherits="SegurosIICA.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Operacionrol" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
        <asp:HiddenField ID="hdf_ID" runat="server" />

        
        <div class="form-body">
            <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
                <ContentTemplate>

                    <span class="page-titles">
                        <asp:Localize ID="lcl_Descripcion" runat="server" Text="Administración de Usuarios"></asp:Localize>
                    </span>

                    <div class="margin-top-10 ">
                        <asp:GridView ID="gv_Usuarios" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_Usuarios" AllowPaging="True" AllowSorting="True" DataKeyNames="id_Usuario,lastUpdate">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <div>
                                            <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                        <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                        <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                        <asp:LinkButton ID="lnk_Roles" runat="server" ClientIDMode="AutoID" CommandName="Roles" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") & "," & Eval("Nombre") %>'><span class="glyphicon glyphicon-cog glyphicons-iica"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Funcionario" SortExpression="Nombre">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_Funcionario" runat="server" DataSourceID="sqlDS_Funcionario" DataTextField="Nombre" DataValueField="ID" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_Funcionario_SelectedIndexChanged" SelectedValue='<%# Bind("FK_id_Intranet") %>'></asp:DropDownList>
                                        <asp:CompareValidator ID="rfv_Funcionario" runat="server" ControlToValidate="ddl_Funcionario" ValueToCompare="0" Operator="NotEqual"
                                            ErrorMessage="Requerido" Text="*" CssClass="error-span"
                                            Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                        <asp:SqlDataSource ID="sqlDS_Funcionario" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_SEG_Get_Lista_Usuarios" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltl_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Literal>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="Usuario">
                                    <EditItemTemplate>
                                        <asp:Literal ID="ltl_txt_Usuario" runat="server" Text='<%# Bind("Usuario") %>'></asp:Literal>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltl_Usuario" runat="server" Text='<%# Eval("Usuario") %>'></asp:Literal>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cb_Estado" runat="server" Checked='<%# Bind("Estado") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="pnl_Estado" runat="server" Visible='<%# IIf(Eval("Estado") = 1 And Eval("id_usuario") > 0, 1, 0) %>'>
                                            <span class="glyphicon glyphicon-ok-sign icon-color-green"></span>
                                        </asp:Panel>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Middle" Width="5%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqlDS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" DeleteCommand="SEGIICA_SEG_Man_Usuarios" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_SEG_Man_Usuarios" InsertCommandType="StoredProcedure" SelectCommand="SEGIICA_SEG_Get_Lista_Usuarios" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_SEG_Man_Usuarios" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                                <asp:Parameter Name="FK_id_Intranet" Type="Int32" />
                                <asp:Parameter Name="Estado" Type="Int32" />
                                <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                                <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                <asp:ControlParameter ControlID="hdf_ID" DefaultValue="" Name="FK_id_Intranet" PropertyName="Value" Type="Int32" />
                                <asp:Parameter Name="Estado" Type="Int32" />
                                <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                                <asp:Parameter Name="lastUpdate" Type="Object" />
                                <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                    <asp:Panel ID="pnl_Roles" runat="server" Visible="false">

                        <span class="page-titles">
                            <asp:Localize ID="lcl_Usuario" runat="server"></asp:Localize>
                        </span>
                        <div class="margin-top-10 ">
                            <asp:GridView ID="gv_Roles" runat="server" Width="100%" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_Roles" DataKeyNames="id_Rel_UsuarioRol">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnk_Rol_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Rol_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_Rol_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lnk_Rol_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rol" SortExpression="Descripcion">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                            <asp:DropDownList ID="ddl_Rol" runat="server" CssClass="form-control" DataSourceID="sqlDS_ListaRoles" DataTextField="Descripcion" DataValueField="id_Rol" SelectedValue='<%# Bind("FK_id_Rol") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:CompareValidator ID="rfv_Rol" runat="server" ControlToValidate="ddl_Rol" ValueToCompare="0" Operator="NotEqual"
                                                ErrorMessage="Requerido" Text="*" CssClass="error-span"
                                                Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                            <asp:SqlDataSource ID="sqlDS_ListaRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_SEG_Get_Lista_Roles" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Literal>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Detalle" SortExpression="Detalle">
                                        <ItemTemplate>
                                            <asp:Label ID="ltl_Detalle" runat="server" Text='<%# Eval("Detalle") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="60%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlDS_Roles" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_SEG_Get_Lista_Roles_Usuario" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_SEG_Man_Roles_Usuario" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_SEG_Man_Roles_Usuario" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_SEG_Man_Roles_Usuario" UpdateCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                </DeleteParameters>

                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_ID" DefaultValue="" Name="id_Usuario" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="hdf_Operacionrol" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_ID" DefaultValue="" Name="FK_id_Usuario" PropertyName="Value" Type="Int32" />
                                    <asp:Parameter Name="FK_id_Rol" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="gv_Usuarios" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
