<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

                                          <h2>BreakDown</h2>

                                          <div class="balance-list-groups breack-down-list col-xs-12 col-sm-12 col-md-12 nopadding">
                                            <ul class="col-xs-12 col-sm-12 col-md-12 nopadding">
                                              <li class="bd-xs bd-sm bd-md bd-lg "> <span class="dp">12</span> <div class="deploy">-3 <i class="fa fa-caret-down"></i><br> <div class="txt-dploy">Deployment</div></div> <div class="title-number">No. Total Rooms</div></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">3</span><span class="title-number">Tentative Rooms</span></li>
                                    
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">6</span><span class="title-number">No. Adults</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">0</span><span class="title-number">No. Teen ages</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">0</span><span class="title-number">No. Childs</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">0</span><span class="title-number">No. Infants</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">$ 4,500</span><span class="title-number">Total Deposits</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">$ 45,500</span><span class="title-number">Balance</span></li>
                                              <li class="bd-xs bd-sm bd-md-12 bd-lg"><span class="number">$ 50,000</span><span class="title-number">Estimated Revenue </span></li>
                                            </ul>

                                          </div>

                                          <div>
                                            <h2> </h2>
                                            <div id="deploy-tool" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 deployment-tool-bar nopadding">

                                             <!--bloque uno-->
                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-5 "> 
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">No. Room<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                   <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">Tentative Rooms<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 ">Room Type
                                                    <select>
                                                        <option value="ms">Master Suite</option>
                                                        <option value="jrs"></i>JRS</option>
                                                      </select>
                                                  </div>

                                                  
                                              </div>
                                              <!--bloque dos-->
                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3 nopadding">
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">AD<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">TN<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">CH<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">INF<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  
                                              </div>
                                              <!--bloque tres-->
                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 ">
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-2">Plan
                                                    <select>
                                                      <option value="yes">ALL</option>
                                                        <option value="no"></i>NO</option>
                                                      </select>
                                                  </div>
                                                  <div id="filtrar-date"  class="col-xs-6 col-sm-6 col-md-6 col-lg-7 nopadding"><!--start date piker -->

                                                              <div class="container-date col-xs-6 col-sm-6 col-md-6 col-lg-6 nopadding">
                                                                <span class="txt-filter">Arrival Date</span>
                                                                  <div class='date-imput'>
                                                                      <div class="form-group">
                                                                          <div class='input-group date' id='datetimepicker1'>
                                                                              <input type='text' class="form-control" />
                                                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                              </span>
                                                                          </div>
                                                                      </div>
                                                                  </div>
                                                              </div>

                                                                <div class="container-date col-xs-6 col-sm-6 col-md-6 col-lg-6 nopadding">
                                                                    <span class="txt-filter">Departure Date</span>
                                                                      <div class='date-imput'>
                                                                          <div class="form-group">
                                                                            <div class='input-group date' id='datetimepicker2'>
                                                                                <input type='text' class="form-control" />
                                                                                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                </span>
                                                                            </div>
                                                                          </div>
                                                                      </div>
                                                                </div>
                                                      

                                                       <!--date piker script -->
                                                        <script type="text/javascript">
                                                            $(function () {
                                                                $('#datetimepicker1').datetimepicker();
                                                                $('#datetimepicker2').datetimepicker();
                                                                $("#datetimepicker1").on("dp.change", function (e) {
                                                                    $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
                                                                });
                                                                $("#datetimepicker2").on("dp.change", function (e) {
                                                                    $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
                                                                });
                                                            });
                                                        </script><!--date piker script -->

                                                        <div class="clear"></div>

                                                  </div><!--end date piker -->

                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-2 "> <button type="button" class="btn btn-success btn-deployment">Deployment</button></div>
                                                
                                              </div>

                                            </div>
                                          </div>


                                        <div id="toolbar-break">
                                                  <div class="bs-checkbox filter-check-all" >
                                                      <input id="custo-check" type="checkbox" name="btSelectAll">
                                                      <label class="check" for="custo-check"></label>
                                                  </div>
                                                  <span id="select-allselect-all">All</span>
                                                                                                      
                                                  <button id="new" class="btn btn-warning">Deposit</button>
                                                  <button id="new" class="btn btn-default"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <button id="new" class="btn btn-danger">Delete</button>
                                            </div>

                                          <table id="table"
                                               data-toggle="table"
                                               data-valign="middle"
                                               data-click-to-select="false"
                                               data-maintain-selected="true"
                                               data-toolbar="#toolbar-break"
                                               data-show-export="true"
                                               data-pagination="true"
                                               data-page-size="5"
                                               data-filter-control="true"
                                               data-page-list="[5, 10, 25, 50, 100, All]">
                                            <thead>
                                            <tr>
                                                <th data-checkbox="true"  data-switchable="false" class="opacity-0"></th>
                                                
                                                
                                                <th data-editable="false" data-field="Conf&nbsp;No" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Guest&nbsp;Name" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Room&nbsp;Type" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="AD" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="TN" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="CH" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="INF" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Check&nbsp;In" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Check&nbsp;Out" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="RN" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Status&nbsp;P" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Status&nbsp;R" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Total&nbsp;Deposit" data-filter-control="select"></th>
                                                
                                                <th data-editable="false" data-field="Estimated&nbsp;Revenue" data-filter-control="select"></th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                              <tr>
                                                <td>...</td>
                                               
                                                <td>00001</td>
                                                <td>Joel Alonso Jimenez Gamiño</td>
                                                <td>JR</td>
                                                <td>2</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>22/05/2015</td>
                                                <td>27/05/2015</td>
                                                <td>8</td>
                                                <td class="label-success">Paid</td>
                                                <td class="label-success">Confirmed</td>
                                                <td>$ 1500</td>
                                                
                                                <td>$ 5000</td>
                                              </tr>
                                              <tr>
                                                <td>...</td>
                                                
                                                
                                                <td>00002</td>
                                                <td>Joel Alonso Jimenez Gamiño</td>
                                                <td>JR</td>
                                                <td>2</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>22/05/2015</td>
                                                <td>27/05/2015</td>
                                                <td>8</td>
                                                <td class="label-success">Paid</td>
                                                <td class="label-success">Confirmed</td>
                                                <td>$ 1500</td>
                                               
                                                <td>$ 5000</td>
                                              </tr>
                                              <tr>
                                                <td>...</td>
                                               
                                               
                                                <td>00003</td>
                                                <td>Joel Alonso Jimenez Gamiño</td>
                                                <td>JR</td>
                                                <td>2</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>22/05/2015</td>
                                                <td>27/05/2015</td>
                                                <td>8</td>
                                                <td class="label-danger">Canceled</td>
                                                <td class="label-danger">Canceled</td>
                                                <td>$ 1500</td>
                                               
                                                <td>$ 5000</td>
                                              </tr>
                                              
                                              
                                                                                          
                                            </tbody>
                                             
                                          </table>
                                          <div class="clear"></div>