<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestMeasure').click(function (e) {

            if ($('input[name=UnitMeasureRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteMeasureID").value = $('input[name=UnitMeasureRadio]:checked').val()
                $('#measuredeletemodal').modal('show')

            }

        })

    });

</script>

<% Using Ajax.BeginForm("CatalogUnitMeasure", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">
     <%
         If (ViewData("idseccion4subseccion13edit_permission") IsNot Nothing And ViewData("idseccion4subseccion13edit_permission") > 0) Then
             Response.Write("<button id=""EditRequestMeasure""  name=""UnitMeasureButtons"" value=""Edit_Request_Measure"" class=""btn btn-default"" ><i class=""fa fa-pencil-square-o""></i> Edit</button>")
         End If
                                            
         If (ViewData("idseccion4subseccion13delete_permission") IsNot Nothing And ViewData("idseccion4subseccion13delete_permission") > 0) Then
             Response.Write("<a id=""DeleteRequestMeasure""  class=""btn btn-default"">Delete</a>")
         End If
    %>
    <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
 </div> 

                                        <table class="table-no-bordered" id="table-list"
                                                         data-toggle="table"
                                                         data-show-export="false"
                                                         data-pagination="true"
                                                         data-search="true"
                                                         data-show-columns="false"
                                                         data-toolbar="#toolbar"
                                                         data-filter-control="true"
                                                         data-page-size="10"
                                                         >
                                                      <thead>
                                                        <tr>
                                                            <th data-field="Action" data-switchable="false"></th>
                                                            <th data-field="Unit&nbsp;Measure " data-filter-control="select">Unit Measure</th>
                                                            <th data-field="Measure&nbsp;Key" data-filter-control="select">Measure Key</th>
                                                        </tr>
                                                      </thead>

                                                       <tbody >

                                                             <% 
                                                             Dim i As Integer
                
   
                                                             For i = 0 To Model.ListUnitMeasurein.Count - 1
                     
                                                                     Response.Write("<tr>")
                                                                     
                                                                     Response.Write("<td class=""bs-checkbox"">")
                                                                     Response.Write("<input type=""radio"" class=""custom-check2"" id=""UnitMeasureRadio"" name=""UnitMeasureRadio"" value=""" + Model.ListUnitMeasurein.Item(i).Id_Unit.ToString + """  ><label class=""check2""></label>")
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListUnitMeasurein.Item(i).Unit_Name)
                                                                     Response.Write("</td>")
                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListUnitMeasurein.Item(i).Unit_Key)
                                                                     Response.Write("</td>")
                    
                                                                     Response.Write("</tr>")
                                                             Next
                
                                                                %>
                                                           

                                                            
                                                        </tbody>
                                                 

      </table>


<% End Using %>

