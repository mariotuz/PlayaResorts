<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteUser').click(function (e) {

            if ($('input[name=UserRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteUserID").value = $('input[name=UserRadio]:checked').val()
                $('#userdeletemodal').modal('show')

            }

        })

    });

</script>

<% Using Ajax.BeginForm("CatalogUsers", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">

                                                    <button id="EditRequestUser"  name="UserButtons" value="Edit_Request_User" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                    <a id="DeleteUser"  class="btn btn-default">Delete</a>
                                                                                                            
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
                                                    <th data-field="Name" >User name</th>
                                                    <%--<th data-field="Email"  data-filter-control="select">Email</th>--%>
                                                    <%--<th data-field="Employe&nbsp;Number" data-filter-control="select">Employe Number</th>--%>
                                                    <th data-field="User&nbsp;Login" >User Login</th>
                                                    <%--<th data-field="Password" data-filter-control="select">Password</th>--%>
                                                    <%--<th data-field="Property" data-filter-control="select">Property</th>--%>
                                                    <th data-field="Profile" >Profile</th>
                                                   
                                                </tr>
                                              </thead>

                                               <tbody>
                                              
                                                     <% 
                                                             Dim i As Integer
                
   
                                                         For i = 0 To Model.ListUsersin.Count - 1
                     
                                                             Response.Write("<tr>")
                                                                     
                                                             Response.Write("<td class=""bs-checkbox"">")
                                                             Response.Write("<input type=""radio"" class=""custom-check2"" id=""UserRadio"" name=""UserRadio"" value=""" + Model.ListUsersin.Item(i).Id_User.ToString + """  ><label class=""check2""></label>")
                                                             Response.Write("</td>")
                                                                     
                                                             Response.Write("<td>")
                                                             Response.Write(Model.ListUsersin.Item(i).User_Name)
                                                             Response.Write("</td>")
                                                             
                                                             Response.Write("<td>")
                                                             Response.Write(Model.ListUsersin.Item(i).User_Login)
                                                             Response.Write("</td>")
                                                             
                                                             Response.Write("<td>")
                                                             Response.Write(Model.ListUsersin.Item(i).User_Profile)
                                                             Response.Write("</td>")
                                                             
                                                             Response.Write("</tr>")
                                                         Next
                
                                                                %>
                                                             
                                       
                                                     
                                                </tbody>
                                          </table>


<% End Using %>

