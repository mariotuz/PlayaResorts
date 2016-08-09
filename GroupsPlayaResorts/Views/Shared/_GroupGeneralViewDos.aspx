<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsDetail)" %>

                                         
<!--/////////////////////////////////////////////////////////// launch form ////////////////////////////////////////////////////////////////////////////-->

                                            <div id="col-right" class="col-xs-12 col-sm-12 col-md-12 nopadding"><!-- Start col Right-->

                                              <div role="tabpanel">
                                                      <!-- Nav tabs -->
                                                      <br>
                                                      <br>
                                                      <ul class="nav nav-tabs dual-select" role="tablist" id="generalViewTab">
                                                        <li role="presentation" id="form-grouphead" class="col-xs-4 col-md-4 active"><a href="#form-group" aria-controls="form-group" role="tab" data-toggle="tab">Group Cotizador</a></li>
                                                        <li role="presentation" id="rateshead" class="col-xs-4 col-md-4 disabledTab"><a href="#rates" aria-controls="rates" role="tab" data-toggle="tab">Group Rates</a></li>
                                                        <li role="presentation" id="form-grouphead-info" class="col-xs-4 col-md-4 disabledTab "><a href="#form-group-info" aria-controls="form-group-info" role="tab" data-toggle="tab">Group Information</a></li>
                                                        
                                                      </ul> 
                                                      <!-- Nav tabs -->

                                                      <!-- Tab panes -->
                                                      <div class="tab-content"><br>

                                                            <div rol="tabpanel" class="tab-pane active" id="form-group">
                                                                <div>
                                                                  <h2>Group Cotizador </h2><span class="instrucions">&nbsp;&nbsp;To check the rates need to carry at least the fields marked with (*).</span>
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

                                                                   
                                                                   
                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                           <span><small>Hotel Name *</small></span>
                                                                            <select class="selectpicker" id="HotelSelect" name="HotelSelect" data-width="100%">
                                                                              <option <% If Model.EditGroupData1 = "GCR" Then%> selected <% End if%> value="GCR">Gran Caribe Cancun</option>
                                                                              <option <% If Model.EditGroupData1 = "GPR" Then%> selected <% End if%> value="GPR">Gran Porto Playa del Carmen</option>
                                                                              <option <% If Model.EditGroupData1 = "RPR" Then%> selected <% End if%> value="RPR">The Royal Playa del Carmen</option>
                                                                              <option <% If Model.EditGroupData1 = "TRC" Then%> selected <% End if%> value="TRC">Hyatt Zilara Cancun</option>
                                                                              <option <% If Model.EditGroupData1 = "ZLJ" Then%> selected <% End if%> value="ZLJ" >Hyatt Zilara Rose Hall Jamaica</option>
                                                                              <option <% If Model.EditGroupData1 = "ZVC" Then%> selected <% End if%> value="ZVC">Hyatt Ziva Cancun</option>
                                                                              <option <% If Model.EditGroupData1 = "ZVJ" Then%> selected <% End if%> value="ZVJ">Hyatt Ziva Rose Hall Jamaica</option>
                                                                              <option <% If Model.EditGroupData1 = "ZVL" Then%> selected <% End if%> value="ZVL">Hyatt Ziva Los Cabos</option>
                                                                              <option <% If Model.EditGroupData1 = "ZVP" Then%> selected <% End if%> value="ZVP">Hyatt Ziva Puerto Vallarta</option>
                                                                            </select>
                                                                      </div>

                                                                    
                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Wholesale *</small></span>
                                                                        
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                                    <input type="text" id="WhosaleDetail" name="WhosaleDetail" value="<%:Model.EditGroupData2%>"  class="form-control input-custom corners-inputs obligatorio" placeholder="" >
                                                                                     <span class="input-group-btn">
                                                                                        <a class="btn btn-default " id="cleanwhosale">X</a>
                                                                                    </span>
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


                                                                      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Number of Rooms *</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="numberpax" name="numberpax" value="<%:Model.EditGroupData3%>"  class="form-control input-custom corners-inputs obligatorio" placeholder="" data-validacion="numero" onblur="_Validaciones.ValidaCampo(this);">
                                                                        </div>
                                                                      </div>

                                                                       <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                           <span><small>Type Rate *</small></span>
                                                                            <select class="selectpicker" id="selectyperatecotizar" name="selectyperatecotizar" data-width="100%">

                                                                                 <option  <% If Model.EditGroupData6 = "4" Then%> selected <% End if%> value="4">Modelo de Compensacion</option>
                                                                                 <option  <% If Model.EditGroupData6 = "5" Then%> selected <% End if%> value="5">MICE</option>
                                                                                 <option  <% If Model.EditGroupData6 = "2" Then%> selected <% End if%> value="2">Tarifario Manual</option>
                                                                                 <option  <% If Model.EditGroupData6 = "3" Then%> selected <% End if%> value="3">Tarifario Semiautomatico</option>
                                                                                 <option  <% If Model.EditGroupData6 = "1" Then%> selected <% End if%> value="1">Tarifario</option>
                                                                                  
                                                                            </select>
                                                                      </div>
                                                                         

                                                                    <div class="clear"></div><br>
                                                                     
 

                                                                        <!-- date piker 1-->
                                                                        <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                          <span class="txt-filter">Arrival Date *</span>
                                                                            <div class='date-imput'>
                                                                                <div class="form-group">
                                                                                    <div class='input-group date' id='datetimepicker6'>
                                                                                        <input id="datetimepicker6text" name="datetimepicker6text" value="<%:Model.EditGroupData4%>" type='text' class="form-control obligatorio" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);" />
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
                                                                                        <input id="datetimepicker7text" name="datetimepicker7text" value="<%:Model.EditGroupData5%>" type='text' class="form-control obligatorio" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);" />
                                                                                          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                             
                                                                                        </span>
                                                                                    </div>
                                                                                     <%-- <div class="input-append date" id="datetimepicker7" data-date="12-02-2012" data-date-format="YYYY-MM-DD">
                                                                                          <input class="span2" size="16" type="text" value="12-02-2012">
                                                                                          <span class="add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                        </div>--%>

                                                                                  </div>
                                                                              </div>
                                                                        </div>


                                                                         
                                                            
                                                                          <!--date piker script -->
                                                                          <script type="text/javascript">
                                                                              $(function () {

                                                                                  //$('#datetimepicker6').datepicker();
                                                                                  //$('#datetimepicker7').datepicker();

                                                                                  $('#datetimepicker6').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepicker7').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $("#datetimepicker6").on("dp.change", function (e) {
                                                                                      $('#datetimepicker7').data("DateTimePicker").minDate(e.date);


                                                                                  });
                                                                                  $("#datetimepicker7").on("dp.change", function (e) {
                                                                                      //$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);

                                                                                      var dat = new Date(document.getElementById("datetimepicker6text").value);
                                                                                      var dat2 = new Date(document.getElementById("datetimepicker7text").value);
                                                                                      var _MS_PER_DAY = 1000 * 60 * 60 * 24;

                                                                                      var differt = Math.floor((dat2 - dat) / _MS_PER_DAY);
                                                                                      document.getElementById("NumberNights").value = differt;
                                                                                  });
                                                                              });
                                                                          </script><!--date piker script -->


                                                                   
                                                                           <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Number of Nights *</small></span>
                                                                        
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                                    <input  type="text" id="NumberNights" name="NumberNights" value="<%:Model.EditGroupData35%>"  class="form-control input-custom corners-inputs obligatorio" placeholder="" data-validacion="numero" onblur="_Validaciones.ValidaCampo(this);" >
                                                                            </div>

                                                                       
                                                                       </div>
                                                                   

                                                                     <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Group Type </small></span>
                                                                            <select class="selectpicker" id="selectgrouptype" name="selectgrouptype" data-width="100%">
                                                                             <%-- <option <% If Model.EditGroupData10 = "0" Then%> selected <% End if%> value="0"></option>--%>
                                                                                
                                                                                <%
                                                                                        Dim i As Integer 
                
                                                                                    For i = 0 To Model.ListaGroupTypein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListaGroupTypein.Item(i).Value = Model.EditGroupData10 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListaGroupTypein.Item(i).Value%>"><%:Model.ListaGroupTypein.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                             
                                                                            </select>
                                                                      </div>
                                                                        
                                                                    
                                                                         
                                                                      <div class="clear"></div>
                                                                                                                                         <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Quote Type </small></span>
                                                                            <select class="selectpicker" id="selectquotetype" name="selectquotetype" data-width="100%">
                                                                                <option value="0" <% If Model.EditGroupData51 = "0" Then%> selected <% End if%> >Room Only</option>
                                                                                <option value="1" <% If Model.EditGroupData51 = "1" Then%> selected <% End if%> >Package</option>
                                                                            </select>
                                                                      </div>
                                                                        
                                                                    
                                                                         
                                                                      <div class="clear"></div>


                                                                </div><!-- End form-->
                                                            </div>

                                                           
                                                            <div role="tabpanel" class="tab-pane" id="rates"><!-- Start promotions tabs-->



                                                                 <div id="AJAX_Container1"> 

                                                 
                                                                    
                                                                
                                                                 <% Html.RenderPartial("RatesConsult", Model)%>


                                                                    
                                                               </div>



                                                            </div><!-- end promotions tabs-->

                                                           
                                                            <div rol="tabpanel" class="tab-pane " id="form-group-info">
                                                                <div>
                                                                  <h2>Group Information </h2><span class="instrucions">&nbsp;&nbsp;</span>
                                                                  <!--btn save / consult-->
                                                                  <%
                                                                      If (ViewData("idseccion1subseccion1edit_permission") IsNot Nothing And ViewData("idseccion1subseccion1edit_permission") > 0) Then
                                                                          Response.Write("<div class=""right"" style=""margin-top: 15px;""><button id=""SaveGroup""  value=""Save_Group"" name=""GroupDetailBotons"" class=""btn btn-success"" style=""margin-top: 17px;"">Save Group</button></div>")
                                                                      End If
                                                                  %>
                                                                </div>
                                                                <div id="Div2" class="col-xs-12 col-sm-12 col-md-12 minheight nopadding"> <!-- Start form-->
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
                                                                          <input type="text" id="groupname" name="groupname" value="<%:Model.EditGroupData8%>" class="form-control input-custom corners-inputs" placeholder="" >
                                                                        </div>
                                                                      </div>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Market <%--<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>--%></small></span>
                                                                           <select class="selectpicker" id="selectmarket" name="selectmarket" data-width="100%">
                                                                              <option <% If Model.EditGroupData9 = "0" Then%> selected <% End if%> value="0"></option>
                                                                              <%
                                                                                       
                
                                                                                    For i = 0 To Model.ListaGroupMarketin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListaGroupMarketin.Item(i).Value = Model.EditGroupData9 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListaGroupMarketin.Item(i).Value%>"><%:Model.ListaGroupMarketin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                             
                                                                            </select>
                                                                      </div>

                                                                    <%--  <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Number of Pax</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="Text2" class="form-control input-custom corners-inputs" placeholder="" >
                                                                        </div>
                                                                      </div>--%>

                                                                     

                                                                     <%-- <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Destination *</small></span>
                                                                            <select class="selectpicker" id="Select3" data-width="100%">
                                                                              <option value="1">Cancun</option>
                                                                              <option value="2">Playa del Carmen</option>
                                                                              <option value="3">Puerto Vallarta</option>
                                                                              <option value="4">Los Cabos</option>
                                                                              <option value="5">Jamaica</option>
                                                                            </select>
                                                                      </div>--%>

                                                                      <%--<div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                           <span><small>Hotel Name *</small></span>
                                                                            <select class="selectpicker" id="Select4" name="HotelSelect" data-width="100%">
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
                                                                      </div>--%>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Allotment</small></span>
                                                                            <select class="selectpicker" id="selectallotment" name="selectallotment" data-width="100%">
                                                                              <option <% If Model.EditGroupData11 = "0" Then%> selected <% End if%> value="0"></option>
                                                                              <option <% If Model.EditGroupData11 = "1" Then%> selected <% End if%> value="1">Above</option>
                                                                              <option <% If Model.EditGroupData11 = "2" Then%> selected <% End if%> value="2">With in</option>
                                                                             
                                                                            </select>
                                                                      </div>


                                                                   


                                                                      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Peak Nights</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <%--<input type="text" id="complementaryroom" name="complementaryroom" value=""  class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                                            <input type="text" id="peakroom" name="peakroom" value="<%:Model.EditGroupData12%>"  class="form-control input-custom corners-inputs" placeholder="" data-validacion="numero" onblur="_Validaciones.ValidaCampo(this);">
                                                                        </div>
                                                                      </div>

                                                                     <%-- <div class="clear"></div>--%>

                                                                    <div class="clear"></div><br>

                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Agency Type </small></span>
                                                                           <select class="selectpicker" id="selectagencytype" name="selectagencytype" data-width="100%" onchange="ActivaCompany(value);">
                                                                              <option <% If Model.EditGroupData13 = "0" Then%> selected <% End if%> value="0"></option>
                                                                                <%
                                                                                       
                
                                                                                    For i = 0 To Model.ListaAgencyTypein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListaAgencyTypein.Item(i).Value = Model.EditGroupData13 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListaAgencyTypein.Item(i).Value%>"><%:Model.ListaAgencyTypein.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                             
                                                                            </select>
                                                                      </div>


                                                                     


                                                                    <script type="text/javascript">
                                                                        $(document).ready(function () {

                                                                            $('#CompanyNew').click(function (e) {


                                                                                //$('#modalCompany').modal('show');
                                                                                $('#CompanyRequestValue').val($('#selectcompany').val());
                                                                                $("#RequestCompanyValue").click();

                                                                            })


                                                                            $('#ContacNew').click(function (e) {


                                                                                $("#WholesaleContactmodal").val($("#WhosaleDetail").val());
                                                                                $("#CompanyContactmodal").val($("#selectcompany").val());

                                                                                $('#ContactRequestValue').val($('#selectcontact').val());
                                                                                $("#RequestContactValue").click();

                                                                                //$('#modealContact').modal('show');


                                                                            })

                                                                            $('#cleanwhosale').click(function (e) {


                                                                                $("#WhosaleDetail").val("");


                                                                            })

                                                                        });

                                                                    </script>

                                                                      


                                                                     <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Company</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="selectcompany" name="selectcompany" value="<%:Model.EditGroupData14%>" onclick="ValidaClaseVacia(this);"  class="form-control input-custom corners-inputs" placeholder="" >
                                                                           <span class="input-group-btn">
                                                                            <a class="btn btn-default " id="CompanyNew">+</a>
                                                                          </span>
                                                                        </div>
                                                                      </div>



