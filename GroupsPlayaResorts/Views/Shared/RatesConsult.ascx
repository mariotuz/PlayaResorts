<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>
<script src="/Scripts/Accounting.js"></script>
<script src="/Scripts/Funciones.js"></script>
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


        //Funciones nuevas
        Formatea();
        
        Valida_Descuento_Usuario();

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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

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

              idresults += '<a  target="_blank" href="/Groups/GroupDetail?id=' + res[i] + '" class="btn btn-default" ><%:Model.GroupHotelNew + "000"%>' + res[i] + '</a>  ';
          }

          $('#existgroupmodalids').html(idresults);

          $('#existgroupmodal').modal('show');

          $("#form-grouphead-info").addClass("active");
          $("#form-group-info").addClass("active");

          $("#rateshead").removeClass("active");
          $("#rates").removeClass("active");


          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("editbreakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("breakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

          document.getElementById("grupohotelevents").value = "<%:Model.GroupIdLabel%>"



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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("editbreakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("breakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

          document.getElementById("grupohotelevents").value = "<%:Model.GroupIdLabel%>"


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

          //alert(document.getElementById("grupoidlabeltext").value);

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          if (document.getElementById("grupoidlabeltext").value == "0" || document.getElementById("grupoidlabeltext").value == 0 || document.getElementById("grupoidlabeltext").value == "") {

              $('#grupoidlabel').html("<%:Model.GroupHotelNew%>");
          }

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("editbreakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("breakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

          document.getElementById("grupohotelevents").value = "<%:Model.GroupIdLabel%>"

      });
     </script>

<%  End If%>


<%  If Model.Accion=4 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("editbreakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("breakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

          document.getElementById("grupohotelevents").value = "<%:Model.GroupIdLabel%>"

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

          document.getElementById("grupoidlabeltext").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddoc").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupdate").value = "<%:Model.GroupId%>"

          document.getElementById("grupoiddocupload").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdown").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidbreakdowngroupby").value = "<%:Model.GroupId%>"

          document.getElementById("editbreakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("breakdownhotel").value = "<%:Model.GroupIdLabel%>"

          document.getElementById("grupoidlogbook").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidpayments").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidevents").value = "<%:Model.GroupId%>"

          document.getElementById("grupoidstatus").value = "<%:Model.GroupId%>"

          document.getElementById("grupohotelevents").value = "<%:Model.GroupIdLabel%>"


          $('#selectratetype').selectpicker();
          $('#ComissionAgency').selectpicker();

      });

     </script>

