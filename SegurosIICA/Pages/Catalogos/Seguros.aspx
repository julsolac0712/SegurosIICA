<%@ Page Title="Mantenimiento de Seguros" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Seguros.aspx.vb" Inherits="SegurosIICA.Seguros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />

    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Mantenimiento de Tipos de Seguros"></asp:Localize>
                </h3>
            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>
    <div class="form-body">
        <asp:UpdatePanel ID="upAjax_Seguros" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gv_Seguros" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDS_Seguros" Width="100%" DataKeyNames="id_Seguro" AllowPaging="True" AllowSorting="True">
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
                        <asp:TemplateField HeaderText="Descripción Español" SortExpression="Descripcion_es">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Descripcion_es" runat="server" Text='<%# Bind("Descripcion_es") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion_es" runat="server" Text='<%# Eval("Descripcion_es") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripción Ingles" SortExpression="Descripcion_en">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Descripcion_en" runat="server" Text='<%# Bind("Descripcion_en") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion_en" runat="server" Text='<%# Eval("Descripcion_en") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observaciones" SortExpression="Observaciones">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Observaciones" runat="server" Text='<%# Bind("Observaciones") %>' CssClass="form-control" Width="98%" TextMode ="MultiLine" Rows="5"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Observaciones" runat="server" Text='<%# Eval("Observaciones") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="20%" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sqlDS_Seguros" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" DeleteCommand="SEGIICA_MAE_Man_Seguros" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_MAE_Man_Seguros" InsertCommandType="StoredProcedure" SelectCommand="SEGIICA_MAE_Get_Lista_Seguros" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_Seguros" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                        <asp:Parameter Name="Descripcion_es" Type="String" />
                        <asp:Parameter Name="Descripcion_en" Type="String" />
                        <asp:Parameter Name="Observaciones" Type="String" />
                        <asp:Parameter Name="FK_id_TipoFuncionario" Type="Int32" />
                        <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Descripcion_es" Type="String" />
                        <asp:Parameter Name="Descripcion_en" Type="String" />
                        <asp:Parameter Name="Observaciones" Type="String" />
                        <asp:Parameter Name="FK_id_TipoFuncionario" Type="Int32" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="Descripcion_es" Type="String" />
                        <asp:Parameter Name="Descripcion_en" Type="String" />
                        <asp:Parameter Name="Observaciones" Type="String" />
                        <asp:Parameter Name="FK_id_TipoFuncionario" Type="Int32" />
                        <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


</asp:Content>
