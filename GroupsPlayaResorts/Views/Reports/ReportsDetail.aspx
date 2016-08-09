<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsList)" %>


<asp:Content ID="EventsListTitle" ContentPlaceHolderID="TitleContent" runat="server"> Reports </asp:Content>

<asp:Content ID="EventsListContent" ContentPlaceHolderID="MainContent" runat="server">

               <script type="text/javascript">


                   $(document).ready(function () {


                       $('#downloadDocument').on("submit", function (e) {
                           $('.load-container').fadeIn('slow');

                           setTimeout(function () {
                               $('.load-container').fadeOut('slow');
                           }, 3000);
                       });

                       $('.load-container').fadeOut('slow');


                   });

               </script>


                 <!-- Start Page content -->
            <div id="page-content-wrapper">

                <!-- Keep all page content within the page-content inset div! -->
                <div class="page-content inset"><!--Start page content wrapper-->

                                  <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                          
                          <!-- Start tab Supplier Section-->
                          <div class="bhoechie-tab-content active">

                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new supplier list-->
                                      <li role="presentation" id="newsupp_head" class="active"><a href="#newsupp" aria-controls="newsupp" role="tab" data-toggle="tab">New Report</a></li>
                                      <li role="presentation" id="suppList_head" ><a href="#suppList" aria-controls="suppList" role="tab" data-toggle="tab"> </a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Supplier list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newsupp"><!--Star tab form supplier-->

                                    

                                       <% Using Html.BeginForm("ReportsDetail", "Reports", FormMethod.Post, New With {.id = "downloadDocument", .enctype = "multipart/form-data"})%>

                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                   
                                                   
                                               
                                                    <div class="clear"></div>
                                                </div> 

                                                <header class="encabezado"><h2 class="md-display-2">New Report.</h2><p></p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Type of Report *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                   
                                                              <select class="selectpicker" id="selectypedocument" name="selectypedocument" data-width="100%">
                                                                          <option value="1">GCR Report Monthly</option>
                                                                          <option value="2">GCR Report Overall</option>
                                                                       <%--   <option value="3">Overall I</option>
                                                                          <option value="4">Overall II</option>
                                                                          <option value="5">Variance analisis</option>
                                                                          <option value="6">Report Vicky</option>--%>
                                                                          
                                                              </select>

                                                        </div>
                                                      </div>

                                                    

                                                     <%-- <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Dates *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <select class="selectpicker"  id="datefilter" name="datefilter" data-width="100%">
                                                                              <option  value="1">Checkin</option>
                                                                              <option  value="2">Checkout</option>
                                                                              <option  value="3">Quote Date</option>
                                                                              <option  value="4">Between Checkin and Checkout</option>
                                                                            
                                                         </select>
                                                        </div>
                                                      </div>--%>

                                                 

                                                   
                                                      <!-- date piker 1-->
                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span class="txt-filter"><small>Initial Date *</small></span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate1'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate1text" name="datetimepickerdate1text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                      <span class="txt-filter"><small>End Date *</small></span>
                                                        <div class='date-imput'>
                                                            <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate2'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate2text" name="datetimepickerdate2text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                            </div>
                                                        </div>
                                                  </div>
                                              
                                                    <!--date piker script -->
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#datetimepickerdate1').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $('#datetimepickerdate2').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $("#datetimepickerdate1").on("dp.change", function (e) {
                                                                $('#datetimepickerdate2').data("DateTimePicker").minDate(e.date);
                                                            });
                                                            $("#datetimepickerdate2").on("dp.change", function (e) {
                                                                //$('#datetimepickerdate1').data("DateTimePicker").maxDate(e.date);
                                                            });
                                                        });
                                                    </script><!--date piker script -->


                                                      <div class="clear"></div>


                                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span><small>Book Status</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12" role="group">
                                                    <%--  <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData33%>" id="breakcomplementaryrooms" name="breakcomplementaryrooms" placeholder="" >--%>

                                                        <select class="selectpicker" multiple id="Select6" name="BookStatusFilter" data-width="100%">

                              <option  selected value="0"  >ALL</option>                         
                              <option  value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_yellow.png")%>" >Prospect</option>
                              <option  value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_noconfirm.png")%>">Tentative</option>
                              <option  value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_cancel.png")%>">Cancelled</option>
                              <option  value="7" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_cancel.png")%>">Expired</option>
                              <option  value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_turned_down.png")%>">Turned Down</option>
                              <option  value="5" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_lost.png")%>">Lost</option>
                              <option  value="6" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_pay.png")%>">Definitive</option>
                                              
                                                        
                                                        </select>
                                                    </div>
                                                  </div>

                                

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span><small>Pay Status</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                    <%--  <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData33%>" id="breakcomplementaryrooms" name="breakcomplementaryrooms" placeholder="" >--%>

                                                        <select class="selectpicker" multiple id="Select7" name="PayStatusFilter" data-width="100%">
                              <option  value="0" selected >ALL</option> 
                              <option  value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_yellow.png")%>">Unpaid</option>
                              <option  value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_noconfirm.png")%>">Partial</option>
                              <option  value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_cancel.png")%>">Cancelled</option>
                              <option  value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_transferred.png")%>">Over Paid</option>
                              <option  value="5" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_conciliate.png")%>">Conciliate</option>
                              <option  value="6" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_pay.png")%>">Paid</option>
                                                
                                                                             
                                                        </select>
                                                    </div>
                                                  </div>

                                           

                                                   <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span><small>Hotel Status</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                    <%--  <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData33%>" id="breakcomplementaryrooms" name="breakcomplementaryrooms" placeholder="" >--%>

                                                        <select class="selectpicker" multiple id="Select8" name="HotelStatusFilter" data-width="100%">
                                                                    <option  value="0"  selected>ALL</option> 
                                                                    <option  value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_yellow.png")%>" >No Confirm</option>
                                                                    <option  value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_noconfirm.png")%>">Send</option>
                                                                    <option  value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_cancelled.png")%>">Cancelled</option>
                                                                    <option  value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_send.png")%>">Confirmed</option>          
                                                                             
                                                         </select>
                                                    </div>
                                                  </div>
                                                   
                                                 
                                                   
                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="GenerateReport" value="Generate_Report" name="ReportButtons" class="btn btn-success">Generate Report</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->

                                                  <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form supplier-->


                                            <div role="tabpanel" class="tab-pane" id="suppList"> <!-- Start supplier list-->

                                               

                                            </div><!--end supplier list--> 

                                      <div class="clear"></div>  
                                    </div><!--end tabs add supplier list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Supplier section-->

              <div class="clear"></div>
              </div><!--end group tab-->


                </div><!-- end Page content wrapper-->
            </div><!--end page content-->


</asp:Content>
