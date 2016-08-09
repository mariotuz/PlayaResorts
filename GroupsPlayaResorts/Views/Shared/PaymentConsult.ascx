<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<%  If Model.Accion = 7 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $("#paylist_head").addClass("active");
          $("#paylist").addClass("active");

          $("#lpayfrm_head").removeClass("active");
          $("#lpayfrm").removeClass("active");

      });

     </script>

<%  End If%>

<script type="text/javascript">
    $(document).ready(function () {

        $('#CancelPayment').click(function (e) {

            if ($('input[name=PaymentRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("CancelPaymentID").value = $('input[name=PaymentRadio]:checked').val()
                $('#paymentcancelmodal').modal('show');

            }

        })


        $('#ValidatePayment').click(function (e) {

            if ($('input[name=PaymentRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("ValidatePaymentID").value = $('input[name=PaymentRadio]:checked').val()
                $('#paymentvalidatemodal').modal('show')

            }

        })

    });

</script>


                                                            <header class=""><h2 class="md-display-2">Payment List</h2></header>
                                                                  <div id="toolbar-pay">

                                                                      <%
                                                                          If (ViewData("idseccion3subseccion1validate_permission") IsNot Nothing And ViewData("idseccion3subseccion1validate_permission") > 0) Then
                                                                              Response.Write("<a id=""ValidatePayment"" class=""btn btn-default"">Validate Payment</a>")
                                                                          End If
                                                                          
                                                                          If (ViewData("idseccion3subseccion1delete_permission") IsNot Nothing And ViewData("idseccion3subseccion1delete_permission") > 0) Then
                                                                              Response.Write("<a id=""CancelPayment"" class=""btn btn-default"">Cancel Payment</a>")
                                                                          End If
                                                                      %>

                                                                     <!--action btns table here-->
                                                                  </div>
                                                      


<table class="table-no-bordered" id="table-log" data-toggle="table" data-show-export="false"  data-pagination="true" data-search="true" data-show-columns="false" data-toolbar="#toolbar-pay" data-filter-control="false" data-page-list="[5, 10, 25, 50, 100, All]" data-page-size="25">
                                                                        <thead>
                                                                          <tr>
                                                                              <th data-field="Action" data-switchable="false" ></th>
                                                                              <th data-field="Id&nbsp;Pay" >Id</th>
                                                                              <th data-field="Applied&nbsp;to" >Applied to</th>
                                                                              <th data-field="Type&nbsp;Pay"  >Type Pay</th>
                                                                              <th data-field="Currency" >Currency</th>
                                                                              <th data-field="Description" >Description</th>
                                                                              <th data-field="Payment" >Payment</th>
                                                                              <th data-field="Status&nbsp;Pay" >Status Pay</th>
                                                                              <th data-field="Validated" >Validated</th>
                                                                              <th data-field="Date&nbsp;Validation" >Date Validation</th>
                                                                              <th data-field="Validated&nbsp;by&nbsp;User" >Validated by User</th>
                                                                              <th data-field="Folio&nbsp;&frasl;&nbsp;Code&nbsp;PMS" >Folio/Code PMS</th>
                                                                              <th data-field="Payment&nbsp;by&nbsp;User" >Payment by User</th>
                                                                              <th data-field="Date&nbsp;Register&nbsp;Payment" >Date Register Payment</th>
                                                                          </tr>
                                                                        </thead>

                                                                        <tbody>
                                                                          

                                                                        <% 
                                                                                Dim i As Integer
                
   
                                                                            For i = 0 To Model.ListGroupPaymentsin.Count - 1
                     
                                                                                Response.Write("<tr>")
                                                                     
                                                                                Response.Write("<td class=""bs-checkbox"">")
                                                                                Response.Write("<input type=""radio"" class=""custom-check2"" id=""PaymentRadio"" name=""PaymentRadio"" value=""" + Model.ListGroupPaymentsin.Item(i).PaymentID.ToString + """  ><label class=""check2""></label>")
                                                                                Response.Write("</td>")
                                                                                
                                                                                Response.Write("<td>")
                                                                                Response.Write("000" + Model.ListGroupPaymentsin.Item(i).PaymentID.ToString)
                                                                                Response.Write("</td>")
                                                                                    
                                                                                Response.Write("<td>")
                                                                                Select Case Model.ListGroupPaymentsin.Item(i).AppliedPayment
                                                                                    Case 1
                                                                                        Response.Write("ALL GROUP")
                                                                                    Case 2
                                                                                        Response.Write("ROOM ID: 000" + Model.ListGroupPaymentsin.Item(i).RoomID.ToString)
                                                                                    Case 3
                                                                                        Response.Write("EVENT ID: 000" + Model.ListGroupPaymentsin.Item(i).EventID.ToString)
                                                                                            
                                                                                End Select
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                                Response.Write("<td>")
                                                                                Select Case Model.ListGroupPaymentsin.Item(i).TypePayment
                                                                                    Case 1
                                                                                        Response.Write("TRANSFER")
                                                                                    Case 2
                                                                                        Response.Write("CREDIT CARD")
                                                                                    Case 3
                                                                                        Response.Write("DEPOSIT")
                                                                                    Case 4
                                                                                        Response.Write("ON ARRIVAL")
                                                                                            
                                                                                End Select
                                                                                Response.Write("</td>")
                     
                                                                                Response.Write("<td>")
                                                                                Select Case Model.ListGroupPaymentsin.Item(i).TypeCurrencyPayment
                                                                                    Case 1
                                                                                        Response.Write("USD")
                                                                                    Case 2
                                                                                        Response.Write("MEX")
                                                                              
                                                                                            
                                                                                End Select
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                   
                                                                                Response.Write("<td>")
                                                                                Response.Write(Model.ListGroupPaymentsin.Item(i).DescriptionPayment)
                                                                                Response.Write("</td>")
                                                                                    
                                                                                Response.Write("<td>")
                                                                                Response.Write(FormatNumber(Model.ListGroupPaymentsin.Item(i).AmountPayment, 2, , , TriState.True))
                                                                                Response.Write("</td>")
                                                                                    
                                                                        
                                                                                Select Case Model.ListGroupPaymentsin.Item(i).StatusPayment
                                                                                    Case 1
                                                                                        Response.Write("<td class=""confirmed"">")
                                                                                        Response.Write("ACTIVE")
                                                                                    Case 2
                                                                                        Response.Write("<td class=""canceled"">")
                                                                                        Response.Write("CANCELLED")
                                                                                  
                                                                                End Select
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                                Select Case Model.ListGroupPaymentsin.Item(i).ValidatedPayment
                                                                                    Case 0
                                                                                        Response.Write("<td class=""canceled"">")
                                                                                        Response.Write("NO")
                                                                                    Case 1
                                                                                        Response.Write("<td class=""confirmed"">")
                                                                                        Response.Write("YES")
                                                                              
                                                                                            
                                                                                End Select
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                                If Model.ListGroupPaymentsin.Item(i).DateValidatedPayment="" Then
                                                                                    Response.Write("<td>")
                                                                                    Response.Write("")
                                                                                    Response.Write("</td>")
                                                                                Else
                                                                                    Dim Date1 As Date = Model.ListGroupPaymentsin.Item(i).DateValidatedPayment
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Date1.ToString("yyyy-MM-dd hh:mm:ss tt"))
                                                                                    Response.Write("</td>")
                                                                                End If
                                                                                
                                                                                
                                                                                
                                                                                Response.Write("<td>")
                                                                                Response.Write(Model.ListGroupPaymentsin.Item(i).UserValidatedPayment)
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                                Response.Write("<td>")
                                                                                Response.Write(Model.ListGroupPaymentsin.Item(i).FolioPayment)
                                                                                Response.Write("</td>")
                                                                                
                                                                                Response.Write("<td>")
                                                                                Response.Write(Model.ListGroupPaymentsin.Item(i).UserResgisterPayment)
                                                                                Response.Write("</td>")
                                                                                
                                                                                
                                                                                Dim Date2 As Date = Model.ListGroupPaymentsin.Item(i).DateRegisterPayment
                                                                                    
                                                                                Response.Write("<td>")
                                                                                Response.Write(Date2.ToString("yyyy-MM-dd hh:mm:ss tt"))
                                                                                Response.Write("</td>")
                   
                                                                                    
                                                                                Response.Write("</tr>")
                                                                            Next
                
                                                                             %>
                                                                     
                                                                        
                                                                          
                                                                        </tbody>  
                                                                  </table>