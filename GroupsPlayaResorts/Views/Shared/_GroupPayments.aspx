<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>


<script type="text/javascript">

    $(document).ready(function () {


        $("#paymentappliedto").change(function () {


            if ($("#paymentappliedto").val() == 1) {

                $("#paymentroom").attr('disabled', 'disabled');
                $("#paymentroom").val("");
            }
            else {
                $("#paymentroom").removeAttr('disabled');
            }
           
        });


    });

</script>



                                        <div role="tabpanel"><!-- Start Contentainer tabs-->
                                                      <!-- Start Nav tabs -->

                                                        
                                            <input type="text" id="grupoidpayments" name="grupoidpayments" hidden value="0"   >
                                             <input type="text" id="CancelPaymentID" name="CancelPaymentID" hidden value="0"   >
                                            <input type="text" id="ValidatePaymentID" name="ValidatePaymentID" hidden value="0"   >

                                                      <br>
                                                      <br>
                                                      <ul class="nav nav-tabs dual-select" role="tablist" >
                                                        <li role="presentation" id="paylist_head" class="col-xs-4 col-md-4 active"><a href="#paylist" aria-controls="paylist" role="tab" data-toggle="tab">Payment List</a></li>
                                                        <li role="presentation" id="lpayfrm_head" class="col-xs-4 col-md-4"><a href="#lpayfrm" aria-controls="lpayfrm" role="tab" data-toggle="tab">Add Payment</a></li>
                                                        <li role="presentation" id="payshead" class="col-xs-4 col-md-4"><a href="#pays" aria-controls="pays" role="tab" data-toggle="tab">Payments Scheme</a></li>
                                                      </ul>
                                                      <!-- end Nav tabs -->

                                                      <!-- Start Tab panes -->
                                                      <div class="tab-content"><br>

                                                        <div role="tabpanel" class="tab-pane active" id="paylist"><!-- Start documents list tabs-->


                                                          <div id="AJAX_ContainerPayments"> 
    
                                                                 <% Html.RenderPartial("PaymentConsult", Model)%>
             
                                                           </div>

                                                            </div><!-- end documents list tabs-->

                                                            <div role="tabpanel" class="tab-pane" id="lpayfrm"><!-- Start generet document tabs-->
                                                              <header class=""><h2 class="md-display-2">Add New Payment</h2><p></p></header>


                                                                <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                       <span><small>Applied to</small></span>
                                                                       <select class="selectpicker" id="paymentappliedto" name="paymentappliedto" data-width="100%">

                                                                              <option value="1">All Group</option>
                                                                              <option value="2">Specific Room </option>
                                                                              <option value="3">Event </option>
                                                                         
                                                                        </select>
                                                                  </div>

                                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Room Id / Event Id</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" id="paymentroom" name="paymentroom" placeholder=""  disabled>
                                                                    </div>
                                                                  </div>


                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Type of Payment</small></span>
                                                                       <select class="selectpicker" id="typepayment" name="typepayment" data-width="100%">
                                                                          <option value="1">Transfer</option>
                                                                          <option value="2">Credit Card</option>
                                                                          <option value="3">Deposit</option>
                                                                          <option value="4">On Arrival</option>
                                                                        </select>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Type Currency</small></span>
                                                                       <select class="selectpicker"  id="paymentcurrency" name="paymentcurrency"   data-width="100%">
                                                                          <option value="1">USD</option>
                                                                          <option value="2">MEX</option>
                                                                          
                                                                        </select>
                                                                  </div>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Quantity</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" id="paymentquantity" name="paymentquantity" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Folio / Code PMS</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" id="paymentsfolio" name="paymentsfolio" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Distribution Group</small></span>
                                                                       <select class="selectpicker" id="paymentgroupdistribution" name="paymentgroupdistribution" data-width="100%">
                                                                          <option value="0">Distribution 1</option>
                                                                          
                                                                        </select>
                                                                  </div>


                                                                   
                                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" >
                                                                    <span><small>Payment Description</small></span><br>
                                                                    <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="paymentnotes" name="paymentnotes" rows="3" cols="50" placeholder="Your note..."></textarea>
                                                                  </div>

                                                                  <div class="clear"></div>

                                                                  <div class="done col-xs-12 col-sm-6 col-md-6 col-lg-3" style="margin-top: 20px;">
                                                                    <button id="AddPayment"  value="Add_Payment" name="GroupDetailBotons"  class="btn btn-success">Add Payment</button>
                                                                  </div>



                                                            </div><!-- end generet document tabs-->


                                                           <div role="tabpanel" class="tab-pane" id="pays"><!-- Start pay scheme tabs-->
                                                              
                                                                  <div class="col-xs-12 col-md-12 col-lg-12 nopadding">


                                                                      <div class="right" style="margin-top: 15px;">
                                                                

                                                                      <button id="SaveScheme"  value="Save_Scheme" name="GroupDetailBotons" class="btn btn-success" style="margin-top: 17px;">Save Payment Scheme</button>

                                                                     
                                                                  </div>

                                                                     <%-- <span class="no-pays" hidden>Select number of Payments </span>
                                                                      <select class="selectpicker"  >
                                                                          <option>1</option>
                                                                          <option>2</option>
                                                                          <option>3</option>
                                                                          <option>4</option>
                                                                          <option>5</option>
                                                                      </select>--%>

                                                                      <br><br>

                                                                      <div class="no-pays-group col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                        
                                                                        
                                                                            <div class="col-xs-12 col-md-1 col-lg-1 nopadding">
                                                                              <div>
                                                                                <div class="">Number of payment</div><div class="clear"></div>
                                                                                <span class="orange col-xs-12 col-md-12 col-lg-12">1</span>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Date</div><div class="clear"></div>

                                                                                  <%  Dim SchemePaymentsTotal As Double=0 %>

                                                                                <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepickerScheme1'>
                                                                                          <input type='text' id="datetimepickerScheme1text" name="datetimepickerScheme1text" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 0 Then
                                                                                                  Response.Write(Model.ListaSchemePaymentsin.Item(0).Text)
                                                                                                  
                                                                                              End If
                                                                                              %>" class="form-control" data-format="YYYY-MM-DD" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>

                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" placeholder="0" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 0 Then
                                                                                        
                                                                                        Response.Write(FormatNumber(Model.ListaSchemePaymentsin.Item(0).Value, 2, , , TriState.True))
                                                                                        SchemePaymentsTotal = SchemePaymentsTotal + Model.ListaSchemePaymentsin.Item(0).Value
                                                                                    End If
                                                                                              %>" name="SchemeAmount1" >
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>

                                                                      <br> <br>

                                                                     <div class="no-pays-group col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                        
                                                                        
                                                                            <div class="col-xs-12 col-md-1 col-lg-1 nopadding">
                                                                              <div>
                                                                                <div class="">Number of payment</div><div class="clear"></div>
                                                                                <span class="orange col-xs-12 col-md-12 col-lg-12">2</span>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Date</div><div class="clear"></div>


                                                                                 <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepickerScheme2'>
                                                                                          <input type='text' id="datetimepickerScheme2text" name="datetimepickerScheme2text"  value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 1 Then
                                                                                                  Response.Write(Model.ListaSchemePaymentsin.Item(1).Text)
                                                                                              End If
                                                                                              %>" class="form-control" data-format="YYYY-MM-DD" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>


                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 1 Then
                                                                                        Response.Write(FormatNumber(Model.ListaSchemePaymentsin.Item(1).Value, 2, , , TriState.True))
                                                                                        SchemePaymentsTotal = SchemePaymentsTotal + Model.ListaSchemePaymentsin.Item(1).Value
                                                                                    End If
                                                                                              %>" placeholder="0" name="SchemeAmount2">
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>


                                                                         <br> <br>

                                                                     <div class="no-pays-group col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                        
                                                                        
                                                                            <div class="col-xs-12 col-md-1 col-lg-1 nopadding">
                                                                              <div>
                                                                                <div class="">Number of payment</div><div class="clear"></div>
                                                                                <span class="orange col-xs-12 col-md-12 col-lg-12">3</span>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Date</div><div class="clear"></div>


                                                                                 <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepickerScheme3'>
                                                                                          <input type='text' id="datetimepickerScheme3text" name="datetimepickerScheme3text"  value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 2 Then
                                                                                                  Response.Write(Model.ListaSchemePaymentsin.Item(2).Text)
                                                                                              End If
                                                                                              %>" class="form-control" data-format="YYYY-MM-DD" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>


                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 2 Then
                                                                                        Response.Write(FormatNumber(Model.ListaSchemePaymentsin.Item(2).Value, 2, , , TriState.True))
                                                                                        SchemePaymentsTotal = SchemePaymentsTotal + Model.ListaSchemePaymentsin.Item(2).Value
                                                                                    End If
                                                                                              %>" placeholder="0" name="SchemeAmount3" >
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>


                                                                         <br> <br>

                                                                     <div class="no-pays-group col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                        
                                                                        
                                                                            <div class="col-xs-12 col-md-1 col-lg-1 nopadding">
                                                                              <div>
                                                                                <div class="">Number of payment</div><div class="clear"></div>
                                                                                <span class="orange col-xs-12 col-md-12 col-lg-12">4</span>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Date</div><div class="clear"></div>
                                                                                <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepickerScheme4'>
                                                                                          <input type='text' id="datetimepickerScheme4text" name="datetimepickerScheme4text"  value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 3 Then
                                                                                                  Response.Write(Model.ListaSchemePaymentsin.Item(3).Text)
                                                                                              End If
                                                                                              %>" class="form-control" data-format="YYYY-MM-DD" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 3 Then
                                                                                        Response.Write(FormatNumber(Model.ListaSchemePaymentsin.Item(3).Value, 2, , , TriState.True))
                                                                                        SchemePaymentsTotal = SchemePaymentsTotal + Model.ListaSchemePaymentsin.Item(3).Value
                                                                                    End If
                                                                                              %>" placeholder="0" name="SchemeAmount4" >
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>


                                                                         <br> <br>

                                                                     <div class="no-pays-group col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                        
                                                                        
                                                                            <div class="col-xs-12 col-md-1 col-lg-1 nopadding">
                                                                              <div>
                                                                                <div class="">Number of payment</div><div class="clear"></div>
                                                                                <span class="orange col-xs-12 col-md-12 col-lg-12">5</span>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Date</div><div class="clear"></div>
                                                                                 <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepickerScheme5'>
                                                                                          <input type='text' id="datetimepickerScheme5text" name="datetimepickerScheme5text" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 4 Then
                                                                                                  Response.Write(Model.ListaSchemePaymentsin.Item(4).Text)
                                                                                              End If
                                                                                              %>"  class="form-control" data-format="YYYY-MM-DD" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" value="<%  If Model.ListaSchemePaymentsin.Count - 1 >= 4 Then
                                                                                        Response.Write(FormatNumber(Model.ListaSchemePaymentsin.Item(4).Value, 2, , , TriState.True))
                                                                                        SchemePaymentsTotal = SchemePaymentsTotal + Model.ListaSchemePaymentsin.Item(4).Value
                                                                                    End If
                                                                                              %>" placeholder="0" name="SchemeAmount5" >
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>

                                                                      <div id="total-amount" class="col-xs-12 col-md-9 col-lg-7 ">
                                                                        <div class="col-xs-2 col-md-2 col-lg-2 "></div>
                                                                        <div class="col-xs-4 col-md-5 col-lg-5 "></div>
                                                                        <p class="amount-total col-xs-12 col-md-4 col-lg-4"> Total Amount <br>$ <%:FormatNumber(SchemePaymentsTotal, 2, , , TriState.True)%></p>
                                                                      </div>


                                                                      
                                                                      <div class="clear"></div>  
                                                                  </div>
                                                                 
                                                                  
                                                                  <div class="clear"></div>  
                                                            </div><!-- end pay scheme tabs-->       
                                                          





                                                      </div><!--end tab pane-->
                                              </div><!-- end Contentainer tabs-->


<div class="modal fade" id="paymentvalidatemodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to validate this payment? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="cancelspecialnotesbreak" name="cancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  
                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="ValidatePayment" value="Validate_Payment" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


<div class="modal fade" id="paymentcancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="Button1" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to cancel the payment? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">



                                                     <span><small> Cancel Type </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <select class="selectpicker" id="Select1" name="canceltypebreak" data-width="100%">
                                                                              <option  value="0"> </option>
                                                                              <option  value="1">Expensive Rates</option>
                                                                             
                                                                            </select>
                                                    </div>
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="Textarea1" name="cancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button id="Button2" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeletePayment" value="Delete_Payment" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->