<%--                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Company </small></span>
                                                                           <select class="selectpicker" id="selectcompany" name="selectcompany" data-width="100%">
                                                                              <option <% If Model.EditGroupData14 = "" Then%> selected <% End if%> value=""></option>
                                                                              <option <% If Model.EditGroupData14 = "Agencia Mundial" Then%> selected <% End if%> value="Agencia Mundial">Agencia Mundial</option>
                                                                              
                                                                            </select>
                                                                      </div>--%>

                                                                     <%-- <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Wholesale *</small></span>
                                                                        
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                                    <input type="text" id="Text4" name="WhosaleDetail"  class="form-control input-custom corners-inputs" placeholder="" >
                                                                            </div>

                                                                     
                                                                      </div>--%>

                                                             <%--         <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Contact </small></span>
                                                                          <select class="selectpicker" id="selectcontact" name="selectcontact" data-width="100%">
                                                                             <option  <% If Model.EditGroupData15 = "" Then%> selected <% End if%> value=""></option>
                                                                             <option  <% If Model.EditGroupData15 = "Rocio Rodriguez" Then%> selected <% End if%> value="Rocio Rodriguez">Rocio Rodriguez</option>
                                                                            
                                                                          </select>
                                                                      </div>--%>


                                                                     


                                                                     <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                        <span><small>Contact</small></span>
                                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                          <input type="text" id="selectcontact" name="selectcontact" value="<%:Model.EditGroupData15%>"  class="form-control input-custom corners-inputs" placeholder="" >
                                                                           <span class="input-group-btn">
                                                                            <a class="btn btn-default" id="ContacNew">+</a>
                                                                          </span>
                                                                        </div>
                                                                      </div>


                                                                  


                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                          <span><small>Group Coordinator </small></span>
                                                                          <select class="selectpicker" id="selectgroupcordinator" name="selectgroupcordinator" data-width="100%">
                                                                         <%--   <option <% If Model.EditGroupData16 = "" Then%> selected <% End if%> value=""></option>
                                                                            <option <% If Model.EditGroupData16 = "Patricia Romero" Then%> selected <% End if%> value="Patricia Romero">Patricia Romero</option>
                                                                            --%>

                                                                              <option <% If Model.EditGroupData16 = "0" Then%> selected <% End if%> value="0"></option>
                                                                              <%
                                                                                        
                                                                                  For i = 0 To Model.ListGroupCordinatorin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListGroupCordinatorin.Item(i).Value = Model.EditGroupData16 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListGroupCordinatorin.Item(i).Value%>"><%:Model.ListGroupCordinatorin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                                          </select>
                                                                      </div>


                                                                     <div class="clear"></div><br>


                                                                      <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Onsite Coordinator </small></span>
                                                                            <select class="selectpicker" id="selectonsitecordinator" name="selectonsitecordinator" data-width="100%">
                                                                             <%-- <option  <% If Model.EditGroupData17 = "" Then%> selected <% End if%> value=""></option>
                                                                              <option  <% If Model.EditGroupData17 = "Edgar Zaldivar" Then%> selected <% End if%> value="Edgar Zaldivar">Edgar Zaldivar</option>
                                                                            --%>  

                                                                                <option <% If Model.EditGroupData17 = "0" Then%> selected <% End if%> value="0"></option>
                                                                                 <%
                                                                                        
                                                                                     For i = 0 To Model.ListOnsiteCordinatorin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListOnsiteCordinatorin.Item(i).Value = Model.EditGroupData17 Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListOnsiteCordinatorin.Item(i).Value%>"><%:Model.ListOnsiteCordinatorin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>

                                                                            </select>
                                                                      </div>

                                                         <%--             <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                            <span><small>Channel </small></span>
                                                                           
                                                                           <select class="selectpicker" id="selectchannel" name="selectchannel" data-width="100%">
                                                                               <option <% If Model.EditGroupData18 = "" Then%> selected <% End if%> value=""></option>
                                                                              <option <% If Model.EditGroupData18 = "Call Center" Then%> selected <% End if%> value="Call Center">Call Center</option>
                                                                              <option <% If Model.EditGroupData18 = "Onsite" Then%> selected <% End if%> value="Onsite">Onsite</option>
                                                                             
                                                                            </select>
                                                                      </div>--%>

                                                               

                
                                                             

                                                                       <%-- <!-- date piker 1-->
                                                                        <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                          <span class="txt-filter">Arrival Date *</span>
                                                                            <div class='date-imput'>
                                                                                <div class="form-group">
                                                                                    <div class='input-group date' id='Div3'>
                                                                                        <input id="Text5" name="datetimepicker6text" type='text' class="form-control" data-format="yyyy-MM-dd" />
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
                                                                                    <div class='input-group date' id='Div4'>
                                                                                        <input id="Text6" name="datetimepicker7text" type='text' class="form-control" data-format="yyyy-MM-dd" />
                                                                                          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                        </span>
                                                                                    </div>
                                                                                  </div>
                                                                              </div>
                                                                        </div>--%>
                                                                    
                                                                          <!--date piker script -->
                                                                         <%-- <script type="text/javascript">
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
                                                                          </script>--%><!--date piker script -->

                                                                          

                                                                          <!-- date piker 2-->
                                                                          <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3" style="display:none;">
                                                                              <span class="txt-filter">Tentative Arrival Date</span>
                                                                              <div class='date-imput'>
                                                                                  <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepicker9'>
                                                                                          <input type='text' id="datetimepicker9text" name="datetimepicker9text" value="<%:Model.EditGroupData19%>" class="form-control" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);"/>
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>

                                                                          <div class="container-date col-xs-12 col-sm-6 col-md-4 col-lg-3" style="display:none;">
                                                                              <span class="txt-filter">Tenative Departure Date</span>
                                                                                <div class='date-imput'>
                                                                                    <div class="form-group">
                                                                                      <div class='input-group date' id='datetimepicker8'>
                                                                                          <input type='text' id="datetimepicker8text" name="datetimepicker8text" value="<%:Model.EditGroupData20%>" class="form-control" data-format="YYYY-MM-DD" data-validacion="fecha" onblur="_Validaciones.ValidaCampo(this);"/>
                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                          </span>
                                                                                      </div>
                                                                                    </div>
                                                                                </div>
                                                                          </div>

                                                                    
                                                                          <!--date piker script -->
                                                                          <script type="text/javascript">
                                                                              $(function () {
                                                                                  $('#datetimepicker9').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepicker8').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $("#datetimepicker9").on("dp.change", function (e) {
                                                                                      $('#datetimepicker8').data("DateTimePicker").minDate(e.date);
                                                                                  });
                                                                                  $("#datetimepicker8").on("dp.change", function (e) {
                                                                                      //$('#datetimepicker9').data("DateTimePicker").maxDate(e.date);
                                                                                  });

                                                                                  $('#datetimepickerScheme1').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepickerScheme2').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepickerScheme3').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepickerScheme4').datetimepicker({ format: 'YYYY-MM-DD' });
                                                                                  $('#datetimepickerScheme5').datetimepicker({ format: 'YYYY-MM-DD' });

                                                                              });
                                                                          </script><!--date piker script -->


                                                                            <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                <span hidden><small>Special Groups Concessions</small></span><br>
                                                                                <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="groupspecialnotes" name="groupspecialnotes" hidden rows="5" cols="50" placeholder="Your note..."></textarea>
                                                                            </div>
                                                                      
                                                                      <div class="clear"></div>
                                                                </div><!-- End form-->
                                                            </div>

                                                           
                                                              
                                                                                                         
                                                      </div><!--end tab pane-->
                                              </div>
                                            </div><!-- End col Rigth-->





