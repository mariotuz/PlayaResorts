<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<script type="text/javascript">
    function NextInput(e, _elemento, _eValid, _nextElemento) {
        var tecla = (document.all) ? e.keyCode : e.which;
        var $elemento = $(_elemento);

        if (tecla == 13) {
            e.preventDefault();
            var valueElement = $elemento.closest("tr").nextAll(':has(.' + _eValid + '):first').find('.' + _eValid).focus().select().val();

            if (valueElement != '' && !valueElement) {
                if (_nextElemento) {
                    var valueElement2 = $("." + _nextElemento + ":first").focus().select().val();

                    if (valueElement2 != '' && !valueElement2) {
                        bootbox.confirm("Do you want to calculate revenue?", function (result) {
                            if (result == true) {
                                $('#ConsultRevenue').click();
                            }
                        });
                    }
                } else {
                    bootbox.confirm("Do you want to calculate revenue?", function (result) {
                        if (result == true) {
                            $('#ConsultRevenue').click();
                        }
                    });
                }
            }
        }
    }

    $("#selectratetype").change(function () {

        $("#ConsultRevenue").click();

    });

    $(document).ready(function () {

        $('#ConsultRevenue').on('click', function (e) {
            formValida = 'rates';

            var totHabitaciones = 0;

            $('.numhabitaciones').each(function () {
                var $elemento = $(this);
                totHabitaciones = totHabitaciones + parseInt($elemento.val());
            });

            if (totHabitaciones > $('#numberpax').val() || totHabitaciones < $('#numberpax').val()) {
                e.preventDefault();

                if (totHabitaciones > $('#numberpax').val()) {
                    var msg = i18n['msgExceeds'];
                } else {
                    var msg = i18n['msgLess'];
                }

                bootbox.dialog({
                    message: i18nF(i18n["msgNumHabitaciones"], msg),
                    buttons: {
                        buttonNo: {
                            label: i18n['btnCancel'],
                            className: 'btn-primary'
                        },
                        buttonYes: {
                            label: i18n['btnOk'],
                            className: 'btn-gray',
                            callback: function () {
                                $('#numberpax').val(totHabitaciones);
                                $('#ConsultRevenue').click();
                            }
                        }
                    }
                });
            }
        });

        $(".StartAvailability").click(function () {

            $("#SuiteAvailability").val($(this).attr("href"));
            $("#HotelAvailability").val($("#HotelSelect").val());
            $("#CheckinAvailability").val($("#datetimepicker6text").val());
            $("#CheckoutAvailability").val($("#datetimepicker7text").val());
            $("#AgencyAvailability").val($("#WhosaleDetail").val());
            $('#LabelSuiteAvailability').text($(this).attr("href"));

            //alert(value);
            $("#ConsultAvailability").click();

        });


    });

</script>



