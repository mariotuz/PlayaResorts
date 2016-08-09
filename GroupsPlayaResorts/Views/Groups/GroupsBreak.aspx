<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Group</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--AMy css-->
    <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/mycss.css")%>">
    <link rel="stylesheet" type="text/css" href="<%: Url.Content("~/Content/normalize.css")%>">
    <!-- fonts awesome -->
    <link href="<%: Url.Content("~/Content/font-awesome.css")%>" rel="stylesheet">
    <!--Scroll-->
    <link href="<%: Url.Content("~/Content/scroll/fm.scrollator.jquery.css")%>" rel="stylesheet">

    <link href="<%: Url.Content("~/Content/normalize.css")%>" rel="stylesheet" type="text/css" >
    <link href="<%: Url.Content("~/Content/status.css")%>" rel="stylesheet" type="text/css" >
        <!-- Bootstrap -->
   <link href="<%: Url.Content("~/Content/bootstrap.min.css")%>" rel="stylesheet">
     <link href="<%: Url.Content("~/Content/table/bootstrap-table.css")%>" rel="stylesheet">
        <link href="<%: Url.Content("~/Content/select/bootstrap-select.css")%>" rel="stylesheet" >
     <link href="<%: Url.Content("~/Content/datepicker/bootstrap-datetimepicker.min.css")%>" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <!-- bootstrap -->
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%: Url.Content("~/Scripts/jquery.min.js")%>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
       <script src="<%: Url.Content("~/Scripts/bootstrap/bootstrap.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

    <script src="<%: Url.Content("~/Scripts/select/bootstrap-select.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/scroll/fm.scrollator.jquery.js")%>"></script>


    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/moment.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/transition.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/collapse.js")%>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Scripts/datepiker/bootstrap-datetimepicker.js")%>"></script>






</head>
<body>

  <div class="custom-tall">
      <div class="principal-bar">
            <div class="sidebar-brand">
              <a id="menu-toggle" href="#"> <h2><img src="img/logo_plr.gif"></h2> <span id="main_icon" class="glyphicon glyphicon-align-justify"></span></a>
            </div>
      </div>

      <div class="info-title">
          <h1><img src="img/icons/images/icon_group_title.png"> Group : <span>GPR0001</span></h1>
          <div class="info-group">
                <p>Date <span id="date"></span> </p>
                <p>Payment Status
                    <select class="select-status" style="font-family: 'FontAwesome';">
                      <option value="paid" data-iconurl="img/icons/paid_pay.png">Paid</option>
                      <option value="Noconfirmed" data-iconurl="img/icons/paid_noconfirm.png">No confirm</option>
                      <option value="Cancelled" data-iconurl="img/icons/paid_cancel.png">Cancelled</option>
                      <option value="Cancelled" data-iconurl="img/icons/paid_transferred.png">transferred</option>
                    </select>
                </p>
                <p>Sales Status
                    <select class="select-status">
                       <option value="paid" data-iconurl="img/icons/sale_pay.png">Paid</option>
                      <option value="Noconfirmed" data-iconurl="img/icons/sale_noconfirm.png">No confirm</option>
                      <option value="Cancelled" data-iconurl="img/icons/sale_cancel.png">Cancelled</option>
                      <option value="Cancelled" data-iconurl="img/icons/sale_transferred.png">Transferred</option>
                    </select>
                </p>
                <div id="save-btn"><button type="button" id="save">Save <i class="fa fa-angle-right"></i></button></div>
          </div>
      </div>
  </div><!--end header-->

