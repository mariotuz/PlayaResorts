<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


   <script type="text/javascript">
       $(document).ready(function () {

           $('#DeleteRequestCompany').click(function (e) {

               if ($('input[name=CompanyRadio]:checked').length > 0) {

                   //alert($('input[name=MarketRadio]:checked').val())
                   document.getElementById("DeleteCompanyID").value = $('input[name=CompanyRadio]:checked').val()
                   $('#companydeletemodal').modal('show')

               }

           })

      });

   </script>


<% Using Ajax.BeginForm("CatalogCompanies", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">

                                                  <button id="EditRequestCompany"  name="CompanyButtons" value="Edit_Request_Company" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                  <a id="DeleteRequestCompany"  class="btn btn-default">Delete</a>
                                                                                           
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
                                                             <th data-field="Company&nbsp;Name" >Company Name</th>
                                                            <th data-field="Key&nbsp;Company" >Key Company</th>
                                                        </tr>
                                                      </thead>
                   

                                                       <tbody >

                                                             <% 
                                                             Dim i As Integer
                
   
                                                                 For i = 0 To Model.ListCompaniesin.Count - 1
                     
                                                                     Response.Write("<tr>")
                                                                     
                                                                     Response.Write("<td class=""bs-checkbox"">")
                                                                     Response.Write("<input type=""radio"" class=""custom-check2"" id=""CompanyRadio"" name=""CompanyRadio"" value=""" + Model.ListCompaniesin.Item(i).Id_Company.ToString + """  ><label class=""check2""></label>")
                                                                     Response.Write("</td>")
                                                                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListCompaniesin.Item(i).Company_Name)
                                                                     Response.Write("</td>")
                     
                                                                     Response.Write("<td>")
                                                                     Response.Write(Model.ListCompaniesin.Item(i).Company_Key)
                                                                     Response.Write("</td>")
                    
                                                                     Response.Write("</tr>")
                                                                 Next
                
                                                                %>
                                                           

                                                            
                                                        </tbody>
                                                 

      </table>


<% End Using %>

