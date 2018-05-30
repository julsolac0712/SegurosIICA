<%@ Page Title="Mantenimiento Tipo de Personal" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TipoPersonal.aspx.vb" Inherits="SegurosIICA.TipoPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />

    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Mantenimiento de Tipo de Personal"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">

        <asp:UpdatePanel ID="upAjax_TipoPersonal" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gv_TipoPersonal" CssClass="table table-bordered" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="id_TipoPersonal" DataSourceID="sqlDS_TipoPersonal" AllowPaging="True" AllowSorting="True">
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
                        <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="60%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Abreviatura" SortExpression="Abrev">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Abrev" runat="server" Text='<%# Bind("Abrev") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Abrev" runat="server" Text='<%# Eval("Abrev") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="20%" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="sqlDS_TipoPersonal" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" DeleteCommand="SEGIICA_MAE_Man_TiposFuncionario" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_MAE_Man_TiposFuncionario" InsertCommandType="StoredProcedure" SelectCommand="SEGIICA_MAE_Get_Lista_TiposFuncionario" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_TiposFuncionario" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Abrev" Type="String" />
                        <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Abrev" Type="String" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Abrev" Type="String" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
