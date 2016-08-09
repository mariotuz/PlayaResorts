<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

                                         
                                            <!--/////////////////////////////////////////////////////////// launch form ////////////////////////////////////////////////////////////////////////////-->

                                            <div id="col-right" class="col-xs-12 col-sm-12 col-md-12 nopadding"><!-- Start col Right-->

                                              <div role="tabpanel">
                                                      <!-- Nav tabs -->
                                                      <br>
                                                      <br>
                                                      <ul class="nav nav-tabs dual-select" role="tablist" >
                                                        <li role="presentation" id="form-grouphead" class=" col-xs-4 col-md-4 active"><a href="#form-group" aria-controls="form-group" role="tab" data-toggle="tab">Group Information</a></li>
                                                        <li role="presentation" id="rateshead" class=" col-xs-4 col-md-4 disabledTab"><a href="#rates" aria-controls="rates" role="tab" data-toggle="tab">Group Rates</a></li>

                                                        <li role="presentation" id="payshead" class=" col-xs-4 col-md-4 disabledTab"><a href="#pays" aria-controls="pays" role="tab" data-toggle="tab">Payments</a></li>
                                                      </ul>
                                                      <!-- Nav tabs -->

                                                      <!-- Tab panes -->
                                                      <div class="tab-content"><br>

                                                            <div rol="tabpanel" class="tab-pane active" id="form-group">
                                                                <div>
                                                                  <h2>Group Information </h2><span class="instrucions">&nbsp;&nbsp;To check the rates need to carry at least the fields marked with (*).</span>
                                                                  <!--btn save / consult-->
                                                                  <div class="right" style="margin-top: 15px;">
                                                                

                                                                      
                                                                      <button value="ConsultRateForm" name="GroupDetailBotons" id="donepay" class="btn btn-gray <%--disabled--%>">Consult Rate</button>
                                                                  </div>
                                                                </div>
                                                                <div id="col-left" class="col-xs-12 col-sm-12 col-md-12 minheight nopadding"> <!-- Start form-->
                                                                      <!-- frist row-->
                                                                  <%--    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Grupo ID </small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text"  class="form-control input-custom corners-inputs" placeholder="" >
                                                                       
                                                                        </div>
                                                                      </div>--%>

                                                                     <%--  <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>

                                                                      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Group Name</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text"  id="GroupName" class="form-control input-custom corners-inputs" placeholder="" >
                                                                        </div>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Market <%--<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>--%></small></span>
                                                                           <select class="selectpicker" id="MarketSelect" data-width="100%">
                                                                              <option value="1">Canada</option>
                                                                              <option value="2">USA</option>
                                                                              <option value="3">Mexico</option>
                                                                            </select>
                                                                      </div>

                                                                      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Number of Pax*</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="NumberPax" class="form-control input-custom corners-inputs" placeholder="" >
                                                                        </div>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Group Type </small></span>
                                                                            <select class="selectpicker" id="GroupTypeSelect" data-width="100%">
                                                                              <option value="1">Wedding</option>
                                                                              <option value="2">Conference</option>
                                                                              <option value="3">Congress</option>
                                                                              <option value="4">Religious</option>
 
                                                                             
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Destination *</small></span>
                                                                            <select class="selectpicker" id="DestinationSelect" data-width="100%">
                                                                              <option value="1">Cancun</option>
                                                                              <option value="2">Playa del Carmen</option>
                                                                              <option value="3">Puerto Vallarta</option>
                                                                              <option value="4">Los Cabos</option>
                                                                              <option value="5">Jamaica</option>
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                           <span><small>Hotel Name *</small></span>
                                                                            <select class="selectpicker" id="HotelSelect" name="HotelSelect" data-width="100%">
                                                                              <option value="GCR">Gran Caribe Real</option>
                                                                              <option value="GPR">Gran Porto Playa del Carmen</option>
                                                                              <option value="RPR">The Royal Playa del Carmen</option>
                                                                              <option value="TRC">Hyatt Zilara Cancun</option>
                                                                              <option value="ZLJ" >Hyatt Zilara Rose Hall Jamaica</option>
                                                                              <option value="ZVC">Hyatt Ziva Cancun</option>
                                                                              <option value="ZVJ">Hyatt Ziva Rose Hall Jamaica</option>
                                                                              <option value="ZVL">Hyatt Ziva Los Cabos</option>
                                                                              <option value="ZVP">Hyatt Ziva Puerto Vallarta</option>
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Allotment</small></span>
                                                                            <select class="selectpicker" id="AllotmentSelect" data-width="100%">
                                                                              <option>No</option>
                                                                             
                                                                            </select>
                                                                      </div>

                                                                      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Complementary Room</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="ComplementaryRoom" class="form-control input-custom corners-inputs" placeholder="" >
                                                                        </div>
                                                                      </div>

                                                                      <div class="clear"></div><br>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Agency Type </small></span>
                                                                           <select class="selectpicker" id="AgencyTypeSelect" data-width="100%">
                                                                              <option value="1">Tour Operator</option>
                                                                              <option value="2">MICE</option>
                                                                              <option value="3">Directo</option>
                                                                             
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Company *</small></span>
                                                                           <select class="selectpicker" id="CompanySelect" data-width="100%">
                                                                              <option value="1">Agencia Mundial</option>
                                                                              
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Wholesale *</small></span>
                                                                        
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                                    <input type="text" id="WhosaleDetail" name="WhosaleDetail"  class="form-control input-custom corners-inputs" placeholder="" >
                                                                            </div>

                                                                            <%--<select class="selectpicker" id="WhosaleDetail" name="WhosaleDetail" data-width="100%" data-live-search="true">                                                                                      
                                                                            <%
                                                                                Dim i As Integer
                
                                                                                For i = 0 To Model.ListWhosalesin.Count - 1
                                                                             %>
                                                                              <option <% If Model.ListWhosalesin.Item(i).Selected Then
                                                                                      Response.Write("selected='selected'")
                                                                                  End If%> value="<%:Model.ListWhosalesin.Item(i).Value%>"><%:Model.ListWhosalesin.Item(i).Text %></option>             
                                                                            <%        
                                                                                Next
                                                                            %>
                                                                            </select>    --%>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Contact </small></span>
                                                                          <select class="selectpicker" id="ContactSelect" data-width="100%">
                                                                            <option>Rocio Rodriguez</option>
                                                                            <option>Ketchup</option>
                                                                            <option>Relish</option>
                                                                          </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Group Cordinator </small></span>
                                                                          <select class="selectpicker" id="GroupCordinatorSelect" data-width="100%">
                                                                            <option value="1">Patricia Romero</option>
                                                                            
                                                                          </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Onsite Cordinator </small></span>
                                                                            <select class="selectpicker" id="OnsiteCordinatorSelect" data-width="100%">
                                                                              <option value="1">Edgar Zaldivar</option>
                                                                              
                                                                            </select>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Channel </small></span>
                                                                           <select class="selectpicker" id="ChannelSelect" data-width="100%">
                                                                              <option value="1">Call Center</option>
                                                                              <option value="2">Onsite</option>
                                                                             
                                                                            </select>
                                                                      </div>

                                                               

                                                              

                                                                      <div class="clear"></div><br>

                                                                        <!-- date piker 1-->
                                                                        <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                          <span class="txt-filter">Arrival Date *</span>
                                                                            <div class='date-imput'>
                                                                                <div class="form-group">
                                                                                    <div class='input-group date' id='datetimepicker6'>
                                                                                        <input id="datetimepicker6text" name="datetimepicker6text" type='text' class="form-control" data-format="yyyy-MM-dd" />
                                                                                          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span class="txt-filter">Departure Date *</span>
                                                                              <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                    <div class='input-group date' id='datetimepicker7'>
                                                                                        <input id="datetimepicker7text" name="datetimepicker7text" type='text' class="form-control" data-format="yyyy-MM-dd" />
                                                                                          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                        </span>
                                                                                    </div>
                                                                                  </div>
                                                                              </div>
                                                                        </div>
                                                                    
                                                                          <!--date piker script -->
                                                                          <script type="text/javascript">
                                                                              $(function () {
                                                                                  $('#datetimepicker6').datetimepicker({ format: 'DD/MM/YYYY' });
                                                                                  $('#datetimepicker7').datetimepicker({ format: 'DD/MM/YYYY' });
                                                                                  $("#datetimepicker6").on("dp.change", function (e) {
                                                                                      $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                                                                                  });
                                                                                  $("#datetimepicker7").on("dp.change", function (e) {
                                                                                      $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                                                                                  });
                                                                              });
                                                                          </script><!--date piker script -->

                                                                          

                                                                          <!-- date piker 2-->
                                                                          <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                              <span class="txt-filter">Tentative Arrival Date</span>
                                                                              <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepicker9'>
                                                                                          <input type='text' class="form-control" data-format="yyyy-MM-dd" />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>

                                                                          <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                              <span class="txt-filter">Tenative Departure Date</span>
                                                                                <div class='date-imput'>
                                                                                    <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepicker8'>
                                                                                          <input type='text' class="form-control" data-format="yyyy-MM-dd"  />
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                    </div>
                                                                                </div>
                                                                          </div>
                                                                    
                                                                          <!--date piker script -->
                                                                          <script type="text/javascript">
                                                                              $(function () {
                                                                                  $('#datetimepicker9').datetimepicker({ format: 'DD/MM/YYYY' });
                                                                                  $('#datetimepicker8').datetimepicker({ format: 'DD/MM/YYYY' });
                                                                                  $("#datetimepicker9").on("dp.change", function (e) {
                                                                                      $('#datetimepicker8').data("DateTimePicker").minDate(e.date);
                                                                                  });
                                                                                  $("#datetimepicker8").on("dp.change", function (e) {
                                                                                      $('#datetimepicker9').data("DateTimePicker").maxDate(e.date);
                                                                                  });
                                                                              });
                                                                          </script><!--date piker script -->
                                                                      
                                                                      <div class="clear"></div>
                                                                </div><!-- End form-->
                                                            </div>

                                                            <div role="tabpanel" class="tab-pane" id="rates"><!-- Start promotions tabs-->
                                                              <div id"rate-special">
                                                                          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span><small>Percentage Discount Rate</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                              <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                                            </div>
                                                                          </div>

                                                                          <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                              <span><small>Rate Type <span class="instrucions">(Choose one rate to recalculate)</span></small></span>
                                                                               <select class="selectpicker" data-width="100%">
                                                                                  <option>Rate 1</option>
                                                                                  
                                                                                 
                                                                                </select>
                                                                          </div>

                                                                          <button id="ConsultRate" value="Consult Rate" name="GroupDetailBotons" class="btn btn-gray" style="margin-top: 17px;">Consult Rate</button>
                                                                          
                                                                            
                                                                            

                                                                          <div class="right">
                                                                              <button id="Button2" class="btn btn-success" style="margin-top: 17px;">Save Group</button>
                                                                              <button id="Button3" class="btn btn-gray" style="margin-top: 17px;">Calculate Revenue</button>
                                                                          </div>
                                                                    </div>
                                                                    <div class="clear"></div><br>
                                                                    <!-- Nav tabs  promos-->
                                                                    
                                                               <div id="Grid_Container">   

                                                                 <% Html.RenderPartial("RatesConsult", Model)%>
                                                                    
                                                               </div>



                                                            </div><!-- end promotions tabs-->

                                                            <div role="tabpanel" class="tab-pane" id="pays"><!-- Start pay scheme tabs-->
                                                              
                                                                  <div class="col-xs-12 col-md-12 col-lg-12 nopadding">
                                                                      <span class="no-pays">Select number of Payments </span>
                                                                      <select class="selectpicker" >
                                                                          <option>1</option>
                                                                          <option>2</option>
                                                                          <option>3</option>
                                                                          <option>4</option>
                                                                          <option>5</option>
                                                                      </select>

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
                                                                                <input type="text" class="form-control input-custom corners-inputs" placeholder="Fecha">
                                                                                <div class="clear"></div>
                                                                              </div>
                                                                            </div>

                                                                            <div class="col-xs-12 col-md-4 col-lg-3">
                                                                              <div>
                                                                                <div class="">Amount</div><div class="clear"></div>
                                                                                <input type="text" class="form-control input-custom corners-inputs" placeholder="Monto" >
                                                                              </div>
                                                                              <div class="clear"></div>
                                                                            </div>
                                                                      </div>
                                                                      <div id="total-amount" class="col-xs-12 col-md-9 col-lg-7 ">
                                                                        <div class="col-xs-2 col-md-2 col-lg-2 "></div>
                                                                        <div class="col-xs-4 col-md-5 col-lg-5 "></div>
                                                                        <p class="amount-total col-xs-12 col-md-4 col-lg-4"> Total Amount <br> 3,456</p>
                                                                      </div>


                                                                      
                                                                      <div class="clear"></div>  
                                                                  </div>
                                                                 
                                                                  
                                                                  <div class="clear"></div>  
                                                            </div><!-- end pay scheme tabs-->                                                      
                                                      </div><!--end tab pane-->
                                              </div>
                                            </div><!-- End col Rigth-->