<%  End If%>




                                                                    <div id="rate-special">
                                                        
                                                                          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                            <span><small>Percentage Discount Rate</small></span>
                                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                              <input type="text" id="DiscountRate" name="DiscountRate" value="<%:Model.EditGroupData7%>" class="form-control input-custom corners-inputs" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" >
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

                   
                                                                                  <option  <% If Model.GroupTypeRate = "4" Then%> selected <% End if%> value="4">CoMa</option>
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


            <!-- 
                Original:If Model.GroupTypeRate = 4 Or Model.GroupTypeRate = 5 Or Model.GroupTypeRate = 2 Or Model.GroupTypeRate = 3 Then
                **Revisar por que no permite cuando es tipo 1
                 -->

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
                    Dim Formato_Moneda As String
        
        
        
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
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 active""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ", C:" + FormatNumber(Commission * 100, 0, , , TriState.True) + "% ,P: " + FormatNumber(Discount * 100, 0, , , TriState.True) + "%)</a></li>")
                                Else
                                    Response.Write("<li role=""presentation"" class="" col-xs-3 col-md-3 ""><a href=""#promotion-" + i.ToString + """ aria-controls=""rates"" role=""tab"" data-toggle=""tab"">Rate " + (i + 1).ToString + "(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ", C:" + FormatNumber(Commission * 100, 0, , , TriState.True) + "% ,P: " + FormatNumber(Discount * 100, 0, , , TriState.True) + "%)</a></li>")
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
             
                                 Response.Write("<td class=""rate-total"">Total Price <td>")
             
                                 Response.Write("<td class=""rate-price"">$ " + CStr(Model.RevenueFinal) + "</td>")
             
                                 Response.Write("</tr>  </tbody> </table> </div>   </div><!--first tab--> ")
                                 'hoy
                 
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
                             
                             If Model.EditGroupData7 > 0 Then
                                 Response.Write("<th>Discounted Rate <div>Discounted Rate</div></th>")
                             End If
                             
                             Response.Write("</tr>")
                             Response.Write("</thead>")
                             Response.Write("<tbody>")
                 
        
                             i = i + 1
                 
                 
                         End If
                         'aqui
                         If Model.ListGroupRatesin.Item(j).Availability = "Available" Then
                             Response.Write("<tr>")
                         Else
                         
                             Response.Write("<tr class=""disable"" >")
                         End If
                 
                         Response.Write("<td class=""tip"" data-tip=""" + Model.ListGroupRatesin.Item(j).Tip + """>")
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
                         
                         Formato_Moneda = Model.ListGroupRatesin.Item(j).Formato
                         
                         Response.Write("<td class=""" + Formato_Moneda + """>")
                       
                         If Model.ListGroupRatesin.Item(j).RateSingle = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(Model.ListGroupRatesin.Item(j).RateSingle)
                         End If
                 
                         Response.Write("</td>")
                 
                         If Model.GroupTypeRate = 2 Or Model.GroupTypeRate = 3 Then
                             Response.Write("<td style=""max-width:160px""  >")
                             Response.Write("<div class=""input-group  btn-group col-xs-4"" style=""width:100px"" >")
                             Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs doublehabs"" value=""" + FormatNumber(Math.Ceiling(Model.ListGroupRatesin.Item(j).RateDouble), 0, , , TriState.True).Replace(",", "").ToString + """ name=""List_DoubleRate"" placeholder=""0"" style=""text-align: center !important;"" onkeypress=""NextInput(event,this,'doublehabs');"">")
                             Response.Write("</div>")
                          
                         Else
                             Response.Write("<td style=""max-width:160px""  class=""" + Formato_Moneda + """>")
                             If Model.ListGroupRatesin.Item(j).RateDouble = 0 Then
                                 Response.Write("N/A")
                             Else
                                 Response.Write(Model.ListGroupRatesin.Item(j).RateDouble)
                             End If
                             
                         End If
                 
                         Response.Write("</td>")
                     
                         Response.Write("<td  class=""" + Formato_Moneda + """>")
                 
                         If Model.ListGroupRatesin.Item(j).RateTripleandFour = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(Model.ListGroupRatesin.Item(j).RateTripleandFour)
                         End If
                
                         Response.Write("</td>")
                     
                     
                         Response.Write("<td  class=""" + Formato_Moneda + """>")
                 
                         If Model.ListGroupRatesin.Item(j).RateTeensValue = 0 Then
                             Response.Write("N/A")
                         Else
                               Response.Write(Model.ListGroupRatesin.Item(j).RateTeensValue)
                         End If
                 
                         Response.Write("</td>")
                     
                         Response.Write("<td  class=""" + Formato_Moneda + """>")
                 
                         If Model.ListGroupRatesin.Item(j).RateChildrens = 0 Then
                             Response.Write("N/A")
                         Else
                             Response.Write(Model.ListGroupRatesin.Item(j).RateChildrens)
                         End If
             
                         Response.Write("</td>")
                    
                         Response.Write("<td  class=""" + Formato_Moneda + """>")
                    
                         Response.Write(Model.ListGroupRatesin.Item(j).RateDouble)
                         Response.Write("</td>")
             
                         Response.Write("</td>")
                    
                         Response.Write("<td  class=""" + Formato_Moneda + """>")
                         Response.Write(Model.ListGroupRatesin.Item(j).RateRevenuePerRoom)
                         Response.Write("</td>")
                 
                         Response.Write("</td>")
                         Dim classes As String = Formato_Moneda + " hoy rate-price"
                         Response.Write("<td class=""" + classes + """>")       
                         Response.Write(Model.ListGroupRatesin.Item(j).RateRevenue)
                         Response.Write("</td>")
                         
                         If Model.EditGroupData7 > 0 Then
                             Dim precio_descuento As Double = (Model.ListGroupRatesin.Item(j).RateRevenue * (1 - (Model.EditGroupData7 / 100)))
                             Response.Write("<td class=""" + classes + """>")
                             Response.Write(precio_descuento)
                             Response.Write("</td>")
                         End If
                         Response.Write("</tr>")
                     
                     Next
    
                     Response.Write("<tr class=""no-hover""> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>")
                     Response.Write("<td class=""rate-total"">Total Price</td>")
                     
                     Response.Write("<td class=""rate-price Total hoy " + Formato_Moneda + """>" + CStr(Model.RevenueFinal) + "</td> </tr> ")
                     
                     If Model.EditGroupData7 > 0 Then
                         Response.Write("<tr class=""no-hover""> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>")
                         Response.Write("<td class=""rate-total"">Discount(" + CStr(CDbl(Model.EditGroupData7)) + "%)</td>")
                         Dim descuento As Double = (Model.RevenueFinal) * (Model.EditGroupData7 / 100)
                         Response.Write("<td class=""rate-price Total hoy " + Formato_Moneda + """>" + CStr(descuento) + "</td> </tr> ")
                         
                         Response.Write("<tr class=""no-hover""> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>")
                         Response.Write("<td class=""rate-total"">Final Price</td>")
                     
                         Response.Write("<td class=""rate-price Total hoy " + Formato_Moneda + """>" + CStr(Model.RevenueFinal - descuento) + "</td> </tr> ")
                     End If
                   
                     Response.Write(" </tbody> </table> </div>   </div><!--first tab--> ")
     
                     %>                                                                                                                   
               </div><!-- Ende Nav tabs  promos-->


    <%End If%>


<% End If%>



<% If Model.GroupTypeRate = 1 Then
        Dim Date1 As Date
        Dim Date2 As Date
        Dim Commission As String
        Dim Discount As String
        
        If Model.ListGroupRatesin.Count = 0 Then
        
            Response.Write(" <h2> RATES NOT AVAILABLE </h2>")
        Else
            Date1 = Model.ListGroupRatesin.Item(0).InitDateRate
            Date2 = Model.ListGroupRatesin.Item(0).EndDateRate
            Commission = Model.ListGroupRatesin.Item(0).CommissionRate
            Discount = Model.ListGroupRatesin.Item(0).DiscountRate
        
        %>

        <ul class="nav nav-tabs nav-justified dual-select" role="tablist" >
                  <li role="presentation" class=" col-xs-4 col-md-4 active">
                      <a href="#promotion-0" aria-controls="rates" role="tab" data-toggle="tab">Rate 1 <% Response.Write("(" + Date1.ToString("yyyy-MM-dd") + " to " + Date2.ToString("yyyy-MM-dd") + ") Promo: " + Model.ListGroupRatesin.Item(0).RateCveValue)%></a>
                  </li>
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
                                                                                              <th >Room Night <div>Room Night</div></th>
                                                                                              <th >Rate Per Room <div>Rate Per Room</div></th>
                                                                                              <th>Total Price <div>Total Price</div></th>
                                                                                                 <%If Model.EditGroupData7 > 0 Then%>
                                                                                 
                                                                                            <th>Discounted Rate <div>Discounted Rate</div></th>
                                                                                               <% End If%>
                                                                                            </tr>
                                                                                          </thead>
                                                                                          <tbody>
                                                                                            
                                                                                 
             <% 
                 
                Dim i As Integer
                 Dim Formato_Moneda As String
   
                 For i = 0 To Model.ListGroupRatesin.Count - 1
                     
                     Formato_Moneda = Model.ListGroupRatesin.Item(i).Formato
                     
                     If Model.ListGroupRatesin.Item(i).Availability = "Available" Then
                         Response.Write("<tr>")
                     Else
                         
                          Response.Write("<tr class=""disable"" >")
                     End If
                    
                    
                     Response.Write("<td class=""tip"" data-tip=""" + Model.ListGroupRatesin.Item(i).Tip + """>")
                     Response.Write(Model.ListGroupRatesin.Item(i).SuiteCode)
                     Response.Write("</td>")
                     
                     Response.Write("<td>")
                     Response.Write("<div class=""input-group  btn-group col-xs-4"">")
                     
                     If Model.ListGroupRatesin.Item(i).Availability = "Available" Then
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs numhabitaciones"" value=""" + Model.ListGroupRatesin.Item(i).RatePax.ToString + """ name=""List_Pax"" placeholder=""0"" style=""text-align: center !important;"" >")
                    
                         Response.Write("<input type=""text""  value=""" + Model.ListGroupRatesin.Item(i).SuiteCode.ToString + """ name=""List_Suites"" placeholder=""0"" hidden  >")
                     
                     Else
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs"" value=""" + Model.ListGroupRatesin.Item(i).RatePax.ToString + """ name=""List_Pax"" placeholder=""0"" style=""text-align: center !important;"" disabled=""disabled"" >")
                     End If
                     
                    
                     Response.Write("</div>")
                     Response.Write("</td>")
                    
                     Response.Write("<td>")
                     
                     If Model.GroupTypeRate = 2 or Model.GroupTypeRate = 3 Then
                         Response.Write(" <button type=""button"" class=""btn btn-primary"" disabled data-toggle=""modal"" data-target=""#modalPeriodos"">View</button>")
                     Else
                         Response.Write(" <a class=""btn btn-primary StartAvailability"" href=""#" + Model.ListGroupRatesin.Item(i).SuiteCode.ToString + """  >View</a>")
                        'Response.Write(" <button type=""button"" class=""btn btn-primary"" data-toggle=""modal"" data-target=""#modalPeriodos"">View</button>")
                         
                     End If
                   
                     Response.Write("</td>")
                    
                     Response.Write("<td>")
                     Response.Write(Model.ListGroupRatesin.Item(i).SuiteCode)
                     Response.Write("</td>")
                    
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                     
                     Response.Write(Model.ListGroupRatesin.Item(i).RateSingle)
                     Response.Write("</td>")
                     
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                     
                     If Model.GroupTypeRate = 2  or Model.GroupTypeRate = 3 Then
                         
                         Response.Write("<div class=""input-group  btn-group col-xs-4"">")
                         
                         
                         Response.Write("<input type=""text"" class=""form-control input-custom corners-inputs"" value=""" + Model.ListGroupRatesin.Item(i).RateDouble.ToString + """ name=""List_DoubleRate"" placeholder=""0"" style=""text-align: center !important;"" >")
                         
                         Response.Write("</div>")
                 
                     End If
                     
                     
                     If Model.GroupTypeRate = 1  Then
                  
                         Response.Write(Model.ListGroupRatesin.Item(i).RateDouble)
                      
                     End If
                     
                    
                     Response.Write("</td>")
                     
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                     Response.Write(Model.ListGroupRatesin.Item(i).RateTripleandFour)
                     Response.Write("</td>")
                     
                     
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                     Response.Write(Model.ListGroupRatesin.Item(i).RateChildrens)
                     Response.Write("</td>")
                     
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                   
                     Response.Write(Model.ListGroupRatesin.Item(i).RateTeensValue)
                     Response.Write("</td>")
                 
                     'Columnas nuevas
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                    
                     Response.Write(Model.ListGroupRatesin.Item(i).RateDouble)
                     Response.Write("</td>")
             
                     Response.Write("</td>")
                    
                     Response.Write("<td class=""" + Formato_Moneda + """>")
                     Response.Write(Model.ListGroupRatesin.Item(i).RateRevenuePerRoom)
                     Response.Write("</td>")
                     ' Fin de columnas nuevas
                     
                     Dim classes As String = Formato_Moneda + " hoy rate-price"
                     Response.Write("<td class=""" + classes + """>")
                    
                     Response.Write(Model.ListGroupRatesin.Item(i).RateRevenue)
                     Response.Write("</td>")
                     
                     If Model.EditGroupData7 > 0 Then
                         Dim precio_descuento As Double = (Model.ListGroupRatesin.Item(i).RateRevenue * (1 - (Model.EditGroupData7 / 100)))
                         Response.Write("<td class=""" + classes + """>")
                         Response.Write(precio_descuento)
                         Response.Write("</td>")
                     End If
                    
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
                                                                                              <td></td>
                                                                                              <td></td>
                                                                                              <td class="rate-total">Total Price </td>
                                                                                                <%Response.Write("<td class='rate-price Total hoy " + Formato_Moneda + "'>" + CStr(Model.RevenueFinal) + "</td>")%>
                                                                                             </tr>
                                                                                               <% If Model.EditGroupData7 > 0 Then
                                                                                                       Response.Write("<tr class='no-hover'> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td><td></td>")
                                                                                                       Response.Write("<td class='rate-total'>Discount(" + CStr(CDbl(Model.EditGroupData7)) + "%)</td>")
                                                                                                       Dim descuento As Double = (Model.RevenueFinal) * (Model.EditGroupData7 / 100)
                                                                                                       Response.Write("<td class='rate-price Total hoy " + Formato_Moneda + "'>" + CStr(descuento) + "</td> </tr> ")
                         
                                                                                                       Response.Write("<tr class=""no-hover""> <td></td> <td></td><td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>")
                                                                                                       Response.Write("<td class=""rate-total"">Final Price</td>")
                     
                                                                                                       Response.Write("<td class='rate-price Total hoy " + Formato_Moneda + "'>" + CStr(Model.RevenueFinal - descuento) + "</td> </tr> ")
                                                                                                   End If%>

                                                                                          </tbody>
                                                                                      </table>
                                                                                  </div>
                                                                          </div><!--first tab-->
                                                                    </div>
    <% End If%>
<% End If%>