<div class="modal fade" id="existgroupmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">There is already one or more groups keeping with the data you want to save the id are: </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <input type="text" id="existgroupmodalidstext" name="existgroupmodalidstext" hidden value="0"   >

            <div class="" id="existgroupmodalids">

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button id="RecalculateGroupCheck" class="btn btn-default" data-dismiss="modal" >Cancel</button>
            <button id="SaveGroupCheck" value="Save_Group_Check" name="GroupDetailBotons" class="btn btn-success">Save Group</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->



<div class="modal fade" id="existgroupmodaldos" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">There is already one or more groups keeping with the hotel and between travel dates you need to take in mind: </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <input type="text" id="existgroupmodalidstextdos" name="existgroupmodalidstextdos" hidden value="0"   >

            <div class="" id="existgroupmodalidsdos">

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button id="Button3" class="btn btn-default" data-dismiss="modal" >Cancel</button>
          
          </div>
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


<div class="modal fade" id="checkmiceratesmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">For the room number should be used MICE rates </h4>
      </div>

<%--        <div class="modal-body"><!-- Start modal body-->
          
            <div class="clear"></div>

        </div><!-- End modal body-->--%>

          <div class="modal-footer">
            <button id="Consult_RateForm_Chosen" value="ConsultRateFormChosen" name="GroupDetailBotons" class="btn btn-default"  >Use option chosen</button>
            <button id="Consult_RateForm_MICE" value="ConsultRateFormMICE" name="GroupDetailBotons" class="btn btn-success">Use MICE Rates</button>
          </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->



<div class="modal fade" id="checkmiceratesmodal75pax" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">For the room number need use MICE rates  </h4>
      </div>

<%--        <div class="modal-body"><!-- Start modal body-->
          
            <div class="clear"></div>

        </div><!-- End modal body-->--%>

          <div class="modal-footer">
            
            <button id="Button2" value="ConsultRateFormMICE" name="GroupDetailBotons" class="btn btn-success">Use MICE Rates</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->



<div class="modal fade" id="checkmiceratesmodal40paxincentive" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">For the room number and group type are not rates available </h4>
      </div>

<%--        <div class="modal-body"><!-- Start modal body-->
          

        
            <div class="clear"></div>

        </div><!-- End modal body-->--%>

          <div class="modal-footer">
            <button id="Button1" class="btn btn-default" data-dismiss="modal" >Cancel</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->



