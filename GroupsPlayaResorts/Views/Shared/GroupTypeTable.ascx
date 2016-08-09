<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


   <script type="text/javascript">
       $(document).ready(function () {

           $('#DeleteRequestGroupType').click(function (e) {

               if ($('input[name=GroupTypeRadio]:checked').length > 0) {

                   //alert($('input[name=MarketRadio]:checked').val())
                   document.getElementById("DeleteGroupTypeID").value = $('input[name=GroupTypeRadio]:checked').val()
                   $('#grouptypedeletemodal').modal('show')

               }

           })

       });

     </script>


<% Using Ajax.BeginForm("CatalogGroupType", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">

                                                  <button id="EditRequestGroupType"  name="GroupTypeButtons" value="Edit_Request_GroupType" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                  <a id="DeleteRequestGroupType"  class="btn btn-default">Delete</a>
                                                                                           
 </div> 

                                        <table class="table-no-bordered" id="table-list"
                                                         data-toggle="table"
                                                         data-show-export="false"
                                                         data-pagination="true"
                                                         data-search="true"
                                                         data-show-columns="false"
                                                         data-toolbar="#toolbar"
                                                         data-filter-control="false"
                                                         data-page-size="10"
                                                         >
                                                      <thead>
                                                        <tr>
                                                          <th data-field="Action" data-switchable="false">Actions</th>
                                                          <th data-field="Group&nbsp;Type" >Group Type</th>
                                                           
                                                        </tr>
                                                      </thead>
                   

                                                       <tbody >

                                                             <% 
                                                             Dim i As Integer
                
   
                                                                 For i = 0 To Model.ListGroupTypein.Count - 1
                     
                                                                     Response.Write("<tr>")
                                                                     
                                                                     Response.Write("<td class=""bs-checkbox"">")
                                                                     Response.Write("<input type=""radio"" class=""custom-check2"" id=""GroupTypeRadio"" name=""GroupTypeRadio"" value=""" + Model.ListGroupTypein.Item(i).Id_GroupType.ToString + """  ><label class=""check2""></label>")
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListGroupTypein.Item(i).GroupType_Name)
                                                                     Response.Write("</td>")
                     
                                                             
                    
                                                                     Response.Write("</tr>")
                                                                 Next
                
                                                                %>
                                                           

                                                            
                                                        </tbody>
                                                 

      </table>


<% End Using %>


                                          
                                                