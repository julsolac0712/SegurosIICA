<%@ Page Title="Mantenimiento de Sedes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Sedes.aspx.vb" Inherits="SegurosIICA.Sedes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Mantenimiento de Sedes"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdf_Operacion" runat="server" />
    <div class="form-body">

        <asp:GridView ID="gv_Sedes" runat="server" CssClass="table table-bordered" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlDS_Sedes" Width="100%" DataKeyNames="id_Sedes,lastUpdate">
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
                <asp:TemplateField HeaderText="Código" SortExpression="Codigo">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_Codigo" runat="server" Text='<%# Bind("Codigo") %>' CssClass="form-control" Width ="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Codigo" runat="server" Text='<%# Eval("Codigo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_Nombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area" SortExpression="Area">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_Area" runat="server" Text='<%# Bind("Area") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Area" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SedeIICA" SortExpression="SedeIICA">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkb_SedeIICA" runat="server" Checked='<%# Bind("SedeIICA") %>'/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkb_SedeIICA_lbl" runat="server" Checked='<%# Eval("SedeIICA") %>' Enabled="false"/>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cód. Sede" SortExpression="CodSede">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_CodSede" runat="server" Text='<%# Bind("CodSede") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_CodSede" runat="server" Text='<%# Eval("CodSede") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cuenta Contable" SortExpression="CuentaContable">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_CuentaContable" runat="server" Text='<%# Bind("CuentaContable") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_CuentaContable" runat="server" Text='<%# Eval("CuentaContable") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Centro Costo" SortExpression="CentroCosto">
                    <EditItemTemplate>
                        <asp:Textbox ID="txt_CentroCosto" runat="server" Text='<%# Bind("CentroCosto") %>' CssClass="form-control" Width="98%"></asp:Textbox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_CentroCosto" runat="server" Text='<%# Eval("CentroCosto") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fondo" SortExpression="id_Fondo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_Fondo" runat="server" CssClass="form-control" Width="98%" SelectedValue='<%# Bind("id_Fondo") %>'>
                            <asp:ListItem Value="0" Text="--Seleccionar--"></asp:ListItem>
                            <asp:ListItem Value="1" Text="A21"></asp:ListItem>
                            <asp:ListItem Value="2" Text="A81"></asp:ListItem>
                            <asp:ListItem Value="3" Text="A91"></asp:ListItem>
                </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Fondo" runat="server" Text='<%# Eval("Fondo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDS_Sedes" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" DeleteCommand="SEGIICA_MAE_Man_Sedes" DeleteCommandType="StoredProcedure" InsertCommand="SEGIICA_MAE_Man_Sedes" InsertCommandType="StoredProcedure" SelectCommand="SEGIICA_MAE_Get_Lista_Sedes" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_Sedes" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                <asp:Parameter Name="Codigo" Type="String" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="SedeIICA" Type="Boolean" />
                <asp:Parameter Name="CodSede" Type="String" />
                <asp:Parameter Name="CuentaContable" Type="String" />
                <asp:Parameter Name="CentroCosto" Type="String" />
                <asp:Parameter Name="id_Fondo" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                <asp:Parameter Name="Codigo" Type="String" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="SedeIICA" Type="Boolean" />
                <asp:Parameter Name="CodSede" Type="String" />
                <asp:Parameter Name="CuentaContable" Type="String" />
                <asp:Parameter Name="CentroCosto" Type="String" />
                <asp:Parameter Name="id_Fondo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
