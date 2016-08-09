<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>


                                          <div role="tabpanel"><!-- Start Contentainer tabs-->
                                                      <!-- Start Nav tabs -->

                                               <input type="text" id="grupoidevents" name="grupoidevents" hidden value="0"   >         

                                              <input type="text" id="grupohotelevents" name="grupohotelevents" hidden value="0"   >

                                               <input type="text" id="CancelEventID" name="CancelEventID" hidden value="0"   >

                                                      <br>
                                                      <br>
                                                      <ul class="nav nav-tabs dual-select" role="tablist" >
                                                        <li role="presentation" id="eventlist_head" class="col-xs-6 col-md-6 active"><a href="#eventlist" aria-controls="eventlist" role="tab" data-toggle="tab">Events List</a></li>
                                                        <li role="presentation" id="eventfrm_head" class="col-xs-6 col-md-6"><a href="#eventfrm" aria-controls="eventfrm" role="tab" data-toggle="tab">Add New Event</a></li>
                                                        <%--<li role="presentation" id="servprod_head" class="col-xs-4 col-md-4"><a href="#servprod" aria-controls="servprod" role="tab" data-toggle="tab">Products & Services List</a></li>--%>
                                                        <%--<li role="presentation" class="col-xs-6 col-md-3"><a href="#locksalon" aria-controls="locksalon" role="tab" data-toggle="tab">Lock of Ballroom</a></li>--%>
                                                      </ul>
                                                      <!-- end Nav tabs -->

                                                      <!-- Start Tab panes -->
                                                      <div class="tab-content"><br>

                                                            <div role="tabpanel" class="tab-pane active" id="eventlist"><!-- Start events list tabs-->
                                                                 <header class=""><h2 class="md-display-2">Events List</h2></header>
                                                                  <div class="toolbar">
                                                                     <!--action btns table here-->
                                                                  </div>
                                                      
                                                                 
                                                                <div id="AJAX_ContainerEvents"> 
    
                                                                    <% Html.RenderPartial("EventsConsult", Model)%>
             
                                                                </div>



                                                            </div><!-- end events list tabs-->

                                                            <div role="tabpanel" class="tab-pane" id="eventfrm"><!-- Start generet form events tabs-->
                                                              <header class=""> <h2 class="md-display-2">Add New Event</h2><p> </p></header>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Event name *</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" id="eventname" name="eventname" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                 <%-- <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Company / Wholesale *</small></span>
                                                                       <select class="selectpicker" data-width="100%">
                                                                          <option>Option 1</option>
                                                                          <option>Option 2</option>
                                                                          <option>Option 3</option>
                                                                          <option>Option 4</option>
                                                                        </select>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Contact *</small></span>
                                                                       <select class="selectpicker" data-width="100%">
                                                                          <option>Option 1</option>
                                                                          <option>Option 2</option>
                                                                          <option>Option 3</option>
                                                                          <option>Option 4</option>
                                                                        </select>
                                                                  </div>--%>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Number of Pax *</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" id="eventpax" name="eventpax" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Salon *</small></span>
                                                                      <%
                                                                          If Model.ListaSalonsxin.Count = 0 Then
                                                                              
                                                                      %>

                                                                       <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                                <input type="text" class="form-control input-custom corners-inputs" id="eventsalontext" name="eventsalontext" placeholder=""  >
                                                                         </div>

                                                                     <%
                                                                     Else
                                                                     %>

                                                                       <select class="selectpicker" id="eventsalon" name="eventsalon" data-width="100%">
                                                                         <%
                                                                                  Dim i As Integer
                
                                                                             For i = 0 To Model.ListaSalonsxin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListaSalonsxin.Item(i).Value = "edgar" Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListaSalonsxin.Item(i).Value.ToString + "," + Model.ListaSalonsxin.Item(i).Text%>"><%:Model.ListaSalonsxin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                        </select>

                                                                       

                                                                     <%
                                                                     End If
                                                                     
                                                                     %>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Seller *</small></span>
                                                                       <select class="selectpicker" id="eventseller" name="eventseller" data-width="100%">
                                                                           <option <% If "edgar" = "0" Then%> selected <% End if%> value="0"></option>
                                                                                <%
                                                                                       
                
                                                                                    For i = 0 To Model.ListEventSellerin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListEventSellerin.Item(i).Value = "edgar" Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListEventSellerin.Item(i).Value%>"><%:Model.ListEventSellerin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                         
                                                                        </select>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                        <span><small>Coordinator *</small></span>
                                                                       <select class="selectpicker" id="eventcoordinator" name="eventcoordinator" data-width="100%">
                                                                         <option <% If "edgar" = "0" Then%> selected <% End if%> value="0"></option>
                                                                                <%
                                                                                       
                
                                                                                    For i = 0 To Model.ListEventCordinatorin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListEventCordinatorin.Item(i).Value = "edgar" Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListEventCordinatorin.Item(i).Value%>"><%:Model.ListEventCordinatorin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                        
                                                                        </select>
                                                                  </div>

                                                                  <div class='date-only col-xs-12 col-sm-6 col-md-6 col-lg-3'>
                                                                    <span><small>Event date *</small></span>
                                                                      <div class="form-group">
                                                                          <div class='input-group date' id='datetimepicker15'>
                                                                              <input type='text' class="form-control" id="datetimepicker15text" name="datetimepicker15text" />
                                                                              <span class="input-group-addon">
                                                                                  <span class="glyphicon glyphicon-calendar"></span>
                                                                              </span>
                                                                          </div>
                                                                      </div>
                                                                      <script type="text/javascript">
                                                                          $(function () {
                                                                              $('#datetimepicker15').datetimepicker({
                                                                                  format: 'YYYY-MM-DD'
                                                                              });
                                                                          })
                                                                      </script>
                                                                  </div>
                                                                  
                                                                  <div class='date-only col-xs-12 col-sm-6 col-md-6 col-lg-3'>
                                                                    <span><small>Event Start Time *</small></span>
                                                                      <div class="form-group">
                                                                          <div class='input-group date' id='datetimepicker16'>
                                                                              <input type='text' class="form-control" id="datetimepicker16text" name="datetimepicker16text" />
                                                                              <span class="input-group-addon">
                                                                                  <span class="glyphicon glyphicon-time"></span>
                                                                              </span>
                                                                          </div>
                                                                      </div>
                                                                      <script type="text/javascript">
                                                                          $(function () {
                                                                              $('#datetimepicker16').datetimepicker({
                                                                                  format: 'LT'
                                                                              });
                                                                          })
                                                                      </script>
                                                                  </div>
                                                                  
                                                                  <div class='date-only col-xs-12 col-sm-6 col-md-6 col-lg-3'>
                                                                    <span><small>Event End Time *</small></span>
                                                                      <div class="form-group">
                                                                          <div class='input-group date' id='datetimepicker17'>
                                                                              <input type='text' class="form-control" id="datetimepicker17text" name="datetimepicker17text" />
                                                                              <span class="input-group-addon">
                                                                                  <span class="glyphicon glyphicon-time"></span>
                                                                              </span>
                                                                          </div>
                                                                      </div>
                                                                      <script type="text/javascript">
                                                                          $(function () {
                                                                              $('#datetimepicker17').datetimepicker({
                                                                                  format: 'LT'
                                                                              });
                                                                          })
                                                                      </script>
                                                                  </div>

                                                                  <div class="clear"></div>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                                    <span><small>Add a Comment</small></span><br>
                                                                    <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="eventcoment" name="eventcoment" rows="5" cols="50" placeholder="Your comment..."></textarea>
                                                                     
                                                                  </div>

                                                                     <div class="clear"></div>

                                                                  <div style="display:inline-block; padding:15px;">
                                                                    <button id="AddEvent"  value="Add_Event" name="GroupDetailBotons" class="btn btn-success">Add Event</button>
                                                                  </div>


                                                            </div><!-- end generet form events tabs-->

                                                            <div role="tabpanel" class="tab-pane" id="servprod"><!-- Start events product tabs-->
                                                                 <header class=""><h2 class="md-display-2">Add New Product & Service</h2><p></p></header>


                                                                <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                      <span><small>Event name *</small></span>
                                                                     <select class="selectpicker" data-width="100%">
                                                                        <option>Option 1</option>
                                                                        <option>Option 2</option>
                                                                        <option>Option 3</option>
                                                                        <option>Option 4</option>
                                                                      </select>
                                                                </div>

                                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Product or Service *</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                      <span><small>Supplier *</small></span>
                                                                       <select class="selectpicker" data-width="100%">
                                                                          <option>Option 1</option>
                                                                          <option>Option 2</option>
                                                                          <option>Option 3</option>
                                                                          <option>Option 4</option>
                                                                        </select>
                                                                  </div>

                                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Amount *</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                                    </div>
                                                                  </div>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-3" role="group">
                                                                      <span><small>Unit *</small></span>
                                                                       <select class="selectpicker" data-width="100%">
                                                                          <option>Option 1</option>
                                                                          <option>Option 2</option>
                                                                          <option>Option 3</option>
                                                                          <option>Option 4</option>
                                                                        </select>
                                                                  </div>

                                                                   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                                    <span><small>Price *</small></span>
                                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                                    </div>
                                                                  </div>


                                                                <div class="clear"></div>

                                                                  <div style="display:inline-block; padding:15px;">
                                                                    <button type="button" class="btn btn-success">Add Item</button>
                                                                  </div>

                                                                   
                                                                     
                                                                 
                                                            </div><!-- end event products tabs-->

                                                            <%--<div role="tabpanel" class="tab-pane" id="locksalon"><!-- Start lock salon tabs-->
                                                            </div>--%><!-- end lock salon tabs-->

                                                      </div><!--end tab pane-->
                                              </div><!-- end Contentainer tabs-->


<div class="modal fade" id="eventcancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="Button1" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to cancel the event? </h4>
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
            <button id="Button3" value="Delete_Event" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->