<%  If Model.Accion = 12 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $('#checkmiceratesmodal40paxincentive').modal('show');

          $("#form-grouphead").removeClass("active");
          $("#form-group").removeClass("active");

          $("#form-grouphead-info").removeClass("disabledTab");
          $("#form-group-info").removeClass("disabledTab");

          $("#rateshead").removeClass("disabledTab");
          $("#rates").removeClass("disabledTab");

          $("#payshead").removeClass("disabledTab");
          $("#pays").removeClass("disabledTab");

          $("#rateshead").addClass("active");
          $("#rates").addClass("active");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion = 11 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $('#checkmiceratesmodal75pax').modal('show');

          $("#form-grouphead").removeClass("active");
          $("#form-group").removeClass("active");

          $("#form-grouphead-info").removeClass("disabledTab");
          $("#form-group-info").removeClass("disabledTab");

          $("#rateshead").removeClass("disabledTab");
          $("#rates").removeClass("disabledTab");

          $("#payshead").removeClass("disabledTab");
          $("#pays").removeClass("disabledTab");

          $("#rateshead").addClass("active");
          $("#rates").addClass("active");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion = 10 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $('#checkmiceratesmodal').modal('show');

          $("#form-grouphead").removeClass("active");
          $("#form-group").removeClass("active");

          $("#form-grouphead-info").removeClass("disabledTab");
          $("#form-group-info").removeClass("disabledTab");

          $("#rateshead").removeClass("disabledTab");
          $("#rates").removeClass("disabledTab");

          $("#payshead").removeClass("disabledTab");
          $("#pays").removeClass("disabledTab");

          $("#rateshead").addClass("active");
          $("#rates").addClass("active");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion = 9 Then %>

  <script type="text/javascript">
      $(document).ready(function () {


          var str = "<%:Model.GroupCheckExist%>";
          var res = str.split(",");

          var i;

          var idresults = "";

          for (i = 0 ; i < res.length - 1; i++) {

              idresults += '<a  target="_blank" href="<%: Url.Content("~/Groups/GroupDetail")%>?id=' + res[i] + '" class="btn btn-default" ><%:Model.GroupHotelNew + "000"%>' + res[i] + '</a>  ';
          }

          $('#existgroupmodalids').html(idresults);

          $('#existgroupmodal').modal('show');

          $("#form-grouphead-info").addClass("active");
          $("#form-group-info").addClass("active");

          $("#rateshead").removeClass("active");
          $("#rates").removeClass("active");


          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#editbreakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#breakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $("#grupohotelevents").val("<%:Model.GroupIdLabel%>");



          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion=1 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $('#existgroupmodal').modal('hide');

          $("#form-grouphead-info").addClass("active");
          $("#form-group-info").addClass("active");

          $("#rateshead").removeClass("active");
          $("#rates").removeClass("active");

          $('#grupoidlabel').html("<%:Model.GroupHotelNew + "000"+ Model.GroupId.ToString%>");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#editbreakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#breakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $("#grupohotelevents").val("<%:Model.GroupIdLabel%>");


          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion=2 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $('#checkmiceratesmodal').modal('hide');
          $('#checkmiceratesmodal75pax').modal('hide');
          $('#checkmiceratesmodal40paxincentive').modal('hide');

          $("#form-grouphead").removeClass("active");
          $("#form-group").removeClass("active");

          $("#form-grouphead-info").removeClass("disabledTab");
          $("#form-group-info").removeClass("disabledTab");

          $("#rateshead").removeClass("disabledTab");
          $("#rates").removeClass("disabledTab");

          $("#payshead").removeClass("disabledTab");
          $("#pays").removeClass("disabledTab");

          $("#rateshead").addClass("active");
          $("#rates").addClass("active");

          //alert($("#grupoidlabeltext").value);

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          console.info("<%:Model.GroupId%>");

          if ($("#grupoidlabeltext").val() == "0" || $("#grupoidlabeltext").val() == 0 || $("#grupoidlabeltext").val() == "") {

              $('#grupoidlabel').html("<%:Model.GroupHotelNew + "000"+ Model.GroupId.ToString%>");
          }

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>


<%  If Model.Accion = 3 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $("#form-grouphead-info").removeClass("disabledTab");
          $("#form-group-info").removeClass("disabledTab");

          $("#rateshead").removeClass("disabledTab");
          $("#rates").removeClass("disabledTab");

          $("#payshead").removeClass("disabledTab");
          $("#pays").removeClass("disabledTab");

          $('#grupoidlabel').html("<%:Model.GroupHotelNew + "000" + Model.GroupId.ToString%>");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#editbreakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#breakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $("#grupohotelevents").val("<%:Model.GroupIdLabel%>");

      });

     </script>

<%  End If%>


<%  If Model.Accion=4 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#editbreakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#breakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $("#grupohotelevents").val("<%:Model.GroupIdLabel%>");

      });

     </script>

<%  End If%>

