<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestSupplier').click(function (e) {

            if ($('input[name=SupplierRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteSupplierID").value = $('input[name=SupplierRadio]:checked').val()
                $('#deletesupplierModal').modal('show')

            }

        })

    });

</script>

<% Using Ajax.BeginForm("CatalogSupplier", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">
                                                   <button id="EditRequestSupplier"  name="SupplierButtons" value="Edit_Request_Supplier" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                    <a id="DeleteRequestSupplier"  class="btn btn-default">Delete</a>

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
                                                            <th data-field="Supplier&nbsp;Name" >Supplier Name</th>
                                                            <th data-field="RFC&nbsp;Supplier" >RFC Supplier</th>
                                                            <th data-field="Email" >Email</th>
                                                            <th data-field="Telephone&nbsp;1" >Telephone 1</th>
                                                            <th data-field="Telephone&nbsp;2" >Telephone 2</th>
                                                        </tr>
                                                      </thead>

                                                       <tbody>

                                                            <% 
                                                             Dim i As Integer
                
   
                                                                For i = 0 To Model.ListSupplierin.Count - 1
                     
                                                                    Response.Write("<tr>")
                                                                     
                                                                    Response.Write("<td class=""bs-checkbox"">")
                                                                    Response.Write("<input type=""radio"" class=""custom-check2"" id=""SupplierRadio"" name=""SupplierRadio"" value=""" + Model.ListSupplierin.Item(i).Id_Supplier.ToString + """  ><label class=""check2""></label>")
                                                                    Response.Write("</td>")
                                                                     
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListSupplierin.Item(i).Supplier_Name)
                                                                    Response.Write("</td>")
                     
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListSupplierin.Item(i).Supplier_RFC)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListSupplierin.Item(i).Supplier_Email)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListSupplierin.Item(i).Supplier_Phone1)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListSupplierin.Item(i).Supplier_Phone2)
                                                                    Response.Write("</td>")
                    
                                                                    Response.Write("</tr>")
                                                                Next
                
                                                                %>
                                                             
                                                        </tbody>
                                                  </table>



<% End Using %>