<div id="wrapper" class="active minheight">
      
            <!-- Sidebar -->
            <div id="sidebar-wrapper" class="scroll">
                <ul id="sidebar_menu" class="sidebar-nav">
                  <li class="md-toolbar-tools white">
                    <div class="scare-name">DN</div>
                    <span>Daniela Navarrete</span>
                  </li>
                </ul>

                <ul class="sidebar-nav" id="sidebar"><!-- Menu content -->     
                  <li><a><span><img src="img/icons/images/groups_off.png"/></span>Groups<span class="badge">4</span></a></li>
                  <li><a><span><img src="img/icons/images/events_off.png"/> </span>Events<span class="badge">4</span></a></li>
                  <li><a><span><img src="img/icons/images/payments_off.png"/> </span>Payments<span class="badge">4</span></a></li>
                  <li><a><span><img src="img/icons/images/cataloge_off.png"/> </span>Catalogs<span class="badge">4</span></a></li>
                  <li><a><span><img src="img/icons/images/profile_off.png"/> </span>Profiles<span class="badge">4</span></a></li>
                </ul>
            </div><!--end Sidebar-->


              <!-- Start Page content -->
            <div id="page-content-wrapper">

                    <!-- Keep all page content within the page-content inset div! -->

                    <!--Start page content wrapper-->
                    <div class="page-content inset">

                        <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start tabpanel-->

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab">
                                  <li role="presentation"><a href="#generalview" aria-controls="generalview" role="tab" data-toggle="tab">General View</a></li>
                                  <li role="presentation"><a href="#documents" aria-controls="documents" role="tab" data-toggle="tab">Documents/formats</a></li>
                                  <li role="presentation"><a href="#events" aria-controls="events" role="tab" data-toggle="tab">Events</a></li>
                                  <li role="presentation" class="active"><a href="#break" aria-controls="break" role="tab" data-toggle="tab">Breackdown</a></li>
                                  <li role="presentation"><a href="#payment" aria-controls="pay" role="tab" data-toggle="tab">Payments</a></li>
                                  <li role="presentation"><a href="#log" aria-controls="log" role="tab" data-toggle="tab">LogBook</a></li>
                                </ul>
                                <!-- Nav tabs -->
              
                                              
                                <div class="tab-content minheight-tab" ><!-- Tab content -->


                                    <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="generalview">
                                      General view
                                    </div>


                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="documents">
                                        Documents & formats
                                      </div>
                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="events">
                                        events
                                      </div>

                                      <!--Start breakdown section-->
                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in active" id="break">
                                          <h2>BreackDown</h2>

                                          <div class="balance-list-groups breack-down-list col-xs-12 col-sm-12 col-md-12 nopadding">
                                            <ul class="col-xs-12 col-sm-12 col-md-12 nopadding">
                                              <li class="bd-xs bd-sm bd-md bd-lg "> <span class="dp">12</span> <div class="deploy">-5 <i class="fa fa-caret-down"></i><br> <div class="txt-dploy">Deployment</div></div> <div class="title-number">No.total Rooms</div></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">5</span><span class="title-number">Teantative Rooms</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">5</span><span class="title-number">No. Deploymnets</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">20</span><span class="title-number">No. Adults</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">0</span><span class="title-number">No. Junior</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">0</span><span class="title-number">No. Infant</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">$ 10,000</span><span class="title-number">Total Of Deposits</span></li>
                                              <li class="bd-xs bd-sm bd-md bd-lg "><span class="number">$ 10,000</span><span class="title-number">Total Cost</span></li>
                                              <li class="bd-xs bd-sm bd-md-12 bd-lg"><span class="number">$ 10,000</span><span class="title-number">Balance</span></li>
                                            </ul>

                                          </div>

                                          <div>
                                            <h2>hotel Grancaribe</h2>
                                            <div id="deploy-tool" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 deployment-tool-bar nopadding">

                                             <!--bloque uno-->
                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-5 "> 
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">No.Room<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                   <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">Tentative Rooms<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 ">Room Type
                                                    <select>
                                                        <option value="ms">Master Suite</option>
                                                        <option value="jrs"></i>JRS</option>
                                                      </select>
                                                  </div>

                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">VIP Guest
                                                    <select>
                                                      <option value="yes">YES</option>
                                                        <option value="no"></i>NO</option>
                                                      </select>
                                                  </div>

                                                  
                                              </div>
                                              <!--bloque dos-->
                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3 nopadding">
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">AD<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">TN<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">INF<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
                                                  <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 nopadding">CH<input type="number" class="form-control" placeholder="0" aria-label="..."></div>
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
                                                                <span class="txt-filter">arrival</span>
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
                                                                    <span class="txt-filter">Deperture</span>
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


                                           <div id="toolbar">
                                                  <div class="bs-checkbox filter-check-all" >
                                                      <input id="custo-check" type="checkbox" name="btSelectAll">
                                                      <label class="check" for="custo-check"></label>
                                                  </div><span id="select-allselect-all">All</span>
                                                                                                      
                                                  <button id="new" class="btn btn-warning">Deposit group</button>
                                                  <button id="new" class="btn btn-default"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                  <button id="new" class="btn btn-danger">Delete</button>
                                            </div>

                                          <table id="table"
                                               data-toggle="table"
                                               data-valign="middle"
                                               data-click-to-select="false"
                                               data-maintain-selected="true"
                                               data-toolbar="#toolbar"
                                               data-show-export="true"
                                               data-pagination="true"
                                               data-page-size="5"
                                               data-filter-control="true"
                                               data-page-list="[5, 10, 25, 50, 100, All]">
                                            <thead>
                                            <tr>
                                                <th data-checkbox="true"  data-switchable="false" class="opacity-0"></th>
                                                <th data-editable="false" data-field="Deposit"></th>
                                                <th data-editable="false" data-field="VIP" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Conf&nbsp;No" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Guest&nbsp;Name" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Room&nbsp;Type" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="AD" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="TN" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="INF" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="CH" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Check&nbsp;In" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Check&nbsp;Out" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="RN" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Status&nbsp;P" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Status&nbsp;R" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Total&nbsp;Paid" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Observations" data-filter-control="select"></th>
                                                <th data-editable="false" data-field="Room_USD" data-filter-control="select"></th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                              <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>
                                              <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>
                                              <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                                <td class="label-danger">Canceled</td>
                                                <td class="label-danger">Canceled</td>
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>
                                               <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                                <td class="label-danger">Canceled</td>
                                                <td class="label-danger">Canceled</td>
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>
                                               <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                                <td class="label-warning">No Confirmed</td>
                                                <td class="label-warning">No Confirmed</td>
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>
                                               <tr>
                                                <td>...</td>
                                                <td><button type="button" class="btn btn-warning">Deposit</button></td>
                                                <td>YEZ</td>
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
                                               <td class="label-warning">No Confirmed</td>
                                                <td class="label-warning">No Confirmed</td>
                                                <td>$ 150</td>
                                                <td>Nota 1</td>
                                                <td>$ 200</td>
                                              </tr>                                                      
                                            </tbody>
                                             
                                          </table>

                                      </div>
                                      <!--Start breakdown section-->

                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="payment">
                                        payments
                                      </div>
                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="log">
                                        logbook
                                      </div>

                                </div><!--End tab content-->
                        </div><!-- End Tabpael -->
                    </div>
                    <!--end page content wrapper-->

            </div><!-- end Page content-->
      
