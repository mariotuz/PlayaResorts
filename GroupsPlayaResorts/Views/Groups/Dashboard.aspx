<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsList)" %>
<asp:Content ID="GroupsListTitle" ContentPlaceHolderID="TitleContent" runat="server"> Dashboard</asp:Content>
<asp:Content ID="GroupsListContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Start Page content -->
    <div id="page-content-wrapper">
        <!-- Keep all page content within the page-content inset div! -->
        <div class="page-content inset"><!--Start page content wrapper-->
          <%--  <h2>Graphics </h2>--%>
            <div id="filtrosSeleccionados"></div>
            <div id="Dashboard"></div>
            <div class="clear"></div><br>
            <h2>Filters </h2>
            <div id="filtros">
                <select id="hoteles" class="filtros form-control" onchange="CambiaFiltro(1);"></select>
                <select id="agencias" class="filtros form-control" onchange="CambiaFiltro(2);"></select>
                <select id="tipoperiodo" class="filtros form-control" onchange="CambiaFiltro(3);"></select>
                <select id="tipofecha" class="filtros form-control" onchange="CambiaFiltro(4);"></select>
                <div class='input-group date filtros' id='datetimepicker1'>
                    <input type='text' class="form-control" data-format="YYYY-MM-DD" placeholder="Begin"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>

                <div class='input-group date filtros' id='datetimepicker2'>
                    <input type='text' class="form-control" data-format="YYYY-MM-DD" placeholder="End"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>

                <select id="statustipo" class="filtros form-control" onchange="LlenaSelectGrupoStatus();"></select>
                <select id="grupotipo" class="filtros form-control" onchange="CambiaFiltro(4);"></select>
                <input type="checkbox" name="versus" id="versus" class="filtros form-control" data-label-text="Versus">
            </div>
        </div><!-- end Page content wrapper-->
    </div><!--end page content-->
</asp:Content>
