<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
<script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<%  If Model.Accion = 8 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $("#eventlist_head").addClass("active");
          $("#eventlist").addClass("active");

          $("#eventfrm_head").removeClass("active");
          $("#eventfrm").removeClass("active");

      });

     </script>

<%  End If%>


<script type="text/javascript">
    $(document).ready(function () {

        $('#cancelevent').click(function (e) {

            if ($('input[name=EventRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("CancelEventID").value = $('input[name=EventRadio]:checked').val()
                $('#eventcancelmodal').modal('show');

            }

        })


       

    });

</script>

    <div id="toolbar-events">
        <%-- <button id="vpay" class="btn btn-default">Add Products & Services</button>--%>
        <% If (ViewData("idseccion2subseccion1delete_permission") IsNot Nothing And ViewData("idseccion2subseccion1delete_permission") > 0) Then
            Response.Write("<a id=""cancelevent"" class=""btn btn-default"">Cancel Payment</a>")
        End If%>
        <!--action btns table here-->
    </div>

     <table class="table-no-bordered" id="table-log" data-toggle="table" data-show-export="false"  data-pagination="true" data-search="true" data-show-columns="false" data-toolbar="#toolbar-events" data-filter-control="false"  data-page-size="20"   >
                                                                        <thead>
                                                                          <tr>
                                                                              <th data-field="Action" data-switchable="false" >Actions</th>
                                                                              <th data-field="Id&nbsp;Event" >Id</th>
                                                                              <th data-field="Event"  >Event</th>
                                                                             <%-- <th data-field="Company&nbsp;&frasl;&nbsp;Wholesale" data-filter-control="select">Company / Wholesale</th>
                                                                              <th data-field="Contact" data-filter-control="select">Contact</th>
                                                                              <th data-field="Contact&nbsp;Type" data-filter-control="select">Contact Type</th>--%>
                                                                              <th data-field="Event&nbsp;Date" >Event Date</th>
                                                                              <th data-field="Event&nbsp;Start&nbsp;Time" >Event Start Time</th>
                                                                              <th data-field="Event&nbsp;End&nbsp;Time" >Event End Time</th>
                                                                              <th data-field="Assigned&nbsp;Area" >Assigned Area</th>
                                                                              <th data-field="Status" >Status</th>
                                                                              <th data-field="No&nbsp;Pax" >No. Pax</th>
                                                                              <th data-field="Seller" >Seller</th>
                                                                              <th data-field="Coordinator" >Coordinator</th>
                                                                              <th data-field="Total&nbsp;Deposits" >Total Deposits</th>
                                                                              <th data-field="Balance" >Balance</th>
                                                                              <th data-field="Revenue" >Revenue</th>
                                                                              <th data-field="Event&nbsp;by&nbsp;User"  >Event by User</th>
                                                                              <th data-field="Date&nbsp;Register&nbsp;Event"  >Date Register Event</th>
                                                                          </tr>
                                                                        </thead>

                                                                        <tbody>


                                                                          <% 
                                                                                Dim i As Integer
                
   
                                                                              For i = 0 To Model.ListGroupEventsin.Count - 1
                     
                                                                                  Response.Write("<tr>")
                                                                     
                                                                                  
                                                                                  Response.Write("<td class=""bs-checkbox"">")
                                                                                  Response.Write("<input type=""radio"" class=""custom-check2"" id=""EventRadio"" name=""EventRadio"" value=""" + Model.ListGroupEventsin.Item(i).EventID.ToString + """  ><label class=""check2""></label>")
                                                                                  Response.Write("</td>")
                                                                    
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write("000" + Model.ListGroupEventsin.Item(i).EventID.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventName.ToString)
                                                                                  Response.Write("</td>")                                                                                 
                                                                                  
                                                                                  
                                                                                  Dim Date1 As Date = Model.ListGroupEventsin.Item(i).EventDate
                                                                                    
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Date1.ToString("yyyy-MM-dd"))
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventStartTime.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventEndTime.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventSalonName.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Select Case Model.ListGroupEventsin.Item(i).EventStatus
                                                                                      Case 1
                                                                                          Response.Write("<td class=""confirmed"">")
                                                                                          Response.Write("ACTIVE")
                                                                                      Case 2
                                                                                          Response.Write("<td class=""canceled"">")
                                                                                          Response.Write("CANCELLED")
                                                                                  
                                                                                  End Select
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventPax.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventSellerName.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventCordinatorName.ToString)
                                                                                  Response.Write("</td>")
                                                                                    
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(FormatNumber(Model.ListGroupEventsin.Item(i).EventDeposits, 2, , , TriState.True))
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(FormatNumber(Model.ListGroupEventsin.Item(i).EventBalance, 2, , , TriState.True))
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(FormatNumber(Model.ListGroupEventsin.Item(i).EventRevenue, 2, , , TriState.True))
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Model.ListGroupEventsin.Item(i).EventUserRegister.ToString)
                                                                                  Response.Write("</td>")
                                                                                  
                                                                                  Dim Date2 As Date = Model.ListGroupEventsin.Item(i).EventDateRegister
                                                                                    
                                                                                  Response.Write("<td>")
                                                                                  Response.Write(Date2.ToString("yyyy-MM-dd hh:mm:ss tt"))
                                                                                  Response.Write("</td>")
                                                                                    
                                                                                  Response.Write("</tr>")
                                                                              Next
                
                                                                             %>
                                                                          
                                                                       
                                                                        </tbody>  
                                                                  </table>
