<%@ Page Title="Sistema de Seguros IICA" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.vb" Inherits="SegurosIICA._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Usuario" runat="server" />

    <div class="container">
         <div class="jumbotron">
                <div class="row">
                    <div class="col-md-8" id="Titulo">
                        
                            <asp:Localize ID="lcl_Descripcion" runat="server" Text="Sistema de Seguros del IICA"></asp:Localize>
                        
                    </div>
                </div>
             </div>


            <div class="contenedor">
                <img src="../Images/bigpic-seguro.png" width="300px" style="padding:10px;">
                <div class="row" style="font-size:18px; padding:50px;">
                    <asp:Localize ID="lcl_texto1" runat="server" Text="Este instrumento tiene como finalidad el registro y la administración de la información relacionada con los diferentes tipos de Seguros que el IICA ofrece a sus funcionarios, tanto locales como internacionales; bajo un catálogo de coberturas que el funcionario adquiere de forma automática cuando se incorpora al instituto y otros seguros que puede inscribir de forma voluntaria."></asp:Localize>
                    <br />
                    <br />
                    <asp:Localize ID="lcl_texto2" runat="server" Text="Para más información accesar el siguiente enlace"></asp:Localize>
                    <a href="http://intranet.iica.int/es/DelPersonal/Paginas/Seguros.aspx"><asp:Localize ID="lcl_link" runat="server" Text="Seguros IICA"></asp:Localize></a>
                </div>

            </div>
    </div>

 
</asp:Content>
