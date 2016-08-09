<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

 <!--bootstrap table part 2-->
    <script src="<%: Url.Content("~/Scripts/table/extensions/export/bootstrap-table-export.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/export.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/tableExport.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/html2canvas.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jspdf.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jspdf.plugin.autotable.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jquery.base64.js")%>"></script>



    <!--<script src="//rawgit.com/hhurz/tableExport.jquery.plugin/master/jquery.base64.js"></script>-->
    <script src="<%: Url.Content("~/Scripts/table/extensions/resizable/bootstrap-table-resizable.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/table/locals/bootstrap-table-en-US.min.js")%>"></script><!-- put your locale files after bootstrap-table.js -->

    <script type="text/javascript">
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("active");
        });
    </script>

    <script type="text/javascript">
        $('.scroll').scrollator();

    
    </script>

<% If Request.FilePath.ToString = "/Groups/GroupDetail" Or Request.FilePath.ToString = "/Catalogs/CatalogContacts"   Then %>
            
     <script  type="text/javascript">
         var d = new Date();
         //document.getElementById("date").innerHTML = d.toDateString();
         $("#date").html(d.toDateString());
    </script>

    <!--select whith icons-->
 
    <script src="<%: Url.Content("~/Scripts/select/select-icons.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/select/selectboxit.js")%>"></script>
    <script>
        $(function () {
            var selectBox = $(".select-status").selectBoxIt();
        });
    </script>

   

<% End If %>


<% If Request.FilePath.ToString = "/Catalogs/CatalogProperties" Or Request.FilePath.ToString = "/Groups/GroupDetail" Or Request.FilePath.ToString = "/Groups/GroupsList" Or Request.FilePath.ToString = "/Catalogs/CatalogDistribution" Then%>

 <script type="text/javascript" src="<%: Url.Content("~/Scripts/add/add_items.js")%>"></script>

<% End If %>