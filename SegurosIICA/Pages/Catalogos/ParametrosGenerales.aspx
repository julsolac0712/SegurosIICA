<%@ Page Title="Parámetros Generales" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ParametrosGenerales.aspx.vb" Inherits="SegurosIICA.ParametrosGenerales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdf_Usuario" runat="server" />
    
    <div class="form-header">
        <div class="row">
            <div class="col-md-8">
                <h3>
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Parámetros Generales de Seguros"></asp:Localize>
                </h3>

            </div>
            <div class="col-md-4 alinear-derecha">
            </div>
        </div>
    </div>

    <div class="form-body">

        <div class="row">
            <div class="col-md-3">
                <span class="page-titles">
                    <asp:Localize ID="lcl_tit_CATIE" runat="server" Text="CATIE"></asp:Localize>
                </span>
            </div>
        </div>
        <div class="row margin-left-40 margin-top-10">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_cta_CATIE" runat="server" Text="Cuenta Contable" AssociatedControlID="txt_cta_CATIE"></asp:Label>
                <asp:TextBox ID="txt_cta_CATIE" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
        </div>
        <div class="row margin-left-40 margin-top-10" >
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_CC" runat="server" Text="Centro Costo" AssociatedControlID="txt_CC"></asp:Label>
                <asp:TextBox ID="txt_CC" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Fondo" runat="server" Text="Fondo" AssociatedControlID="ddl_Fondo"></asp:Label>
                <asp:DropDownList ID="ddl_Fondo" runat="server" CssClass="form-control" Width="70%">
                    <asp:ListItem Value="0" Text="--Seleccionar--"></asp:ListItem>
                    <asp:ListItem Value="1" Text="A21"></asp:ListItem>
                    <asp:ListItem Value="2" Text="A81"></asp:ListItem>
                    <asp:ListItem Value="3" Text="A91"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_PEP" runat="server" Text="Elemento PEP" AssociatedControlID="txt_PEP"></asp:Label>
                <asp:TextBox ID="txt_PEP" runat="server" CssClass="form-control" Width="98%" MaxLength="17"></asp:TextBox>
            </div>
        </div>

        <hr />

        <div class="row margin-top-30">
            <div class="col-md-3">
                <span class="page-titles">
                    <asp:Localize ID="lcl_tit_IICA" runat="server" Text="IICA"></asp:Localize>
                </span>
            </div>
        </div>

        <div class="row margin-right-10">
            <div class="col-md-3">
                <h5><asp:Localize ID="lcl_tit_Exfuncionarios" runat="server" Text="Exfuncionarios"></asp:Localize></h5>
            </div>
        </div> 
        <div class="row" style="margin-left:40px;">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_cta_Exfun" runat="server" Text="Cuenta Contable" AssociatedControlID="txt_cta_Exfun"></asp:Label>
                <asp:TextBox ID="txt_cta_Exfun" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
        </div>
        <div class="row" style="margin-left:40px;">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_CC_Exfun" runat="server" Text="Centro Costo" AssociatedControlID="txt_CC_Exfun"></asp:Label>
                <asp:TextBox ID="txt_CC_Exfun" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Fondo_Exfun" runat="server" Text="Fondo" AssociatedControlID="ddl_Fondo_Exfun"></asp:Label>
                <asp:DropDownList ID="ddl_Fondo_Exfun" runat="server" CssClass="form-control" Width="70%">
                    <asp:ListItem Value="0" Text="--Seleccionar--"></asp:ListItem>
                    <asp:ListItem Value="1" Text="A21"></asp:ListItem>
                    <asp:ListItem Value="2" Text="A81"></asp:ListItem>
                    <asp:ListItem Value="3" Text="A91"></asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>

        <br />
         <div class="row">
            <div class="col-md-3">
                <h5><asp:Localize ID="lcl_tit_AutosOficiales" runat="server" Text="Autos Oficiales"></asp:Localize></h5>
            </div>
        </div> 
        <div class="row" style="margin-left:40px;">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_cta_Autos" runat="server" Text="Cuenta Contable (Anual)" AssociatedControlID="txt_cta_Autos"></asp:Label>
                <asp:TextBox ID="txt_cta_Autos" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
        </div>
        
        <div class="row margin-top-20">
            <div class="col-md-3">
                <h5><asp:Localize ID="lcl_tit_Obligatorios" runat="server" Text="Obligatorios"></asp:Localize></h5>
            </div>
        </div>
        <div class="row" style="margin-left: 40px;">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Cta_Obligatorio" runat="server" Text="Cuenta Contable (Anual)" AssociatedControlID="txt_cta_Obligatorio"></asp:Label>
                <asp:TextBox ID="txt_cta_Obligatorio" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Factor" runat="server" Text="Factor" AssociatedControlID="txt_factor"></asp:Label>
                <asp:TextBox ID="txt_factor" runat="server" CssClass="form-control" Width="50%"></asp:TextBox>
            </div>
        </div>
        
 
        <div class="row margin-top-20">
            <div class="col-md-3">
                <h5><asp:Localize ID="lcl_tit_Voluntarios" runat="server" Text="Voluntarios (Países)"></asp:Localize></h5>
            </div>
        </div> 
        <div class="row" style="margin-left:40px;">
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Cta_Voluntario" runat="server" Text="Cuenta Contable (Patronal Anual)" AssociatedControlID="txt_cta_Voluntario"></asp:Label>
                <asp:TextBox ID="txt_cta_Voluntario" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_tit_Cta_Voluntario2" runat="server" Text="Cuenta Contable" AssociatedControlID="txt_cta_Voluntario2"></asp:Label>
                <asp:TextBox ID="txt_cta_Voluntario2" runat="server" CssClass="form-control" Width="98%" MaxLength="10"></asp:TextBox>
            </div>

        </div>

        <div class="row" style="margin: 40px;">
            <div class="col-md-12">
                <asp:LinkButton ID="lnkBtn_Guardar" runat="server" CssClass="btn btn-iica-green"> <span class="glyphicon glyphicon-floppy-saved imagen-enviar"></span><asp:Localize ID="lcl_Guardara" runat="server" Text="Actualizar"></asp:Localize></asp:LinkButton>
            </div>
        </div>
        <asp:SqlDataSource ID="sqlDS_Parametros" runat="server" ConnectionString="<%$ ConnectionStrings:SegurosConnectionString %>" SelectCommand="SEGIICA_MAE_Get_Lista_Parametros" SelectCommandType="StoredProcedure" UpdateCommand="SEGIICA_MAE_Man_Parametros" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_Parametro" Type="Int32" />
                <asp:ControlParameter ControlID="txt_cta_CATIE" DefaultValue="" Name="Cta_Catie" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_CC" Name="CC_Catie" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddl_Fondo" Name="id_Fondo_Catie" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txt_PEP" Name="PEP_Catie" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_cta_Exfun" Name="Cta_Exfuncionarios" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_CC_Exfun" Name="CC_Exfuncionarios" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddl_Fondo_Exfun" Name="id_Fondo_Exfuncionarios" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txt_cta_Autos" Name="Cta_Autos" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_cta_Obligatorio" Name="Cta_Obligatorios" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_factor" Name="FactorObligatorio" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="txt_cta_Voluntario" Name="Cta_VoluntariosPatrono" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_cta_Voluntario2" Name="Cta_Voluntarios" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="0" Name="Usuario" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        

    </div>
</asp:Content>
