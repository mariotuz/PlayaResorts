<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsList)" %>

<asp:Content ID="GroupsListTitle" ContentPlaceHolderID="TitleContent" runat="server"> Group List</asp:Content>

<asp:Content ID="GroupsListContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



     <script type="text/javascript">

         function OnSuccess(response) {

             if (response == "Error") {


                 $('#deploy').modal('hide');
                 $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');


             }
             else {

                 $('#deploy').modal('hide');

                 $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                 $("#AlertContent").show();
                 window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);


             }

         }

         function OnFailure(response) {

             $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

         }

         function OnBegin() {

             $('.load-container').fadeIn('slow');

         }

         function OnComplete() {

             $('.load-container').fadeOut('slow');
         }





    </script>

    <script type="text/javascript">


        $(document).ready(function () {

            $('.load-container').fadeOut('slow');

        });

    </script>

                 <!-- Start Page content -->
            <div id="page-content-wrapper">

                <!-- Keep all page content within the page-content inset div! -->
                <div class="page-content inset"><!--Start page content wrapper-->

                <%--    <header class="encabezado"><h2 class="md-display-2">Group List</h2>
                    </header>--%>

                                                           <div id="AJAX_Container1"> 
                                                                    
                                                                
                                                                 <% Html.RenderPartial("GroupListTable", Model)%>

                                                                    
                                                           </div>


    <% Using Ajax.BeginForm("GroupsList", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>
               
           <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                          
                          <!-- Start tab Supplier Section-->
                          <div class="bhoechie-tab-content active">

                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new supplier list-->
                                      <li role="presentation" id="newsupp_head" class="active"><a href="#newsupp" aria-controls="newsupp" role="tab" data-toggle="tab">Filters</a></li>
                                      <li role="presentation"  ><a href="#ordertab" aria-controls="ordertab" role="tab" data-toggle="tab">Order by</a></li>
                                      <li role="presentation" id="suppList_head" ><a href="#suppList" aria-controls="suppList" role="tab" data-toggle="tab"> Totals </a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Supplier list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newsupp"><!--Star tab form supplier-->

                                  


                                                 <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Hotel</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12" role="group">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker w40" multiple id="Select1" name="hotelfilter">
                                                                     <option  value="0" selected  >ALL</option> 
                                                                              <option  value="GCR">Gran Caribe Cancun</option>
                                                                              <option  value="GPR">Gran Porto Playa del Carmen</option>
                                                                              <option  value="RPR">The Royal Playa del Carmen</option>
                                                                              <option  value="TRC">Hyatt Zilara Cancun</option>
                                                                              <option  value="ZLJ" >Hyatt Zilara Rose Hall Jamaica</option>
                                                                              <option  value="ZVC">Hyatt Ziva Cancun</option>
                                                                              <option  value="ZVJ">Hyatt Ziva Rose Hall Jamaica</option>
                                                                              <option  value="ZVL">Hyatt Ziva Los Cabos</option>
                                                                              <option  value="ZVP">Hyatt Ziva Puerto Vallarta</option>      
                                                                             
                                                         </select>
                                                    </div>
                                                  </div>

                                                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Group Coordinator </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker" multiple id="Select2" name="agentfilter" data-width="100%">
                                                                            <option  value="0" selected >ALL</option> 
                                                                              <%
                                                                                  Dim j As Integer
                                                                                        
                                                                                  For j = 0 To Model.ListGroupCordinatorin.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListGroupCordinatorin.Item(j).Value%>"><%:Model.ListGroupCordinatorin.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>

                                                                            </select>
                                                    </div>
                                                  </div>

                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Motive</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker" multiple id="Select3" name="motivefilter" data-width="100%">
                                                                            <option  value="0" selected >ALL</option> 
                                                                            <%
                                                                                        
                
                                                                                For j = 0 To Model.ListaGroupTypein.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListaGroupTypein.Item(j).Value%>"><%:Model.ListaGroupTypein.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                              
                                                                            </select>
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Market</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker" multiple id="Select4" name="marketfilter" data-width="100%">
                                                                            <option  value="0" selected >ALL</option> 
                                                                               <%
                                                                                     
                
                                                                                   For j = 0 To Model.ListaGroupMarketin.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListaGroupMarketin.Item(j).Value%>"><%:Model.ListaGroupMarketin.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>

                                                                            </select>
                                                    </div>
                                                  </div>


                                                  <div class="clear"></div>


                                                 <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Dates</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12" role="group">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker"  id="Select5" name="datefilter" data-width="100%">
                                                                              <option  value="0" selected  >ALL</option> 
                                                                              <option  value="1">Checkin</option>
                                                                              <option  value="2">Checkout</option>
                                                                              <option  value="3">Quote Date</option>
                                                                              <option  value="4">Between Checkin and Checkout</option>
                                                                            
                                                         </select>
                                                    </div>
                                                  </div>

                                                     <!-- date piker 1-->
                                                  <div class="container-date col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span class="txt-filter">Init Date</span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate1'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);" value="" id="datetimepickerdate1text" name="datetimepickerdate1text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div class="container-date col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                      <span class="txt-filter">End Date</span>
                                                        <div class='date-imput'>
                                                            <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate2'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);" value="" id="datetimepickerdate2text" name="datetimepickerdate2text" />
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


                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
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

                                

                                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
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

                                           

                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
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
                                                 

                                           
                                                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Agency Type</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker" multiple id="Select9" name="agencytypefilter" data-width="100%">
                                                                            <option  value="0" selected >ALL</option> 
                                                                               <%
                                                                                     
                
                                                                                   For j = 0 To Model.ListaAgencyTypein.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListaAgencyTypein.Item(j).Value%>"><%:Model.ListaAgencyTypein.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>

                                                                            </select>

                                                    </div>
                                                  </div>


                                                

                                                
                                                       <div class="right">
                                                        <br>
                                                       <button id="ApplyFilters"  value="Apply_Filters" name="GroupsListBotons" class="btn btn-success">Apply</button>
                                                      </div>

                                           

                                              <div class="clear"></div>
                                            </div><!--end tab form supplier-->

                                            <div role="tabpanel" class="tab-pane" id="ordertab"> <!-- Start supplier list-->

                                            
                                                  <ol>
                                                                <!--row inputs-->
                                                                
                                                                <div style="margin-bottom:4px;" class="clonedInputmail col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                    
                                                                      <li>
                                                                        <!--inputs group-->
                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                              <span><small>Order By *</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                             
                                                                               <select class="selectpicker"  name="OrderByList" data-width="100%">
                                                                                         <option selected value="a.Date_Register">Quote Date</option>
                                                                                         <option value="a.ArrivalDate">Checkin</option>
                                                                                         <option value="a.DepartureDate">Checkout</option>
                                                                                         <option value="a.GroupName">Group Name</option>
                                                                                         <option value="Client">Client</option>
                                                                                         <option value="Type_Name">Motive</option>
                                                                                         <option value="a.Id_Group">Id Group</option>
                                                                             
                                                                              </select>
                                                                                <br>
                                                                            </div>
                                                                         </div>


                                                                           <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                               <span><small>Order Type *</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                               
                                                                               <select class="selectpicker"  name="OrderTypeList" data-width="100%">
                                                                                         <option selected value="desc">DESC</option>
                                                                                         <option value="asc">ASC</option>
                                                                             
                                                                                </select>

                                                                                <br>
                                                                            </div>
                                                                         </div>

                                                                        

                                                                        <!--btn delete inputs-->
                                                                      <%--  <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmail btn btn-success" value="Remove" disabled="disablemail" />
                                                                        </div>--%>

                                                                      </li>


                                                                      <li>
                                                                        <!--inputs group-->
                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                              <span><small>Order By *</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                             
                                                                               <select class="selectpicker"  name="OrderByList" data-width="100%">
                                                                                         <option value="0"></option>
                                                                                         <option value="a.ArrivalDate">Checkin</option>
                                                                                         <option value="a.DepartureDate">Checkout</option>
                                                                                         <option value="a.GroupName">Group Name</option>
                                                                                         <option value="Client">Client</option>
                                                                                         <option value="Type_Name">Motive</option>
                                                                                         <option value="a.Id_Group">Id Group</option>
                                                                             
                                                                              </select>
                                                                                <br>
                                                                            </div>
                                                                         </div>


                                                                           <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                               <span><small>Order Type *</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                               
                                                                               <select class="selectpicker"  name="OrderTypeList" data-width="100%">
                                                                                         <option value="0"></option>
                                                                                         <option  value="desc">DESC</option>
                                                                                         <option value="asc">ASC</option>
                                                                             
                                                                                </select>

                                                                                <br>
                                                                            </div>
                                                                         </div>

                                                                        

                                                                        <!--btn delete inputs-->
                                                                     <%--   <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmail btn btn-success" value="Remove" disabled="disablemail" />
                                                                        </div>--%>

                                                                      </li>

                                                                   
                                                                    
                                                                </div>
                                                                <!--row inputs-->
                                                              </ol>
                                                                <!--btn add inputs-->


                                                     <div class="right">
                                                        <br>
                                                       <button id="Button1"  value="Apply_Filters" name="GroupsListBotons" class="btn btn-success">Apply</button>

                                                    </div>

                                                


                                                    <div class="clear"></div>
                                            </div><!--end supplier list--> 

                                            

                                            <div role="tabpanel" class="tab-pane" id="suppList"> <!-- Start supplier list-->

                                               
                                                 <div class="balance-list-groups col-xs-12 col-sm-12 col-md-12">
                                                    <ul class="col-xs-12 col-sm-12 col-md-12 nopadding">
                                                      <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number">$ 0.00</span><span class="title-number">Total Deposits</span></li>
                                                      <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number">$ 0.00</span><span class="title-number">Balance</span></li>
                                                      <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number" id="TotalRevenue">$ 0.00</span><span class="title-number">Total</span></li>
                                                    </ul>
                                                </div>

                                                 <div class="clear"></div>
                                            </div><!--end supplier list--> 

                                      <div class="clear"></div>  
                                    </div><!--end tabs add supplier list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Supplier section-->

              <div class="clear"></div>
              </div><!--end group tab-->


 <% End Using %>

                   

                </div><!-- end Page content wrapper-->
            </div><!--end page content-->


    <% Using Ajax.BeginForm("GroupsList", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>

    
                                     

                                          
     <% End Using %>


</asp:Content>
