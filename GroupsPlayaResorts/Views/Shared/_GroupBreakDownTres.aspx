<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>


      



                                   
                                      <br>
                                      <div>
                                        <h2>BreakDown</h2>
                                        <div class="right" style="margin-top: 15px;">
                                          <a id="donepay" class="btn btn-success" data-toggle="modal" data-target="#deploy">Deployment</a>

                                            
                                        </div>
                                      </div>
                                      <br>



<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin="OnBegin",.OnComplete="OnComplete",.OnSuccess = "OnSuccessBreakDown", .OnFailure = "OnFailureBreakDown", .UpdateTargetId = "AJAX_ContainerBreakDown"})%>

<input type="text" id="grupoidbreakdowngroupby" name="grupoidbreakdowngroupby" hidden value="0"   >

<input type="text" id="selectgroupbytext" name="selectgroupbytext" hidden value="0"   >

<button id="GroupBy_Breakdown"  value="GroupBy_Breakdown" name="GroupDetailBotons" class="btn btn-success" style="visibility:hidden;display:none;" >GroupBy</button>

<% End Using %> 



<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin="OnBegin",.OnComplete="OnComplete",.OnSuccess = "OnSuccessBreakDown", .OnFailure = "OnFailureBreakDown", .UpdateTargetId = "AJAX_ContainerBreakDown"})%>


                                    <input type="text" id="grupoidbreakdown" name="grupoidbreakdown" hidden value="0"   >
                                    <input type="text" id="breakdownhotel" name="breakdownhotel" hidden value="0"   >
                                    <input type="text" id="CancelbreakdownID" name="CancelbreakdownID" hidden value="0"   >

                                      <div class="modal fade" id="deploy" tabindex="-1" role="dialog" >
                                          <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">Deployment</h4>
                                              </div>
                                              <div class="modal-body">
                                                <div class="">


                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Guest Name</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData21%>" id="breakname" name="breakname" placeholder="" >
                                                    </div>
                                                  </div>

                                                 <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Guest Last Name</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData21%>" id="breaklastname" name="breaklastname" placeholder="" >
                                                    </div>
                                                  </div>


                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Rooms</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData22%>" id="breaknumroom" name="breaknumroom"  placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                                                        <span><small>Room Type</small></span>
                                                        <select class="selectpicker" data-width="100%"   id="selectypesuitebreak" name="selectypesuitebreak">
                                                           <option <% If Model.EditGroupData23 = "N/A" Then%> selected <% End if%> value="N/A"></option>
                                                                              <%
                                                                                  Dim i As Integer
                
                                                                                  For i = 0 To Model.ListaSuitein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListaSuitein.Item(i).Value = Model.EditGroupData23 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListaSuitein.Item(i).Value%>"><%:Model.ListaSuitein.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                        </select>
                                                  </div>


                                                    <div class="clear"></div>


                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Tentative Rooms</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                     <%-- <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData24%>" id="breaknumroomtentative" name="breaknumroomtentative" placeholder="" >--%>
                                                         <select class="selectpicker" id="breaknumroomtentative" name="breaknumroomtentative" data-width="100%">
                                                                              <option <% If Model.EditGroupData24 = "0" Then%> selected <% End if%> value="0">No</option>
                                                                              <option <% If Model.EditGroupData24 = "1" Then%> selected <% End if%> value="1">Yes</option>
                                                                              
                                                                             
                                                                            </select>
                                                    </div>
                                                  </div>


                                                  

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Complementary Rooms</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                    <%--  <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData33%>" id="breakcomplementaryrooms" name="breakcomplementaryrooms" placeholder="" >--%>

                                                        <select class="selectpicker" id="breakcomplementaryrooms" name="breakcomplementaryrooms" data-width="100%">
                                                                              <option <% If Model.EditGroupData33 = "0" Then%> selected <% End if%> value="0">No</option>
                                                                              <option <% If Model.EditGroupData33 = "1" Then%> selected <% End if%> value="1">Yes</option>
                                                                              
                                                                             
                                                                            </select>
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Adults</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData25%>" id="breakadults" name="breakadults" placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Teenager</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData26%>" id="breakteens" name="breakteens" placeholder="" >
                                                    </div>
                                                  </div>


                                                    <div class="clear"></div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Childs</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData27%>" id="breakchilds" name="breakchilds"  placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Infants</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData28%>" id="breakinfants" name="breakinfants" placeholder="" >
                                                    </div>
                                                  </div>

                                                  <!-- date piker 1-->
                                                  <div class="container-date col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span class="txt-filter">Arrival Date</span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate1'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" value="<%:Model.EditGroupData4%>" id="datetimepickerdate1text" name="datetimepickerdate1text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div class="container-date col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                      <span class="txt-filter">Departure date</span>
                                                        <div class='date-imput'>
                                                            <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate2'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" value="<%:Model.EditGroupData5%>" id="datetimepickerdate2text" name="datetimepickerdate2text" />
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
                                                    <span><small>Folio / Code PMS</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData31%>" id="breakfolio" name="breakfolio" placeholder="" >
                                                    </div>
                                                  </div>

                                                 
                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="groupspecialnotesbreak" name="groupspecialnotesbreak"  rows="3" cols="50" placeholder="Your note..."><%:Model.EditGroupData32%></textarea>
                                                    </div>
                                                  </div>


                                                 <br> <br><br> <br>

                                                     
                                                            <header class="encabezado"><h2 class="md-display-2">Add Pax</h2></header>
                                                            <ol>
                                                                <!--row inputs-->
                                                                
                                                                <div style="margin-bottom:4px;" class="clonedInputmail col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                    
                                                                      <li>
                                                                        <!--inputs group-->
                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Name *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="PaxList" /><br>
                                                                        </div>
                                                                              </div>


                                                                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Last Name *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="PaxListLastName" /><br>
                                                                        </div>
                                                                              </div>

                                                                        <!--btn delete inputs-->
                                                                        <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmail btn btn-success" value="Remove" disabled="disablemail" />
                                                                        </div>
                                                                      </li>
                                                                    
                                                                </div>
                                                                <!--row inputs-->
                                                              </ol>
                                                                <!--btn add inputs-->
                                                                <div style=" margin-top:5px; ">
                                                                    <input style="background:green !important;" type="button" id="btnAddmail" class="btn btn-success fa fa-plus-circle" value=" Add" />
                                                                </div>
                                                                
                                                          
                                             

                                                </div>
                                                <div class="clear"></div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="DeployBreakdown"  value="Deploy_Breakdown" name="GroupDetailBotons" class="btn btn-success">Save</button>
                                              </div>
                                            </div><!-- /.modal-content -->
                                          </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->
                                          


                                                            <div id="AJAX_ContainerBreakDownDos"> 

                                                 
                                                                    
                                                                
                                                                 <% Html.RenderPartial("EditBreakDownConsult", Model)%>


                                                                    
                                                           </div>




<div class="modal fade" id="breakdowncancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to cancel the room? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">



                                                     <span><small> Cancel Type </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <select class="selectpicker" id="canceltypebreak" name="canceltypebreak" data-width="100%">
                                                                              <option  value="0"> </option>
                                                                              <option  value="1">Expensive Rates</option>
                                                                             
                                                                            </select>
                                                    </div>
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="cancelspecialnotesbreak" name="cancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteDeployBreakdown" value="DeleteDeploy_Breakdown" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


<% End Using %>     
                                                            
                                                            <div id="AJAX_ContainerBreakDown"> 

                                                 
                                                                    
                                                                
                                                                 <% Html.RenderPartial("BreakDownConsultDos", Model)%>


                                                                    
                                                           </div>


      
