<%@ Page Title="Interface - Seguros de Corto Plazo" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="INT_SegCPlazo.aspx.vb" Inherits="SegurosIICA.INT_SegCPlazo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        function fileinfo() {

            document.getElementById('<%= txt_Filename.ClientID %>').value = document.getElementById('<%= fu_Cargar.ClientID %>').value;
        }

        function inform() {
            document.getElementById('<%= txt_Filename.ClientID %>').value = "Filename has been changed";
        }

    </script>

   <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Interface de Cuentas de Corto Plazo"></asp:Localize>
                </h3>
            </div>
        </div>

    </div>

    <div class="form-body">
        <div class="panel panel-default">
        <div class="panel-heading">
            <h2><asp:Localize ID="lcl_Tit_Resumen" runat="server" Text="Periodos Aplicados"></asp:Localize></h2>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upAjax_CortoPlazo" runat="server">
                <ContentTemplate>
                    <div class="col-md-4">
                        <asp:GridView ID="gv_PeriodosCargados" CssClass="table-striped table-bordered table" runat="server" AllowPaging="True" AllowSorting="True" PageSize="5" Width="100%" AutoGenerateColumns="False" DataKeyNames="id_Interface" DataSourceID="sqDS_PeriodosCargados">
                            <Columns>
                                <asp:TemplateField HeaderText="Periodo" SortExpression="Periodo">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Periodo" runat="server" Text='<%# Eval("Periodo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                    <ItemTemplate>
                                        <asp:Panel ID="pnl_Estado" runat="server" Visible='<%# Eval("Estado") %>'>
                                            <span class="fa fa-check-square-o icon-seguros"></span>
                                        </asp:Panel>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Aplicado" SortExpression="FechaAplicado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_FechaAplicado" runat="server" Text='<%# Eval("FechaAplicado", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="30%" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqDS_PeriodosCargados" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_INT_Get_Lista_Periodos_CortoPlazo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-md-8">

                <asp:FileUpload ID="fu_Cargar" runat="server" onChance="inform();" style="display:none;"/>
                
                <asp:LinkButton ID="lnk_Cargar" runat="server" CssClass="btn btn-iica-green" >
                    <span class="glyphicon glyphicon-upload"></span>
                        <asp:Localize ID="lcl_Cargar" runat="server" Text="Cargar Archivo..."></asp:Localize>
                </asp:LinkButton>
                <asp:TextBox ID="txt_Filename" runat="server" CssClass="mytext" ></asp:TextBox>
                <hr />
                <asp:Button ID="btnUpload" Text="Cargar Datos" runat="server" OnClick="UploadFile" cssclass="btn btn-default btn-iica-green"/>

            </div>

        </div>
    </div>

    </div>



</asp:Content>
