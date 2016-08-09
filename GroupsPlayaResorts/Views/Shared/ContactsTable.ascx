<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


   <script type="text/javascript">
       $(document).ready(function () {

           $('#DeleteRequestContact').click(function (e) {

               if ($('input[name=ContactRadio]:checked').length > 0) {

                   //alert($('input[name=MarketRadio]:checked').val())
                   document.getElementById("DeleteContactID").value = $('input[name=ContactRadio]:checked').val()
                   $('#contactdeletemodal').modal('show')

               }

           })

      });

   </script>


<% Using Ajax.BeginForm("CatalogContacts", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">
     <%
         If (ViewData("idseccion4subseccion7edit_permission") IsNot Nothing And ViewData("idseccion4subseccion7edit_permission") > 0) Then
             Response.Write("<button id=""EditRequestContact""  name=""ContactButtons"" value=""Edit_Request_Contact"" class=""btn btn-default"" ><i class=""fa fa-pencil-square-o""></i> Edit</button>")
         End If
                                            
         If (ViewData("idseccion4subseccion7delete_permission") IsNot Nothing And ViewData("idseccion4subseccion7delete_permission") > 0) Then
             Response.Write("<a id=""DeleteRequestContact""  class=""btn btn-default"">Delete</a>")
         End If
    %>                                                                                     
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
                                                            <th data-field="Contact&nbsp;Name" >Contact Name</th>
                                                            <th data-field="Email" >Email</th>
                                                            <th data-field="Telephone" >Telephone</th>
                                                            <th data-field="Contact&nbsp;Type" >Contact Type</th>
                                                            <th data-field="Wholesale&nbsp;Company" >Wholesale / Company</th>
                                                        </tr>
                                                      </thead>
                   

                                                       <tbody >

                                                             <% 
                                                             Dim i As Integer
                
   
                                                                 For i = 0 To Model.ListContactsin.Count - 1
                     
                                                                     Response.Write("<tr>")
                                                                     
                                                                     Response.Write("<td class=""bs-checkbox"">")
                                                                     Response.Write("<input type=""radio"" class=""custom-check2"" id=""ContactRadio"" name=""ContactRadio"" value=""" + Model.ListContactsin.Item(i).Id_Contact.ToString + """  ><label class=""check2""></label>")
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListContactsin.Item(i).Contact_Name)
                                                                     Response.Write("</td>")
                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListContactsin.Item(i).Contact_Email)
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListContactsin.Item(i).Contact_Phone)
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     
                                                                     If Model.ListContactsin.Item(i).Contact_Type = 1 Then
                                                                         Response.Write("Wholesale")
                                                                     Else
                                                                         Response.Write("Company")
                                                                     End If
                                                                    
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListContactsin.Item(i).Contact_CompanyWhosale)
                                                                     Response.Write("</td>")
                    
                                                                     Response.Write("</tr>")
                                                                 Next
                
                                                                %>
                                                           

                                                            
                                                        </tbody>
                                                 

      </table>


<% End Using %>

