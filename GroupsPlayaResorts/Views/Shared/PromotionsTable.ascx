<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<%--<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestSupplier').click(function (e) {

            if ($('input[name=SupplierRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteSupplierID").value = $('input[name=SupplierRadio]:checked').val()
                $('#deletesupplierModal').modal('show')

            }

        })

    });

</script>--%>

<%--<% Using Ajax.BeginForm("CatalogPromotions", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>--%>


                                              <div id="toolbar">
                                                  <%-- <button id="EditRequestSupplier"  name="SupplierButtons" value="Edit_Request_Supplier" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>--%>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                    <%--<a id="DeleteRequestSupplier"  class="btn btn-default">Delete</a>--%>

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
                                                          <%--<th data-field="Action" data-switchable="false"></th>--%>
                                                            <th data-field="Property" >Property</th>
                                                            <th data-field="Room&nbsp;Type" >Room Type</th>
                                                            <th data-field="Rate&nbsp;Name" >Rate Name</th>
                                                            <th data-field="Year" >Year</th>
                                                            <th data-field="Discount" >Discount</th>
                                                            <th data-field="Initial&nbsp;Date" >Initial Date</th>
                                                            <th data-field="End&nbsp;Date" >End Date</th>
                                                            <th data-field="Booking&nbsp;Initial&nbsp;Date" >Booking Initial Date</th>
                                                            <th data-field="Booking&nbsp;End&nbsp;Date" >Booking End Date</th>
                                                            <th data-field="Activation&nbsp;Date" >Activation Date</th>
                                                        </tr>

                                                      </thead>

                                                       <tbody>

                                                            <% 
                                                             Dim i As Integer
                
   
                                                                For i = 0 To Model.ListPromoin.Count - 1
                     
                                                                    Response.Write("<tr>")
                                                                     
                                                                    'Response.Write("<td class=""bs-checkbox"">")
                                                                    'Response.Write("<input type=""radio"" class=""custom-check2"" id=""SupplierRadio"" name=""SupplierRadio"" value=""" + Model.ListSupplierin.Item(i).Id_Supplier.ToString + """  ><label class=""check2""></label>")
                                                                    'Response.Write("</td>")
                                                                     
                                                                    Response.Write("<td>")
                                                                    Select Case Model.ListPromoin.Item(i).CveHotel
                                                                        Case "GCR"
                                                                            Response.Write("GRAN CARIBE CANCUN")
                                                                        Case "GPR"
                                                                            Response.Write("GRAN PORTO PLAYA DEL CARMEN")
                                                                        Case "RPR"
                                                                            Response.Write("THE ROYAL PLAYA DEL CARMEN")
                                                                        Case "TRC"
                                                                            Response.Write("HYATT ZILARA CANCUN")
                                                                        Case "ZLJ"
                                                                            Response.Write("HYATT ZILARA ROSE HALL JAMAICA")
                                                                        Case "ZVC"
                                                                            Response.Write("HYATT ZIVA CANCUN")
                                                                        Case "ZVJ"
                                                                            Response.Write("HYATT ZIVA ROSE HALL JAMAICA")
                                                                        Case "ZVL"
                                                                            Response.Write("HYATT ZIVA LOS CABOS")
                                                                        Case "ZVP"
                                                                            Response.Write("HYATT ZIVA PUERTO VALLARTA")
                                         
                                                                    End Select
                                                                    Response.Write("</td>")
                     
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).RoomType)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).RateName)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).Ano)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).Discount)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).InitialDate)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).EndDate)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).BookingInitialDate)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).BookingEndDate)
                                                                    Response.Write("</td>")
                                                                    
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListPromoin.Item(i).ActiveDate)
                                                                    Response.Write("</td>")
                    
                                                                    Response.Write("</tr>")
                                                                Next
                
                                                                %>
                                                             
                                                        </tbody>

                                                  </table>



<%--<% End Using %>--%>
