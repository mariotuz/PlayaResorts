<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


 <script type="text/javascript" src="<%: Url.Content("~/Scripts/add/add_items.js")%>"></script>

 <script type="text/javascript">
     $(document).ready(function () {


         $('#editselectypesuitebreak').selectpicker();

         $('#editbreaknumroomtentative').selectpicker();

         $('#editbreakcomplementaryrooms').selectpicker();

      });


     </script>




<input type="text" id="editbreakdownid" name="editbreakdownid" hidden value="<%:Model.EditGroupData22%>"   >


<input type="text" id="groupbytextedit" name="groupbytextedit" hidden value="<%:Model.GroupBy%>"   >


                                      <div class="modal fade" id="editdeploy" tabindex="-1" role="dialog" >
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
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData21%>" id="editbreakname" name="editbreakname" placeholder="" >
                                                    </div>
                                                  </div>

                                                 <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Guest Last Name</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData36%>" id="editbreaklastname" name="editbreaklastname" placeholder="" >
                                                    </div>
                                                  </div>

                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Rooms</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="1" id="editbreaknumroom" name="editbreaknumroom" disabled  placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                                                        <span><small>Room Type</small></span>
                                                        <select class="selectpicker" data-width="100%"   id="editselectypesuitebreak" name="editselectypesuitebreak">
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
                                                         <select class="selectpicker" id="editbreaknumroomtentative" name="editbreaknumroomtentative" data-width="100%">
                                                                              <option <% If Model.EditGroupData24 = "0" Then%> selected <% End if%> value="0">No</option>
                                                                              <option <% If Model.EditGroupData24 = "1" Then%> selected <% End if%> value="1">Yes</option>
                                                                              
                                                                             
                                                                            </select>
                                                    </div>
                                                  </div>


                                                  

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Complementary Rooms</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                    <%--  <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData33%>" id="breakcomplementaryrooms" name="breakcomplementaryrooms" placeholder="" >--%>

                                                        <select class="selectpicker" id="editbreakcomplementaryrooms" name="editbreakcomplementaryrooms" data-width="100%">
                                                                              <option <% If Model.EditGroupData33 = "0" Then%> selected <% End if%> value="0">No</option>
                                                                              <option <% If Model.EditGroupData33 = "1" Then%> selected <% End if%> value="1">Yes</option>
                                                                              
                                                                             
                                                                            </select>
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Adults</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData25%>" id="editbreakadults" name="editbreakadults" placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Teenager</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData26%>" id="editbreakteens" name="editbreakteens" placeholder="" >
                                                    </div>
                                                  </div>


                                                    <div class="clear"></div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Childs</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData27%>" id="editbreakchilds" name="editbreakchilds"  placeholder="" >
                                                    </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Number of Infants</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData28%>" id="editbreakinfants" name="editbreakinfants" placeholder="" >
                                                    </div>
                                                  </div>

                                                  <!-- date piker 1-->
                                                  <div class="container-date col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span class="txt-filter">Arrival Date</span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='editdatetimepickerdate1'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" value="<%:Model.EditGroupData29%>" id="editdatetimepickerdate1text" name="editdatetimepickerdate1text" />
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
                                                              <div class='input-group date' id='editdatetimepickerdate2'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD" value="<%:Model.EditGroupData30%>" id="editdatetimepickerdate2text" name="editdatetimepickerdate2text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                            </div>
                                                        </div>
                                                  </div>
                                              
                                                    <!--date piker script -->
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#editdatetimepickerdate1').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $('#editdatetimepickerdate2').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $("#editdatetimepickerdate1").on("dp.change", function (e) {
                                                                $('#editdatetimepickerdate2').data("DateTimePicker").minDate(e.date);
                                                            });
                                                            $("#editdatetimepickerdate2").on("dp.change", function (e) {
                                                                //$('#datetimepickerdate1').data("DateTimePicker").maxDate(e.date);
                                                            });
                                                        });
                                                    </script><!--date piker script -->

                                                   <div class="clear"></div>


                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small>Folio / Code PMS</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" class="form-control input-custom corners-inputs" value="<%:Model.EditGroupData31%>" id="editbreakfolio" name="editbreakfolio" placeholder="" >
                                                    </div>
                                                  </div>

                                                 
                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="editgroupspecialnotesbreak" name="editgroupspecialnotesbreak"  rows="3" cols="50" placeholder="Your note..."><%:Model.EditGroupData32%></textarea>
                                                    </div>
                                                  </div>


                                                 <br> <br><br> <br>

                                                     
                                                            <header class="encabezado"><h2 class="md-display-2">Add Pax</h2></header>
                                                            <ol>
                                                                <!--row inputs-->


                                                                                <%
                                                                                    Dim j As Integer
                                                                                    
                                                                                    If Model.ListaBreakdownPaxin.Count = 0 Then
                                                                                        
                                                                                        %>
                                                                                        
                                                                 <div style="margin-bottom:4px;" class="clonedInputmailEdit col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                    
                                                                      <li>
                                                                        <!--inputs group-->
                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Name *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="editPaxList" value="" /><br>
                                                                        </div>
                                                                              </div>


                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Lastname *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="editPaxListLastName" value="" /><br>
                                                                        </div>
                                                                              </div>

                                                                        <!--btn delete inputs-->
                                                                        <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmailedit btn btn-success" value="Remove" disabled="disablemail" />
                                                                        </div>
                                                                      </li>
                                                                    
                                                                </div>

                                                                                    <%
                                                                                        
                                                                                    Else
                                                                                        
                                                                                        
                                                                                    
                
                                                                                        For j = 0 To Model.ListaBreakdownPaxin.Count - 1
                                                                                     %>

                                                                      <div style="margin-bottom:4px;" class="clonedInputmailEdit col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                    
                                                                      <li>
                                                                        <!--inputs group-->
                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Name *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="editPaxList" value="<%:Model.ListaBreakdownPaxin.Item(j).Text%>" /><br>
                                                                        </div>
                                                                              </div>


                                                                          <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12 ">
                                                                          <span><small>Pax Last Name *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="editPaxListLastName" value="<%:Model.ListaBreakdownPaxin.Item(j).Value%>" /><br>
                                                                        </div>
                                                                              </div>

                                                                        <!--btn delete inputs-->
                                                                        <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmailedit btn btn-success" value="Remove" disabled="disablemail" />
                                                                        </div>
                                                                      </li>
                                                                    
                                                                </div>


                                                                                              
                                                                                    <%        
                                                                                    Next
                                                                                    
                                                                                    
                                                                                    
                                                                                End If
                                                                                    %>
                                                                
                                                                
                                                                <!--row inputs-->
                                                              </ol>
                                                                <!--btn add inputs-->
                                                                <div style=" margin-top:5px; ">
                                                                    <input style="background:green !important;" type="button" id="btnAddmailedit" class="btn btn-success fa fa-plus-circle" value=" Add" />
                                                                </div>
                                                                
                                                          
                                             

                                                </div>
                                                <div class="clear"></div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="EditDeployBreakdown"  value="EditDeploy_Breakdown" name="GroupDetailBotons" class="btn btn-success">Save</button>
                                              </div>
                                            </div><!-- /.modal-content -->
                                          </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->
                                          