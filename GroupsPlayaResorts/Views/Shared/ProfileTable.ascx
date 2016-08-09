<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestProfile').click(function (e) {

            if ($('input[name=ProfileRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteProfileID").value = $('input[name=ProfileRadio]:checked').val()
                $('#profiledeletemodal').modal('show')

            }

        })

    });

</script>

<% Using Ajax.BeginForm("CatalogProfiles", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


                                               <div id="toolbar">
                                                    <button id="EditRequestProfile"  name="ProfileButtons" value="Edit_Request_Profile" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                    <a id="DeleteRequestProfile"  class="btn btn-default">Delete</a>
                                                                                                       
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
                                                            <th data-field="Profile&nbsp;Name" >Profile Name</th>
                                                          
                                                        </tr>
                                                      </thead>

                                                       <tbody>
                                                           <% 
                                                             Dim i As Integer
                
   
                                                               For i = 0 To Model.ListProfilein.Count - 1
                     
                                                                   Response.Write("<tr>")
                                                                     
                                                                   Response.Write("<td class=""bs-checkbox"">")
                                                                   Response.Write("<input type=""radio"" class=""custom-check2"" id=""ProfileRadio"" name=""ProfileRadio"" value=""" + Model.ListProfilein.Item(i).Id_Profile.ToString + """  ><label class=""check2""></label>")
                                                                   Response.Write("</td>")
                                                                     
                                                                   Response.Write("<td>")
                                                                   Response.Write(Model.ListProfilein.Item(i).Profile_Name)
                                                                   Response.Write("</td>")
                     
                                                                   
                    
                                                                   Response.Write("</tr>")
                                                               Next
                
                                                                %>
                                                             
                                                             
                                                      
                                                             
                                                        </tbody>
                                                  </table>



<% End Using %>

