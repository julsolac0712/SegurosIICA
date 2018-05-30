<%@ Page Title="Mantenimiento de Reclamos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reclamos.aspx.vb" Inherits="SegurosIICA.Reclamos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />

    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Mantenimiento de Reclamos"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">
        <asp:UpdatePanel ID="upAjax_Reclamos" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gv_Reclamos" CssClass="table table-bordered" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="sqlDS_Reclamos" AllowPaging="True" AllowSorting="True" DataKeyNames="id_Reclamo">
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
                        <asp:TemplateField HeaderText="Código Reclamo" SortExpression="TipoDeReclamosCod">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Codigo" runat="server" Text='<%# Bind("TipoDeReclamosCod") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TipoDeReclamosCod") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripción" SortExpression="TipoDeReclamosDesc">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Descripcion" runat="server" Text='<%# Bind("TipoDeReclamosDesc") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TipoDeReclamosDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="70%" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sqlDS_Reclamos" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" DeleteCommand="SEGIICA_MAE_Man_Reclamos" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_MAE_Man_Reclamos" InsertCommandType="StoredProcedure" SelectCommand="SEGIICA_MAE_Get_Lista_Reclamos" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_Reclamos" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                        <asp:Parameter Name="TipoDeReclamoCod" Type="String" />
                        <asp:Parameter Name="TipoDeReclamoDesc" Type="String" />
                        <asp:Parameter Name="lastUpdate" Type="Object" />
                        <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="TipoDeReclamoCod" Type="String" />
                        <asp:Parameter Name="TipoDeReclamoDesc" Type="String" />
                        <asp:Parameter Name="lastUpdate" Type="Object" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="TipoDeReclamoCod" Type="String" />
                        <asp:Parameter Name="TipoDeReclamoDesc" Type="String" />
                        <asp:Parameter Name="lastUpdate" Type="Object" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