<%  If Model.Accion=5 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          //$("#form-grouphead-info").addClass("active");
          //$("#form-group-info").addClass("active");

          //$("#rateshead").removeClass("active");
          //$("#rates").removeClass("active");

          $('#grupoidlabel').html("<%:Model.GroupHotelNew + "000"+ Model.GroupId.ToString%>");

          $("#grupoidlabeltext").val("<%:Model.GroupId%>");

          $("#grupoiddoc").val("<%:Model.GroupId%>");

          $("#grupoiddocupdate").val("<%:Model.GroupId%>");

          $("#grupoiddocupload").val("<%:Model.GroupId%>");

          $("#grupoidbreakdown").val("<%:Model.GroupId%>");

          $("#grupoidbreakdowngroupby").val("<%:Model.GroupId%>");

          $("#editbreakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#breakdownhotel").val("<%:Model.GroupIdLabel%>");

          $("#grupoidlogbook").val("<%:Model.GroupId%>");

          $("#grupoidpayments").val("<%:Model.GroupId%>");

          $("#grupoidevents").val("<%:Model.GroupId%>");

          $("#grupoidstatus").val("<%:Model.GroupId%>");

          $("#grupohotelevents").val("<%:Model.GroupIdLabel%>");


          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>




                                                                    <div id="rate-special">
                                                        
                                                                          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span><small>Percentage Discount Rate</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                              <input type="text" id="DiscountRate" name="DiscountRate" value="<%:Model.EditGroupData7%>" class="form-control input-custom corners-inputs"  >
                                                                            </div>
                                                                          </div>


                                                                          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span><small>Commission Agency</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                             <%-- <input type="text" id="ComissionAgency" name="ComissionAgency" value="0" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                                                 <select class="selectpicker" id="ComissionAgency" name="ComissionAgency" data-width="100%">

                                                                                      <option  <% If model.EditGroupData34 = "0" Then%> selected <% End if%> value="0">N/A</option>
                                                                                      <option  <% If Model.EditGroupData34 = "2" Then%> selected <% End if%> value="2">5 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "3" Then%> selected <% End if%> value="3">6 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "4" Then%> selected <% End if%> value="4">7 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "5" Then%> selected <% End if%> value="5">8 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "6" Then%> selected <% End if%> value="6">9 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "1" Then%> selected <% End if%> value="1">10 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "7" Then%> selected <% End if%> value="7">11 %</option>
                                                                                      <option  <% If Model.EditGroupData34 = "8" Then%> selected <% End if%> value="8">12 %</option>
                                                                               
                                                                                 </select>
                                                                            </div>
                                                                          </div>

                                                                          <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group">
                                                                              <span><small>Rate Type <span class="instrucions">(Choose one rate to recalculate)</span></small></span>
                                                                               <select class="selectpicker" id="selectratetype" name="selectratetype" data-width="100%">

                   
                                                                                  <option  <% If Model.GroupTypeRate = "4" Then%> selected <% End if%> value="4">Modelo de Compensacion</option>
                                                                                  <option  <% If Model.GroupTypeRate = "5" Then%> selected <% End if%> value="5">MICE</option>
                                                                                  <option  <% If Model.GroupTypeRate = "2" Then%> selected <% End if%> value="2">Tarifario Manual</option>
                                                                                  <option  <% If Model.GroupTypeRate = "3" Then%> selected <% End if%> value="3">Tarifario Semiautomatico</option>
                                                                                  <option  <% If Model.GroupTypeRate = "1" Then%> selected <% End if%> value="1">Tarifario</option>
                                                                                  
                                                                                </select>
                                                                          </div>





                                                                         <% If Model.GroupTypeRate = "6" Then%>

                                                                         <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span><small> Current Promo (%)</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                              <input type="text" id="CurrentPromo" name="CurrentPromo" value="0" class="form-control input-custom corners-inputs" placeholder="" >
                                                                            </div>
                                                                          </div>

                                                                 


                                                                         <% End if %>
                                                                        
                                                                        <%--  <button id="ConsultRate" value="Consult Rate" name="GroupDetailBotons" class="btn btn-gray" style="margin-top: 17px;">Consult Rate</button>--%>
                                                                          
                                                                        
                                                                            
                                                                          <div class="right">
                                                                              
                                                                              <button  id="ConsultRevenue" value="Consult_Revenue" name="GroupDetailBotons" class="btn btn-gray" style="margin-top: 17px;">Calculate Revenue</button>

                                                                          </div>
                                                                    </div>
                                                                    <div class="clear"></div><br>
                                                                    <!-- Nav tabs  promos-->



<input type="text" id="grupoidlabeltext" name="grupoidlabeltext" hidden value="0"   >



