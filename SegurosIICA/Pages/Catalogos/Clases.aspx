<%@ Page Title="Mantenimiento de Clases" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Clases.aspx.vb" Inherits="SegurosIICA.Clases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />

    <div class="form-header">
                <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Mantenimiento de Clases"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">

        <asp:UpdatePanel ID="upAjax_Clases" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gv_Clases" CssClass="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" Width="100%" AutoGenerateColumns="False" DataSourceID="sqlDS_Clases" DataKeyNames="id_Clases">
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
                        <asp:TemplateField HeaderText="Id Clase" SortExpression="ClaseId">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_ClaseId" runat="server" Text='<%# Bind("ClaseId") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_ClaseId" runat="server" Text='<%# Eval("ClaseId") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="8%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resumen" SortExpression="ClaseResumen">
                            <EditItemTemplate>
                                <asp:Textbox ID="txt_ClaseResumen" runat="server" Text='<%# Bind("ClaseResumen") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_ClaseResumen" runat="server" Text='<%# Eval("ClaseResumen") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CodMetLife" SortExpression="CodMetLife">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_CodMetlife" runat="server" Text='<%# Bind("CodMetLife") %>' CssClass="form-control" Width="98%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CodMetlife" runat="server" Text='<%# Eval("CodMetLife") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="15%" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
                <asp:SqlDataSource ID="sqlDS_Clases" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Clases" SelectCommandType="StoredProcedure" DeleteCommand="SEGIICA_MAE_Man_Clases" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_MAE_Man_Clases" InsertCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_Clases" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                        <asp:Parameter Name="ClaseId" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="ClaseResumen" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="ClaseId" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="ClaseResumen" Type="String" />
                        <asp:Parameter Name="CodMetLife" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="ClaseId" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="ClaseResumen" Type="String" />
                        <asp:Parameter Name="CodMetLife" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
