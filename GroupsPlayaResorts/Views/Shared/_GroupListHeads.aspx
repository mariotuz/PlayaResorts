<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

     <!--AMy css-->
    <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/mycss.css")%>">
    <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/normalize.css")%>">
    <!-- fonts awesome -->
    <link href="<%: Url.Content("~/Content/font-awesome.css")%>" rel="stylesheet">
    <!--Scroll-->
<%--   
    <link href="<%: Url.Content("~/Content/normalize.css")%>" rel="stylesheet" type="text/css" >--%>

    <link href="<%: Url.Content("~/Content/scroll/fm.scrollator.jquery.css")%>" rel="stylesheet">

    <% If Request.FilePath.ToString = "/Groups/GroupDetail" Then%>
            
        <link href="<%: Url.Content("~/Content/status.css")%>" rel="stylesheet" type="text/css" >

        <link href="<%: Url.Content("~/Content/upload/upfiles.css")%>" rel="stylesheet">

    <% End If %>

    <!-- Bootstrap -->
    <link href="<%: Url.Content("~/Content/bootstrap.min.css")%>" rel="stylesheet">
    <link href="<%: Url.Content("~/Content/table/bootstrap-table.css")%>" rel="stylesheet">
    <link href="<%: Url.Content("~/Content/select/bootstrap-select.css")%>" rel="stylesheet" >
    <link href="<%: Url.Content("~/Content/datepicker/bootstrap-datetimepicker.min.css")%>" rel="stylesheet">
    <link href="<%: Url.Content("~/Content/validaciones.css")%>" rel="stylesheet">

    <%-- <link href="<%: Url.Content("~/Content/datepickernew/datepicker.css")%>" rel="stylesheet">
   --%>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- bootstrap -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src="<%: Url.Content("~/Content/datepickernew/jquery.js")%>"></script>   --%>
    <script src="<%: Url.Content("~/Scripts/jquery.min.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/en.js")%>"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%: Url.Content("~/Scripts/bootstrap/bootstrap.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>

    <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

    <script src="<%: Url.Content("~/Scripts/select/bootstrap-select.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/scroll/fm.scrollator.jquery.js")%>"></script>

    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/moment.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/transition.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/collapse.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/validaciones.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/bootbox.min.js")%>"></script>

  <% If Request.FilePath.ToString = "/Groups/Dashboard" Or Request.FilePath.ToString = "/Groups/GroupDetail" Or Request.FilePath.ToString = "/Catalogs/CatalogPromotions" Or Request.FilePath.ToString = "/Groups/GroupsList" Or Request.FilePath.ToString = "/Reports/ReportsDetail" Then%>
            
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/bootstrap-datetimepicker.js")%>"></script>

   <%-- <script type="text/javascript" src="<%: Url.Content("~/Content/datepickernew/bootstrap-datepicker.js")%>"></script>--%>

    <!--upload files-->
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/uploadfiles/upfiles.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/uploadfiles/startup.js")%>"></script>

  <% End If %>

    <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/Dashboard/loader.css")%>">

    <% If Request.FilePath.ToString = "/Groups/Dashboard" Then%>
        <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/Dashboard/basico.css")%>">
        <link href="<%: Url.Content("~/Content/bootstrap-switch.min.css")%>" rel="stylesheet" />

        <script src="<%: Url.Content("~/Scripts/Dashboard/Highcharts-4.2.1/js/highcharts.js")%>"></script>
        <script src="<%: Url.Content("~/Scripts/Dashboard/Highcharts-4.2.1/js/highcharts-3d.js")%>"></script>
        <script src="<%: Url.Content("~/Scripts/bootstrap-switch.min.js")%>"></script>
        <script type="text/javascript" src="<%: Url.Content("~/Scripts/Dashboard/moduloGraficas.js")%>"></script>
        <script type="text/javascript" src="<%: Url.Content("~/Scripts/Dashboard/index.js")%>"></script>
    <% End If %>



