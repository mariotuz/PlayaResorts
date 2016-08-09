<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


 <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


   <script type="text/javascript">
       $(document).ready(function () {

           $('#DeleteRequestMarket').click(function (e) {

               if ($('input[name=MarketRadio]:checked').length > 0) {

                   //alert($('input[name=MarketRadio]:checked').val())
                   document.getElementById("DeleteMarketID").value = $('input[name=MarketRadio]:checked').val()
                   $('#marketdeletemodal').modal('show')

               }

           })

      });

     </script>


<% Using Ajax.BeginForm("CatalogMarkets", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">
     <% 
         If (ViewData("idseccion4subseccion3edit_permission") IsNot Nothing And ViewData("idseccion4subseccion3edit_permission") > 0) Then
             Response.Write("<button id=""EditRequestMarket""  name=""MarketButtons"" value=""Edit_Request_Market"" class=""btn btn-default"" ><i class=""fa fa-pencil-square-o""></i> Edit</button>")
         End If
         
         If (ViewData("idseccion4subseccion3delete_permission") IsNot Nothing And ViewData("idseccion4subseccion3delete_permission") > 0) Then
             Response.Write("<a id=""DeleteRequestMarket""  class=""btn btn-default"">Delete</a>")
         End If
     %>
 </div> 


    <table class="table-no-bordered" id="table-list" data-toggle="table" data-show-export="false"  data-pagination="true" data-search="true" data-show-columns="false"  data-toolbar="#toolbar"  data-filter-control="false"  data-page-size="10">
                                                      <thead>
                                                        <tr>
                                                            <th data-field="Action" data-switchable="false">Actions</th>
                                                            <th data-field="Market" >Market Name</th>
                                                            <th data-field="Key&nbsp;Market" >Key Market</th>
                                                        </tr>
                                                      </thead>
                   

                                                       <tbody >

                                                             <% 
                                                             Dim i As Integer
                
   
                                                                 For i = 0 To Model.ListMarketin.Count - 1
                     
                                                                     Response.Write("<tr>")
                                                                     
                                                                     Response.Write("<td class=""bs-checkbox"">")
                                                                     Response.Write("<input type=""radio"" class=""custom-check2"" id=""MarketRadio"" name=""MarketRadio"" value=""" + Model.ListMarketin.Item(i).Id_Market.ToString + """  ><label class=""check2""></label>")
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListMarketin.Item(i).Market_Name)
                                                                     Response.Write("</td>")
                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListMarketin.Item(i).Market_Key)
                                                                     Response.Write("</td>")
                    
                                                                     Response.Write("</tr>")
                                                                 Next
                
                                                                %>
                                                           

                                                            
                                                        </tbody>
                                                 

      </table>


<% End Using %>

