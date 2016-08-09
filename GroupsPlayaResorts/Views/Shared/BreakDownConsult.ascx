<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


 <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<script type="text/javascript">


    $(document).ready(function () {
       
        $("#editbreakdownhotel").val($("#breakdownhotel").val());

    });

</script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#CancelBreakdown').click(function (e) {

            if ($('input[name=BreakDownRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("CancelbreakdownID").value = $('input[name=BreakDownRadio]:checked').val()
                $('#breakdowncancelmodal').modal('show')

            }

        })

    });

</script>



<div class=" breack-down-list col-xs-12 col-sm-12 col-md-12 nopadding">
    <ul class="col-xs-12 col-sm-12 col-md-6 col-lg-4 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Total Rooms</span>     <span class="dp number"><%: model.TotalNumRooms %></span> <div class="deploy">-<%: model.TotalDeployRooms %> <i class="fa fa-caret-down"></i><br> <div class="txt-dploy">Deployment</div></div> </li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Tentative Rooms</span> <span class="number"><%: model.TotalTentativeRooms %></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Adults</span>       <span class="number"><%: model.TotalAdults %></span></li>
    </ul>
    <ul class="col-xs-12 col-sm-12 col-md-6 col-lg-3 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Teenager</span>       <span class="number"><%: Model.TotalTeens%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Childs</span>       <span class="number"><%: Model.TotalChildrens%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Infants</span>       <span class="number"><%: model.TotalInfants %></span></li>
    </ul>
    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-5 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Total Of Deposits</span><span class="number">$ <%: FormatNumber(Model.TotalDeposit, 0, , , TriState.True)%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Balance</span>       <span class="number">$ <%: FormatNumber(Model.TotalBalance, 0, , , TriState.True)%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Estimated Revenue</span>        <span class="number">$ <%: FormatNumber(model.TotalRevenue, 0, , , TriState.True) %></span></li>
    </ul>
</div>

<div class="clear"></div>


<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin="OnBegin",.OnComplete="OnComplete",.OnSuccess = "OnSuccessBreakDownEdit", .OnFailure = "OnFailureBreakDownEdit", .UpdateTargetId = "AJAX_ContainerBreakDownDos"})%>
            