</div><!--end wrapper-->



          <!--bootstrap table part 2-->
 <!--bootstrap table part 2-->
    <script src="<%: Url.Content("~/Scripts/table/extensions/export/bootstrap-table-export.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/export.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jquery.base64.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/tableExport.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/html2canvas.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jspdf.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/export/jspdf.plugin.autotable.js")%>"></script>


    <!--<script src="//rawgit.com/hhurz/tableExport.jquery.plugin/master/jquery.base64.js"></script>-->
    <script src="<%: Url.Content("~/Scripts/table/extensions/resizable/bootstrap-table-resizable.min.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/table/locals/bootstrap-table-en-US.min.js")%>"></script><!-- put your locale files after bootstrap-table.js -->

    <script type="text/javascript">
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("active");
        });
    </script>

    <script type="text/javascript">
        $('.scroll').scrollator();
    </script>

    <script>
        var d = new Date();
        document.getElementById("date").innerHTML = d.toDateString();
    </script>

    <!--select whith icons-->
 
   <script src="<%: Url.Content("~/Scripts/select/select-icons.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/select/selectboxit.js")%>"></script>
    <script>
        $(function () {
            var selectBox = $(".select-status").selectBoxIt();
        });
    </script>

    <script type="text/javascript" src="<%: Url.Content("~/Scripts/add/add_items.js")%>"></script>

</body>
</html>
