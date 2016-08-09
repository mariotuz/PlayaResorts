<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestDistribution').click(function (e) {

            if ($('input[name=DistributionGroupRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteDistributionID").value = $('input[name=DistributionGroupRadio]:checked').val()
                $('#distributiondeletemodal').modal('show')

            }

        })

    });

</script>

<% Using Ajax.BeginForm("CatalogDistribution", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


 <div id="toolbar">
                                                   <button id="EditRequestDistribution"  name="DistributionGroupsButtons" value="Edit_Request_Distribution" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>
                                                    <a id="DeleteRequestDistribution"  class="btn btn-default">Delete</a>

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
                                                            <th data-field="Distribution&nbsp;Group&nbsp;Name" >Distribution Group Name</th>
                                                            <th data-field="Property" >Property</th>
                                                        </tr>
                                                      </thead>

                                                       <tbody>

                                                            <% 
                                                             Dim i As Integer
                
   
                                                                For i = 0 To Model.ListDistributionGroupsin.Count - 1
                     
                                                                    Response.Write("<tr>")
                                                                     
                                                                    Response.Write("<td class=""bs-checkbox"">")
                                                                    Response.Write("<input type=""radio"" class=""custom-check2"" id=""DistributionGroupRadio"" name=""DistributionGroupRadio"" value=""" + Model.ListDistributionGroupsin.Item(i).Id_DistributionGroup.ToString + """  ><label class=""check2""></label>")
                                                                    Response.Write("</td>")
                                                                     
                                                                    Response.Write("<td>")
                                                                    Response.Write(Model.ListDistributionGroupsin.Item(i).DistributionGroup_Name)
                                                                    Response.Write("</td>")
                     
                                                                    Response.Write("<td>")
                                                                    Select Case Model.ListDistributionGroupsin.Item(i).DistributionGroup_Property
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
                                                                    'Response.Write(Model.ListDistributionGroupsin.Item(i).DistributionGroup_Property)
                                                                    Response.Write("</td>")
                    
                                                                    Response.Write("</tr>")
                                                                Next
                
                                                                %>
                                                             
                                                        </tbody>
                                                  </table>



<% End Using %>