<input type="text" id="editbreakdownhotel" name="editbreakdownhotel" hidden value="0"   >


                                           <div id="toolbar-break">
                                                 <%-- <div class="bs-checkbox filter-check-all" >
                                                      <input id="custo-check" type="checkbox" name="btSelectAll">
                                                      <label class="check" for="custo-check"></label>
                                                  </div>
                                                  <span id="select-allselect-all">All</span>
                                                                                                      
                                                  <button id="new" class="btn btn-warning">Deposit</button>--%>
                                                  <button id="EditBreakdown"  name="GroupDetailBotons" value="Edit_Breakdown" class="btn btn-default"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                 <%-- <button id="CancelBreakdown" class="btn btn-default">Cancel Room</button>--%>
                                                   <a id="CancelBreakdown" class="btn btn-default" >Cancel Room</a>
                                            </div>

                                            <table class="table-no-bordered" id="table-list" data-toggle="table" data-toolbar="#toolbar-break" data-show-export="false" data-pagination="true" data-page-size="20"  data-filter-control="false"  data-search="true"  >
                                              <thead>
                                              <tr>
                                                  <th data-field="Action" data-switchable="false" >Actions</th>
                                                
                                                  <th  data-field="Id&nbsp;Room" >Id Room</th>
                                                  <th  data-field="Guest&nbsp;Name" >Guest Name/LastName</th>
                                                  <th  data-field="Room&nbsp;Type">Room Type</th>
                                                  <th  data-field="Tentative" >Tentative</th>
                                                  <th  data-field="Complementary" >Complementary</th>
                                                  <th  data-field="AD" >AD</th>
                                                  <th  data-field="TN" >TN</th>
                                                  <th  data-field="CH" >CH</th>
                                                  <th  data-field="INF" >INF</th>

                                                  <th data-field="Check&nbsp;In" >Checkin</th>
                                                  <th  data-field="Check&nbsp;Out" >Checkout</th>
                                                  <th  data-field="RN" >RN</th>
                                                  <th  data-field="Status&nbsp;P" >Status P</th>
                                                  <th  data-field="Status&nbsp;R" >Status R</th>
                                                  <th  data-field="Total&nbsp;Deposit" >Total Deposit</th>
                                                  <th data-field="Balance&nbsp;" >Balance</th>
                                                  <th  data-field="Estimated&nbsp;Revenue" >Estimated Revenue</th>
                                              </tr>
                                              </thead>

                                              <tbody>
                                             


                                                  
                                                 
                                                  <% 
                                                           
                                                      Dim i As Integer
                                                      Dim Date1 As Date
                                                      Dim Date2 As Date
   
                                                      For i = 0 To Model.ListGroupBreakdownin.Count - 1
                     
                                                          Response.Write("<tr>")
                                                           
                                                          Response.Write("<td class=""bs-checkbox"">")
                                                          Response.Write("<input type=""radio"" class=""custom-check2"" id=""BreakDownRadio"" name=""BreakDownRadio"" value=""" + Model.ListGroupBreakdownin.Item(i).RoomID.ToString + """  ><label class=""check2""></label>")
                                                          Response.Write("</td>")
                                                                                    
                                                          Response.Write("<td>")
                                                          Response.Write("000" +Model.ListGroupBreakdownin.Item(i).RoomID)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).GuestName)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).RoomCode)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          If Model.ListGroupBreakdownin.Item(i).TentativeRooms = 1 Then
                                                              Response.Write("YES")
                                                          Else
                                                              Response.Write("NO")
                                                          End If
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          If Model.ListGroupBreakdownin.Item(i).ComplementaryRooms = 1 Then
                                                              Response.Write("YES")
                                                          Else
                                                              Response.Write("NO")
                                                          End If
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).Adults)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).Teens)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).Childrens)
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).Infants)
                                                          Response.Write("</td>")
                                                                                    
                                                          Date1 = Model.ListGroupBreakdownin.Item(i).Checkin
                                                                                    
                                                          Response.Write("<td>")
                                                          Response.Write(Date1.ToString("yyyy-MM-dd"))
                                                          Response.Write("</td>")
                    
                                                          
                                                          Date2 = Model.ListGroupBreakdownin.Item(i).Checkout
                                                                                    
                                                          Response.Write("<td>")
                                                          Response.Write(Date2.ToString("yyyy-MM-dd"))
                                                          Response.Write("</td>")
                    
                                                          Response.Write("<td>")
                                                          Response.Write(Model.ListGroupBreakdownin.Item(i).RoomNighs)
                                                          Response.Write("</td>")
                                                          
                                                          

                                                          Select Case Model.ListGroupBreakdownin.Item(i).StatusPayment
                                                              Case 1
                                                                  Response.Write("<td class=""no-confirm"">")
                                                                  Response.Write("NO PAYMENT")
                                                              Case 2
                                                                  Response.Write("<td class=""no-confirm"">")
                                                                  Response.Write("PARTIAL PAY")
                                                              Case 3
                                                                  Response.Write("<td class=""confirmed"">")
                                                                  Response.Write("PAID")
                                                              Case 4
                                                                  Response.Write("<td class=""canceled"">")
                                                                  Response.Write("CANCELLED")
                                                          End Select
                                                          
                                                          Response.Write("</td>")
                                                                    
                                                          
                                                          Select Case Model.ListGroupBreakdownin.Item(i).StatusBooking
                                                              Case 1
                                                                  Response.Write("<td class=""no-confirm"">")
                                                                  Response.Write("NO CONFIRMED")
                                                              Case 2
                                                                  Response.Write("<td class=""confirmed"">")
                                                                  Response.Write("CONFIRMED")
                                                              Case 3
                                                                  Response.Write("<td class=""canceled"">")
                                                                  Response.Write("CANCELLED")
                                                             
                                                          End Select
                                                          
                                                          Response.Write("</td>")
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(FormatNumber(Model.ListGroupBreakdownin.Item(i).Deposit, 2, , , TriState.True))
                                                          Response.Write("</td>")
                                                          
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(FormatNumber(Model.ListGroupBreakdownin.Item(i).Balance, 2, , , TriState.True))
                                                          Response.Write("</td>")
                                                          
                                                          
                                                          Response.Write("<td>")
                                                          Response.Write(FormatNumber(Model.ListGroupBreakdownin.Item(i).Revenue, 2, , , TriState.True))
                                                          Response.Write("</td>")
                                                          
                    
                                                          Response.Write("</tr>")
                                                          
                                                      Next
                
                                                                %>
                                               
                                          
                                                
                                                                                                
                                              </tbody>
                                            </table>
                                            <div class="clear"></div>


<% End Using %> 