<% If Model.GroupTypeRate = 4 Or Model.GroupTypeRate = 5 Or Model.GroupTypeRate = 2 Or Model.GroupTypeRate = 3 Then%>



    <%If Model.ListGroupRatesin.Count = 0 Then%>


                <h2> RATES NOT AVAILABLE </h2>
        
    <%Else%> 

            <ul class="nav nav-tabs nav-justified dual-select" role="tablist" >

                <% 
        
                    Dim z As Integer
                    Dim j As Integer
                    Dim i As Integer = 0
                    Dim Date1 As Date 
                    Dim Date2 As Date
                    Dim Commission As String
                    Dim Discount As String
        
        
        
                    For z = 0 To Model.ListGroupRatesin.Count - 1
            
                        If Date1 <> Model.ListGroupRatesin.Item(z).InitDateRate Or z = 0 Then
                
                            Date1 = Model.ListGroupRatesin.Item(z).InitDateRate
                            Date2 = Model.ListGroupRatesin.Item(z).EndDateRate
                            Commission = Model.ListGroupRatesin.Item(z).CommissionRate
                            Discount = Model.ListGroupRatesin.Item(z).DiscountRate
                
                            If Model.GroupTypeRate = 5 Or Model.GroupTypeRate = 2 Or Model.GroupTypeRate = 3 Then
                                If z = 0 Then
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 active""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ")</a></li>")
                                Else
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 ""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + " )</a></li>")
                                End If
                            Else
                                
                                If z = 0 Then
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 active""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ", C:" + FormatNumber(Commission, 2, , , TriState.True) + " ,P: " + FormatNumber(Discount, 2, , , TriState.True) + ")</a></li>")
                                Else
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 ""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ", C:" + FormatNumber(Commission, 2, , , TriState.True) + " ,P: " + FormatNumber(Discount, 2, , , TriState.True) + ")</a></li>")
                                End If
                                
                            End If
                
                            i = i + 1
                        End If
                
                
                    Next
                  
                %>

      
                                                                     
            </ul>


            <!-- Tab panes -->
            <div class="tab-content scroll-x">


                 <% 
         
        
                     i = 0
         
       
                     For j = 0 To Model.ListGroupRatesin.Count - 1
             
                         If Date1 <> Model.ListGroupRatesin.Item(j).InitDateRate Or j = 0 Then
                 
                 
                             If j <> 0 Then
                 
                                 Response.Write("<tr class=""no-hover""> <td></td> <td></td><td></td><td></td>  <td></td> <td></td> <td></td> <td></td> <td></td>")
             
                                 Response.Write("<td class=""rate-total"">Total Price</td>")
             
                                 Response.Write("<td class=""rate-price"">$ " + FormatNumber(Math.Ceiling(Model.RevenueFinal), 0, , , TriState.True) + "</td>")
             
                                 Response.Write("</tr>  </tbody> </table> </div>   </div><!--first tab--> ")
                 
                             End If
                 
                             Date1 = Model.ListGroupRatesin.Item(j).InitDateRate
                 
                             If j = 0 Then
                                 Response.Write("<div role=""tabpanel"" class=""tab-pane active "" id=""promotion-" + i.ToString + """ style="" min-width:1077px; ""><!--first tab-->")
                             Else
                                 Response.Write("<div role=""tabpanel"" class=""tab-pane  "" id=""promotion-" + i.ToString + """ style="" min-width:1077px; ""><!--first tab-->")
                             End If
             
             
                             Response.Write("<div class=""header-fixed"" data-ng-controller=""rates"" >")
             
                             Response.Write("<table class=""table"">")
             
                             Response.Write("<thead class=""theadtarifas"" >")
             
                             Response.Write("<tr>")
             
                             Response.Write("<th >Type of Suite <div>Type of Suite</div></th>")
                             Response.Write("<th >Number of Rooms <div>Number of Rooms</div></th>")
                             Response.Write("<th >Availability <div>Availability</div></th>")
                             'Response.Write("   <th >Code <div>Code</div></th>")
                             Response.Write("<th >Single <div>Single</div></th>")
                             Response.Write("<th >Double <div>Double</div></th>")
                             Response.Write("<th >3th & 4th <div>3th & 4th</div></th>")
                             Response.Write("<th >Teenagers <div>Teenagers</div></th>")
                             Response.Write("<th >Childs <div>Childs</div></th>")
                             Response.Write("<th >Room Night <div>Room Night</div></th>")
                             Response.Write("<th >Rate Per Room <div>Rate Per Room</div></th>")
                             Response.Write("<th>Total Price <div>Total Price</div></th>")
                             Response.Write("</tr>")
                             Response.Write("</thead>")
                             Response.Write("<tbody>")
                 
        
                             i = i + 1
                 
                 
                         End If
             
                         If Model.ListGroupRatesin.Item(j).Availability = "Available" Then
                             Response.Write("<tr>")
                         Else
                         
                             Response.Write("<tr class=""disable"" >")
                         End If
                    
                 
                         Response.Write("<td>")
                         Response.Write(Model.ListGroupRatesin.Item(j).SuiteCode)
                         Response.Write("</td>")
                     
                         Response.Write("<td style=""width:160px"">")
                         Response.Write("<div class=""input-group  btn-group col-xs-4"" style=""width:100px"">")
                     
                         If Model.ListGroupRatesin.Item(j).Availability = "Available" and i = 1 Then
                         
                             Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs numhabitaciones"" value=""" + Model.ListGroupRatesin.Item(j).RatePax.ToString + """ name=""List_Pax" + i.ToString + """ placeholder=""0"" style=""text-align: center !important;"" data-validacion=""numero"" onkeypress=""NextInput(event,this,'numhabitaciones','doublehabs');"" onblur=""_Validaciones.ValidaCampo(this);"">")
                 
                             If i = 1 Then
                                 Response.Write("<input type=""text""  value=""" + Model.ListGroupRatesin.Item(j).SuiteCode.ToString + """ name=""List_Suites"" placeholder=""0"" hidden  >")
                             End If
                 
                         Else
                         
                             Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs"" value=""" + Model.ListGroupRatesin.Item(j).RatePax.ToString + """ name=""List_Pax" + i.ToString + """ placeholder=""0"" style=""text-align: center !important;"" disabled=""disabled"" >")
                         End If
                     
            
                    
                         Response.Write("</div>")
                         Response.Write("</td>")
                    
                         Response.Write("<td>")
                         Response.Write(" <a class=""btn btn-primary StartAvailability"" href=""#" + Model.ListGroupRatesin.Item(j).SuiteCode.ToString + """  >View</a>")
                         Response.Write("</td>")
                    
                         'Response.Write("<td>")
                         'Response.Write(Model.ListGroupRatesin.Item(j).SuiteCode)
                         'Response.Write("</td>")
                    
                         Response.Write("<td>")
                 
                         If Model.ListGroupRatesin.Item(j).RateSingle = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateSingle), 0, , , TriState.True))
                         End If
                 
                         Response.Write("</td>")
                     
                         Response.Write("<td style=""max-width:160px"">")
                 
                         If Model.GroupTypeRate = 2 Or Model.GroupTypeRate = 3 Then
                         
                             Response.Write("<div class=""input-group  btn-group col-xs-4"" style=""width:100px"" >")
                         
                                 
                             Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs doublehabs"" value=""" + FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateDouble), 0, , , TriState.True).Replace(",", "").ToString + """ name=""List_DoubleRate"" placeholder=""0"" style=""text-align: center !important;"" onkeypress=""NextInput(event,this,'doublehabs');"">")
                                    
                         
                             Response.Write("</div>")
                             
                             
                        
                         Else
                             
                             If Model.ListGroupRatesin.Item(j).RateDouble = 0 Then
                                 Response.Write("N/A")
                             Else
                                 Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateDouble), 0, , , TriState.True))
                             End If
                             
                         End If
                 
                         Response.Write("</td>")
                     
                         Response.Write("<td>")
                 
                         If Model.ListGroupRatesin.Item(j).RateTripleandFour = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateTripleandFour), 0, , , TriState.True))
                         End If
                
                         Response.Write("</td>")
                     
                     
                         Response.Write("<td>")
                 
                         If Model.ListGroupRatesin.Item(j).RateTeensValue = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateTeensValue), 0, , , TriState.True))
                         End If
                 
                         Response.Write("</td>")
                     
                         Response.Write("<td>")
                 
                         If Model.ListGroupRatesin.Item(j).RateChildrens = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateChildrens), 0, , , TriState.True))
                         End If
             
                         Response.Write("</td>")
                    
                         Response.Write("<td >")
                    
                         Response.Write(FormatNumber( Math.Ceiling(Model.ListGroupRatesin.Item(j).RateDouble) *2, 0, , , TriState.True))
                         Response.Write("</td>")
             
                         Response.Write("</td>")
                    
                         Response.Write("<td>")
                    
                         Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateRevenuePerRoom), 0, , , TriState.True))
                         Response.Write("</td>")
                 
                         Response.Write("</td>")
                    
                         Response.Write("<td class=""rate-price"">")
                    
                         Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateRevenue), 0, , , TriState.True))
                         Response.Write("</td>")
                  
                    
                         Response.Write("</tr>")
             
            
                     Next
         
         
                     Response.Write("<tr class=""no-hover""> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>")
             
                     Response.Write("<td class=""rate-total"">Total Price</td>")
             
                     Response.Write("<td class=""rate-price"">$ " + FormatNumber(Math.Ceiling(Model.RevenueFinal), 0, , , TriState.True) + "</td>")
             
                     Response.Write("</tr>  </tbody> </table> </div>   </div><!--first tab--> ")
                
  
                     %>
                                                                                                                         

               </div><!-- Ende Nav tabs  promos-->


    <%End If%>


<% End If%>



<% If Model.GroupTypeRate = 1  Then%>


<ul class="nav nav-tabs nav-justified dual-select" role="tablist" >
                  <li role="presentation" class=" col-xs-4 col-md-4 active"><a href="#promotion-0" aria-controls="rates" role="tab" data-toggle="tab">Rate 1</a></li>
                 <%-- <li role="presentation" class=" col-xs-4 col-md-4"><a href="#promotion-two" aria-controls="pays" role="tab" data-toggle="tab">Rate 2</a></li>--%>
                                                                     
</ul>


                                                                    <!-- Tab panes -->
                                                                    <div class="tab-content scroll-x">
                                                                          <div role="tabpanel" class="tab-pane active " id="promotion-0" style=" min-width:1077px; "><!--first tab-->

                                                                                  <div class="header-fixed" data-ng-controller="rates" >

                                                                                      <table class="table">
                                                                                          <thead class="theadtarifas" >
                                                                                            <tr>
                                                                                              <th >Type of Suite <div>Type of Suite</div></th>
                                                                                              <th >Number of Rooms <div>Number of Rooms</div></th>
                                                                                              <th >Availability <div>Availability</div></th>
                                                                                              <th >Code <div>Code</div></th>
                                                                                              <th >Single <div>Single</div></th>
                                                                                              <th >Double <div>Double</div></th>
                                                                                              <th >3th & 4th <div>3th & 4th</div></th>
                                                                                              <th >Teenagers <div>Teenagers</div></th>
                                                                                              <th >Childs <div>Childs</div></th>
                                                                                              <th>Total Price <div>Total Price</div></th>
                                                                                            </tr>
                                                                                          </thead>
                                                                                          <tbody>
                                                                                            
                                                                                 
             <% 
                 
                 
                 
                 
                 'Response.Write("   <th >Type of Suite <div>Type of Suite</div></th>")
                 'Response.Write("   <th >Number of Rooms <div>Number of Rooms</div></th>")
                 'Response.Write("   <th >Availability <div>Availability</div></th>")
                 ''Response.Write("   <th >Code <div>Code</div></th>")
                 'Response.Write("   <th >Single <div>Single</div></th>")
                 'Response.Write("    <th >Double <div>Double</div></th>")
                 'Response.Write("    <th >3th & 4th <div>3th & 4th</div></th>")
                 'Response.Write("    <th >Teenagers <div>Teenagers</div></th>")
                 'Response.Write("  <th >Childs <div>Childs</div></th>")
                 'Response.Write("  <th >Room Night <div>Room Night</div></th>")
                 'Response.Write("  <th >Rate Per Room <div>Rate Per Room</div></th>")
                 'Response.Write("  <th>Total Price <div>Total Price</div></th>")
                 
                Dim i As Integer
                
   
                 For i = 0 To Model.ListGroupRatesin.Count - 1
                     
                     If Model.ListGroupRatesin.Item(i).Availability = "Available" Then
                         Response.Write("<tr>")
                     Else
                         
                          Response.Write("<tr class=""disable"" >")
                     End If
                    
                    
                     Response.Write("<td>")
                     Response.Write(Model.ListGroupRatesin.Item(i).SuiteCode)
                     Response.Write("</td>")
                     
                     Response.Write("<td>")
                     Response.Write("<div class=""input-group  btn-group col-xs-4"">")
                     
                     If Model.ListGroupRatesin.Item(i).Availability = "Available" Then
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs numhabitaciones"" value=""" + Model.ListGroupRatesin.Item(i).RatePax.ToString + """ name=""List_Pax"" placeholder=""0"" style=""text-align: center !important;"" >")
                     Else
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs"" value=""" + Model.ListGroupRatesin.Item(i).RatePax.ToString + """ name=""List_Pax"" placeholder=""0"" style=""text-align: center !important;"" disabled=""disabled"" >")
                     End If
                     
                    
                     Response.Write("</div>")
                     Response.Write("</td>")
                    
                     Response.Write("<td>")
                     
                     If Model.GroupTypeRate = 2 or Model.GroupTypeRate = 3 Then
                         Response.Write(" <button type=""button"" class=""btn btn-primary"" disabled data-toggle=""modal"" data-target=""#modalPeriodos"">View</button>")
                     Else
                         
                         Response.Write(" <button type=""button"" class=""btn btn-primary"" data-toggle=""modal"" data-target=""#modalPeriodos"">View</button>")
                         
                     End If
                   
                     Response.Write("</td>")
                    
                     Response.Write("<td>")
                     Response.Write(Model.ListGroupRatesin.Item(i).SuiteCode)
                     Response.Write("</td>")
                    
                     Response.Write("<td>")
                     
                     Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateSingle), 0, , , TriState.True))
                     Response.Write("</td>")
                     
                     Response.Write("<td>")
                     
                     If Model.GroupTypeRate = 2  or Model.GroupTypeRate = 3 Then
                         
                         Response.Write("<div class=""input-group  btn-group col-xs-4"">")
                         
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs"" value=""" + Model.ListGroupRatesin.Item(i).RateDouble.ToString + """ name=""List_DoubleRate"" placeholder=""0"" style=""text-align: center !important;"" >")
                         
                         Response.Write("</div>")
                 
                     End If
                     
                     
                     If Model.GroupTypeRate = 1  Then
                         
                         
                         Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateDouble), 0, , , TriState.True))
                      
                         
                         
                     End If
                     
                    
                     Response.Write("</td>")
                     
                     Response.Write("<td>")
                     Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateTripleandFour) , 0, , , TriState.True))
                     Response.Write("</td>")
                     
                     
                     Response.Write("<td>")
                     Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateChildrens), 0, , , TriState.True))
                     Response.Write("</td>")
                     
                     Response.Write("<td>")
                   
                     Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateTeensValue), 0, , , TriState.True))
                     Response.Write("</td>")
                    
                     Response.Write("<td class=""rate-price"">")
                    
                     Response.Write(FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(i).RateRevenue), 0, , , TriState.True))
                     Response.Write("</td>")
                  
                    
                     Response.Write("</tr>")
                 Next
                
                %>
                                                                                    
                                                                                            <tr class="no-hover">
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td ></td>
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td class="rate-total">Total Price</td>
                                                                                              <td class="rate-price">$ <%:FormatNumber(Math.Ceiling(Model.RevenueFinal), 0, , , TriState.True) %></td>
                                                                                            </tr>
                                                                                          </tbody>
                                                                                      </table>
                                                                                  </div>
                                                                          </div><!--first tab-->

                                                                        <%--  <div role="tabpanel" class="tab-pane" id="promotion-two"><!--fsecond tab-->

                                                                          </div><!--second tab-->--%>

                                                                        

                                                                    </div><!-- Ende Nav tabs  promos-->


<% End If%>


