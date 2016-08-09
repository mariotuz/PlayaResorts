 <%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsDetail)" %>

<asp:Content ID="GroupDetailTitle" ContentPlaceHolderID="TitleContent" runat="server"> Group Detail</asp:Content>


<asp:Content ID="GroupDetailContent" ContentPlaceHolderID="MainContentGrupos" runat="server">
    <style type="text/css">
  .tip {
    display: block;
    position: relative;
    cursor:pointer;
  }
  .tip:hover:after {
    bottom: 26px;
    content: attr(data-tip); /* este es el texto que será mostrado */
    left: 20%;
    position: absolute;
    z-index: 98;
    /* el formato gráfico */
    background: rgba(0,0,0, 1); /* el color de fondo */
    border-radius: 5px;
    color: #FFF; /* el color del texto */
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 14px;
    padding: 5px 15px;
    text-align: center;
    text-shadow: 1px 1px 1px #000;
    width: 180px;
  }
  .tip:hover:before {
    bottom: 20px;
    content: "";
    left: 22%;
    position: absolute;
    z-index: 99;
    /* el triángulo inferior */
    border: solid;
    border-color: rgba(0,0,0, 1) transparent;
    border-width: 6px 6px 0 6px;
  }
</style>
    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>

  <script type="text/javascript">
      var objParams = {
          data: '',
          dataPrev: '',
          cambiaPestana: false,
          previousTab: '',
          activeTab: '',
          cambioGeneral: false,
          cambioLocal: false
      }

      function MuestraAlertaCambiaTab(_options) {
          var $button = $($('#' + _options.previousTab + ' .right:first').find('button:first')[0]);
          var btnId = $button.attr('id');
          var btnClass = $button.attr('class');
          var btnLabel = $button.html();

          bootbox.dialog({
              message: i18nF(i18n["msgChangeGroup"], i18n['btn' + _options.previousTab]),
              buttons: {
                  buttonNo: {
                      label: i18n["btnCancel"],
                      className: 'btn-primary'
                  },
                  buttonYes: {
                      label: btnLabel,
                      className: btnClass,
                      callback: function () {
                          objParams.cambiaPestana = _options.cambiaPestana;
                          objParams.activeTab = _options.activeTab
                          objParams.previousTab = _options.previousTab;

                          $('#' + btnId).click();
                      }
                  }
              }
          });
      }

      $(document).ready(function () {
          var groupID = "<%:Model.GroupId%>";
          objParams.dataPrev = $('#form-group :input').serialize();

          $('#form-group input, #form-group-info input, #pays input').keypress(function (_event) {
              if (_event.keyCode == 13) {
                  _event.preventDefault();
              }
          });

          $('#generalViewTab a').on('shown.bs.tab', function (event) {
              var activeTab = $(event.target).attr('aria-controls');         // active tab

              if (activeTab == 'rates') {
                  $('#formGroupCotizador .table').find('.input-group  input').on('click', function () {
                      $(this).select();
                  });
              }
          });

          $('#generalViewTab a').on('show.bs.tab', function (event) {
              var activeTab = $(event.target).attr('aria-controls');         // active tab
              var previousTab = $(event.relatedTarget).attr('aria-controls');  // previous tab

              objParams.data = $('#' + previousTab + ' :input').serialize();

              if (objParams.dataPrev != objParams.data) {
                  event.preventDefault();
                  objParams.cambioGeneral = true;
                  objParams.cambioLocal = false;
                  MuestraAlertaCambiaTab({ previousTab: previousTab, activeTab: activeTab, cambiaPestana: (previousTab != 'form-group') ? true : false });
              } else {
                  objParams.dataPrev = $('#' + activeTab + ' :input').serialize();
              }
          });

          $('#myTab a').on('show.bs.tab', function (event) {
              var activeTabGeneral = $(event.target).attr('aria-controls');         // active tab
              var activeTab = $($('#generalViewTab > li.active > a')[0]).attr('aria-controls');
              var infoActual = $('#' + activeTab + ' :input').serialize();

              objParams.cambiaPestana = false;

              if (objParams.cambioGeneral || (!objParams.cambioGeneral && infoActual != objParams.dataPrev)) {
                  event.preventDefault();

                  bootbox.dialog({
                      message: i18n["msgChangeGeneralTab"],
                      buttons: {
                          buttonNo: {
                              label: i18n["btnCancel"],
                              className: 'btn-primary'
                          },
                          buttonReload: {
                              label: i18n["btnReload"],
                              className: 'btn-gray',
                              callback: function () {
                                  location.reload();
                              }
                          }, buttonDiscard: {
                              label: (!objParams.cambioLocal) ? i18n["btnDiscardChanges"] : i18n["btnSaveGroup"],
                              className: (!objParams.cambioLocal) ? 'btn-gray' : 'btn-success',
                              callback: function () {
                                  if (!objParams.cambioLocal) {
                                      objParams.cambioGeneral = false;
                                      objParams.dataPrev = infoActual;
                                      $('#myTab a[href = "#' + activeTabGeneral + '"]').tab('show');
                                  } else {
                                      objParams.dataPrev = infoActual;
                                      $('#SaveGroup').click();
                                  }
                              }
                          }
                      }
                  });
              }
          });

          var valorTipoAgencia = $('#selectagencytype').val();

          if (valorTipoAgencia == 5) {
              $('#selectcompany').addClass('obligatorio');
              $('#selectcompany').css('cursor', 'default');
              $('#CompanyNew').attr('disabled', false);
          } else if (valorTipoAgencia == 4) {
              $('#selectcompany').addClass('vaciar');
              $('#selectcompany').css('cursor', 'not-allowed');
              $('#CompanyNew').attr('disabled', true);
          } else {
              $('#CompanyNew').attr('disabled', false);
              $('#selectcompany').css('cursor', 'default');
          }

          $('#subeArchivo').on('submit', function () {
              if (_Validaciones.ValidaCampo('Doc_File')) {
                  return false;
              } else {
                  $('.load-container').fadeIn('slow');
              }
          });

          $('#donepay').on('click', function () {
              if (groupID > 0) {
                  var tipoTarifa = $('#selectyperatecotizar').val();

                  console.info(objParams.data);

                  if (tipoTarifa == 2 && (objParams.dataPrev == $('#form-group :input').serialize())) {
                      $('#rateshead > a:first').click();
                      return false;
                  }
              }

              formValida = 'form-group';
          });

          $('#SaveGroup').on('click', function (e) {
              
              //Nuevo 
              var number_rooms = ''
              var available = ''

              $("input[name$='List_Pax']").each(function () {
                  number_rooms += $(this).val() + ','

                  if (!$(this).attr('disabled'))
                      available += 1 + ',';
                  else
                      available += 0 + ','
             })

              var inputs = '<input type="text" hidden="" value="' + available + '" name="DISPONIBILIDAD" id="DISPONIBILIDAD">'
                            + '<input type="text" hidden="" value="' + number_rooms + '" name="NUMBER_ROOMS" id="NUMBER_ROOMS">';
              $('#rates').append(inputs)
              //Termina nuevo



              btnClickeado = 'SaveGroup';

              var totHabitaciones = 0;

              $('.numhabitaciones').each(function () {
                  var $elemento = $(this);
                  totHabitaciones = totHabitaciones + parseInt($elemento.val());
              });

              if (totHabitaciones > $('#numberpax').val() || totHabitaciones < $('#numberpax').val()) {
                  e.preventDefault();

                  if (totHabitaciones > $('#numberpax').val()) {
                      var msg = i18n["msgExceeds"];
                  } else {
                      var msg = i18n["msgLess"];
                  }

                  bootbox.dialog({
                      message: i18nF(i18n["msgNumHabitaciones"], msg),
                      buttons: {
                          buttonNo: {
                              label: i18n["btnCancel"],
                              className: 'btn-primary'
                          },
                          buttonYes: {
                              label: i18n["btnOk"],
                              className: 'btn-gray',
                              callback: function () {
                                  $('#numberpax').val(totHabitaciones);
                                  $('#SaveGroup').click();
                              }
                          }
                      }
                  });
              } else {
                  objParams.cambioGeneral = false;
                  $('#generalViewTab a[href = "#' + objParams.activeTab + '"]').tab('show');
              }

              formValida = 'form-group-info';

              //Tiene que tener un contaco valido 
              if (!_Validaciones.ValidaObligatorios(formValida)) {
                  e.preventDefault();
              }
              else {

                  var contact = $('#selectcontact').val();
                  $('#selectcontact').autocomplete('search', contact);

                  setTimeout(function () {
                      $('.ui-corner-all').removeAttr('style');
                  },500);



                  var idelemento = CreaIdAleatorio();
                  var encontrado = false;

                  if ($('.ui-corner-all li').length == 0)
                      encontrado = true;

                  $('.ui-corner-all').each(function () {
                      if ($(this).text() == contact) {
                          encontrado = true;
                      }
                  });


                  if (!encontrado) {
                      e.preventDefault();
                      $("body").prepend('<div class="alertUl alert-error alert' + idelemento + '"><strong>Error!</strong> Contact Not Valid.</div>');
                      $('.alert' + idelemento).fadeIn("slow").delay(2000).fadeOut("slow");
                      setTimeout(function () { $('.alert' + idelemento).remove(); }, 4000);
                  }

  
              }
          });

          $('#SaveScheme').on('click', function () {
              formValida = 'pays';
          });

          $('#formGroupCotizador').on('submit', function () {
              if (!_Validaciones.ValidaObligatorios(formValida)) {
                  return false;
              } else {
                  $('.load-container').fadeIn('slow');
              }
          });


          $('#downloadDocument').on("submit", function (e) {
              $('.load-container').fadeIn('slow');

              setTimeout(function () {
                  $('.load-container').fadeOut('slow');
              }, 3000);
          });

          $('#grupoContacto').on('submit', function () {
              if (!_Validaciones.ValidaObligatorios('grupoContacto')) {
                  return false;
              } else {
                  $('.load-container').fadeIn('slow');
              }
          });

          $('#grupoCompania').on('submit', function () {
              if (!_Validaciones.ValidaObligatorios('grupoCompania')) {
                  return false;
              } else {
                  $('.load-container').fadeIn('slow');
              }
          });

          $('#WhosaleDetail').autocomplete({
              source: function (request, response) {
                  $.ajax({
                      url: '<%: Url.Action("WhosaleList") %>',
                      dataType: "json",
                      contentType: 'application/json, charset=utf-8',
                      data: {
                          search: $("#WhosaleDetail").val()
                      },
                      success: function (data) {

                          response($.map(data, function (item) {
                              return {
                                  label: item
                              };
                          }));
                      },
                      error: function (xhr, status, error) {
                          alert(error);
                      }
                  });
              },
              minLength: 2
          });




          $('#selectcompany').autocomplete({
              source: function (request, response) {
                  $.ajax({
                      url: '<%: Url.Action("Companies") %>',
                      dataType: "json",
                      contentType: 'application/json, charset=utf-8',
                      data: {
                          search: $("#selectcompany").val()
                      },
                      success: function (data) {

                          response($.map(data, function (item) {
                              return {
                                  label: item
                              };
                          }));
                      },
                      error: function (xhr, status, error) {
                          alert(error);
                      }
                  });
              },
              minLength: 2
          });


          $('#selectcontact').autocomplete({
              source: function (request, response) {
                  $.ajax({
                      url: '<%: Url.Action("Contacts") %>',
                      dataType: "json",
                      contentType: 'application/json, charset=utf-8',
                      data: {
                          search: $("#selectcontact").val(),
                          cia: $("#selectcompany").val(),
                          to: $("#WhosaleDetail").val()
                      },
                      success: function (data) {

                          response($.map(data, function (item) {
                              return {
                                  label: item
                              };
                          }));
                      },
                      error: function (xhr, status, error) {
                          alert(error);
                      }
                  });
              },
              minLength: 2
          });


          $('#NumberNights').keyup(function () {

              var dat = new Date(document.getElementById("datetimepicker6text").value);

              //var date = Date.UTC(dat.getFullYear, dat.getMonth, dat.getDate);

              var daysnew = parseInt(document.getElementById("NumberNights").value) + 1;

              if (daysnew == "") {

                  daysnew = 0;
              }

              dat.setDate(dat.getDate() + daysnew);

              var datenew = dat.getFullYear() + "-";
              var month = dat.getMonth() + 1;
              var days = dat.getDate();

              if (month < 10) {
                  datenew = datenew + "0" + month;
              }
              else {
                  datenew = datenew + "" + month;
              }

              if (days < 10) {
                  datenew = datenew + "-0" + days;
              }
              else {
                  datenew = datenew + "-" + days;
              }

              if (datenew == 'NaN-NaN-NaN') {
                  datenew = '';
              }
              document.getElementById("datetimepicker7text").value = datenew;
              //$('#datetimepicker7').data("DateTimePicker").minDate(datenew);
              //alert(date);  

          });



          $('.load-container').fadeOut('slow');




      });

    </script>

    <script type="text/javascript">


        function OnSuccess(response) {
            if (response == "Error") {
                $('#existgroupmodal').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


            } else {
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }

            if (objParams.cambiaPestana) {
                objParams.dataPrev = $('#' + objParams.previousTab + ' :input').serialize();
                $('#generalViewTab a[href = "#' + objParams.activeTab + '"]').tab('show');
            } else {
                var activeTab = $($('#generalViewTab > li.active > a')[0]).attr('aria-controls');
                objParams.dataPrev = $('#' + activeTab + ' :input').serialize();
            }

            objParams.cambioLocal = true;
        }

        function OnFailure(response) {

            $('#existgroupmodal').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

        }

        function OnBegin() {
            $('.load-container').fadeIn('slow');

        }

        function OnComplete() {

            $('.load-container').fadeOut('slow');

        }

        function OnSuccessAvailability(response) {
            $('#modalPeriodos').modal('show');
        }


        function OnFailureAvailability(response) {

            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnSuccessCompany(response) {

            $('#modalCompany').modal('hide');
            $('#modealContact').modal('hide');

        }


        function OnFailureCompany(response) {

            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }



        function OnSuccessBreakDown(response) {


            if (response == "Error") {

                $('#deploy').modal('hide');
                $('#editdeploy').modal('hide');
                $('#breakdowncancelmodal').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#deploy').modal('hide');
                $('#editdeploy').modal('hide');
                $('#breakdowncancelmodal').modal('hide');
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
            }


        }


        function OnFailureBreakDown(response) {


            $('#deploy').modal('hide');
            $('#editdeploy').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnSuccessBreakDownEdit(response) {


            if (response == "Error") {

                $('#editdeploy').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#editdeploy').modal('show');

            }



        }


        function OnFailureBreakDownEdit(response) {


            $('#editdeploy').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }

        function OnSuccessPayments(response) {

            if (response == "Error") {

                $('#paymentvalidatemodal').modal('hide');
                $('#paymentcancelmodal').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#paymentvalidatemodal').modal('hide');
                $('#paymentcancelmodal').modal('hide');
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }


        }


        function OnFailurePayments(response) {

            $('#paymentvalidatemodal').modal('hide');
            $('#paymentcancelmodal').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnSuccessLogBook(response) {


            if (response == "Error") {

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }


        }


        function OnFailureLogBook(response) {

            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnSuccessEvents(response) {


            if (response == "Error") {

                $('#eventcancelmodal').modal('hide');

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#eventcancelmodal').modal('hide');

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }


        }


        function OnFailureEvents(response) {

            $('#eventcancelmodal').modal('hide');

            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnSuccessDoc(response) {


            if (response == "Error") {

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }


        }


        function OnFailureDoc(response) {

            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

        }


        function OnSuccessChangeStatus(response) {


            if (response == "Error") {

                $('#Paymentgroupchangestatuscancelmodal').modal('hide');
                $('#Paymentgroupchangestatusmodal').modal('hide');
                $('#Bookgroupchangestatuscancelmodal').modal('hide');
                $('#Bookgroupchangestatusmodal').modal('hide');
                $('#Hotelgroupchangestatuscancelmodal').modal('hide');
                $('#Hotelgroupchangestatusmodal').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#Paymentgroupchangestatuscancelmodal').modal('hide');
                $('#Paymentgroupchangestatusmodal').modal('hide');
                $('#Bookgroupchangestatuscancelmodal').modal('hide');
                $('#Bookgroupchangestatusmodal').modal('hide');
                $('#Hotelgroupchangestatuscancelmodal').modal('hide');
                $('#Hotelgroupchangestatusmodal').modal('hide');
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }


        }


        function OnFailureChangeStatus(response) {

            $('#Paymentgroupchangestatuscancelmodal').modal('hide');
            $('#Paymentgroupchangestatusmodal').modal('hide');
            $('#Bookgroupchangestatuscancelmodal').modal('hide');
            $('#Bookgroupchangestatusmodal').modal('hide');
            $('#Hotelgroupchangestatuscancelmodal').modal('hide');
            $('#Hotelgroupchangestatusmodal').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

        }


        function OnSuccessCompanyRequest(response) {


            if (response == "Error") {

                $('#modalCompany').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#modalCompany').modal('show');

            }


        }


        function OnSuccessContactRequest(response) {


            if (response == "Error") {

                $('#modealContact').modal('hide');
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');

            } else {

                $('#modealContact').modal('show');

            }


        }


        function OnFailureCompanyRequest(response) {


            $('#modalCompany').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }


        function OnFailureContactRequest(response) {


            $('#modealContact').modal('hide');
            $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div> ');


        }

        function ValidaClaseVacia(_elemento) {
            if ($(_elemento).hasClass('vaciar')) {
                $(_elemento).val('').blur();
            }
        }

        function ActivaCompany(_valorSelect) {
            if (_valorSelect == 4) {
                $('#selectcompany').removeClass('obligatorio');
                $('#selectcompany').addClass('vaciar');
                $('#CompanyNew').attr('disabled', true);
                $('#selectcompany').val('').css('cursor', 'not-allowed');
            } else if (_valorSelect == 5) {
                $('#selectcompany').addClass('obligatorio');
                $('#selectcompany').removeClass('vaciar');
                $('#CompanyNew').attr('disabled', false);
                $('#selectcompany').css('cursor', 'default');
            } else if (_valorSelect == 2) {
                $('#selectcompany').removeClass('obligatorio');
                $('#selectcompany').removeClass('vaciar');
                $('#CompanyNew').attr('disabled', false);
                $('#selectcompany').css('cursor', 'default');
            }
        }


    </script>

    <script type="text/javascript">

        $(document).ready(function () {

            $("#selectstatuspayment").change(function () {

                if ($("#grupoidlabeltext").val() != "0") {

                    if ($("#selectstatuspayment").val() == "3") {

                        $('#Paymentgroupchangestatuscancelmodal').modal('show');

                    }
                    else {

                        $('#Paymentgroupchangestatusmodal').modal('show');

                    }

                }


            });


            $("#selectstatusbook").change(function () {

                if ($("#grupoidlabeltext").val() != "0") {

                    if ($("#selectstatusbook").val() == "3") {

                        $('#Bookgroupchangestatuscancelmodal').modal('show');

                    }
                    else {

                        $('#Bookgroupchangestatusmodal').modal('show');

                    }

                }

            });


            $("#selectstatushotel").change(function () {

                if ($("#grupoidlabeltext").val() != "0") {

                    if ($("#selectstatushotel").val() == "3") {

                        $('#Hotelgroupchangestatuscancelmodal').modal('show');

                    }
                    else {

                        $('#Hotelgroupchangestatusmodal').modal('show');

                    }

                }

            });



        });

    </script>
      <div class="load-container load4"><div class="loader"></div></div>
      <div class="custom-tall">
      <div class="principal-bar">
        <div class="sidebar-brand">
            <a id="menu-toggle" href="#"><h2><img src="<%: Url.Content("~/Content/img/logo_plr.gif")%>"/></h2><span id="main_icon" class="glyphicon glyphicon-align-justify"></span></a>
        </div>
      </div>

      <div class="info-title">

                <h1><img src="<%: Url.Content("~/Content/img/icons/images/icon_group_title.png")%>"> Group : <span id="grupoidlabel"> </span></h1>
                
<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessChangeStatus", .OnFailure = "OnFailureChangeStatus", .UpdateTargetId = "AJAX_ContainerStatus"}, New With {.autocomplete = "off"})%>

                <input type="text" id="grupoidstatus" name="grupoidstatus" hidden value="0"   >

                <div class="info-group" id="AJAX_ContainerStatus">
                        
                    <% Html.RenderPartial("StatusConsult", Model)%>
                        
                </div>   


          
 <div class="modal fade" id="Paymentgroupchangestatuscancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change Payment Status to Cancelled? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">


                                                     <span><small> Cancel Type </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <select class="selectpicker" id="paymentcanceltypebreak" name="paymentcanceltypebreak" data-width="100%">
                                                                              <option  value="0"> </option>
                                                                              <option  value="1">Expensive Rates</option>
                                                                             
                                                                            </select>
                                                    </div>
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="paymentcancelspecialnotesbreak" name="paymentcancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button  type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="PaymentStatusCancelled" value="Payment_Status_Cancelled" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <div class="modal fade" id="Paymentgroupchangestatusmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change the Payment Status? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">

                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="paymentchangespecialnotesbreak" name="paymentchangespecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="PaymentStatusChanged" value="Payment_Status_Changed" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


    <div class="modal fade" id="Bookgroupchangestatuscancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change Book Status to Cancelled? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">


                                                     <span><small> Cancel Type </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <select class="selectpicker" id="bookcanceltypebreak" name="bookcanceltypebreak" data-width="100%">
                                                                              <option  value="0"> </option>
                                                                              <option  value="1">Expensive Rates</option>
                                                                             
                                                                            </select>
                                                    </div>
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bookcancelspecialnotesbreak" name="bookcancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button  type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="BookStatusCancelled" value="Book_Status_Cancelled" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <div class="modal fade" id="Bookgroupchangestatusmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button  type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change the Book Status? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">

                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bookchangespecialnotesbreak" name="bookchangespecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="BookStatusChanged" value="Book_Status_Changed" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


     <div class="modal fade" id="Hotelgroupchangestatuscancelmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change Hotel Status to Cancelled? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">



                                                     <span><small> Cancel Type </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <select class="selectpicker" id="hotelcanceltypebreak" name="hotelcanceltypebreak" data-width="100%">
                                                                              <option  value="0"> </option>
                                                                              <option  value="1">Expensive Rates</option>
                                                                             
                                                                            </select>
                                                    </div>
                                           
                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="hotelcancelspecialnotesbreak" name="hotelcancelspecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button  type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="HotelStatusCancelled" value="Hotel_Status_Cancelled" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <div class="modal fade" id="Hotelgroupchangestatusmodal" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button  type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to change the Hotel Status? </h4>
      </div>

        <div class="modal-body"><!-- Start modal body-->
            <div class="">


                                                    <span><small> Notes </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="hotelchangespecialnotesbreak" name="hotelchangespecialnotesbreak"  rows="5" cols="50" placeholder="Your note..."></textarea>
                                                    </div>
                                                  

                </div>
            <div class="clear"></div>

        </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="HotelStatusChanged" value="Hotel_Status_Changed" name="GroupDetailBotons" class="btn btn-success">Yes</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->

<% End Using %>

         

      </div>

  </div>



    <div id="wrapper" class="active minheight"  ><!--start wrapper-->
      
            <!-- Sidebar -->
            <div id="sidebar-wrapper" class="scroll">
              <ul id="sidebar_menu" class="sidebar-nav">
                <li class="md-toolbar-tools white">
                  <div class="scare-name"></div>
                  <span> <%:Session("User_Name")%> </span>
                </li>
              </ul>

              <ul class="sidebar-nav" id="sidebar"><!-- Menu content -->    
                <li><a <%If Request.FilePath.ToString = "/Groups/Dashboard" Then Response.Write("class='active-menu '")%> href="/Groups/Dashboard"><span><img src="<%: Url.Content("~/Content/img/icons/images/dashboard_off.png")%>"/></span>Dashboard<%--<span class="badge">4</span>--%></a></li>     
                <li><a <%If Request.FilePath.ToString = "/Groups/GroupsList" Then Response.Write("class='active-menu '")%> href="/Groups/GroupsList"><span><img src="<%: Url.Content("~/Content/img/icons/images/groups_off.png")%>"/></span>Groups<%--<span class="badge">4</span>--%></a></li>
                <li><a <%If Request.FilePath.ToString = "/Events/EventsList" Then Response.Write("class='active-menu '")%> href="/Events/EventsList"><span><img src="<%: Url.Content("~/Content/img/icons/images/events_off.png")%>"/> </span>Events<%--<span class="badge">1</span>--%></a></li>
                <li><a <%If Request.FilePath.ToString = "/Catalogs/CatalogUsers" Or Request.FilePath.ToString = "/Catalogs/CatalogGroupType" Or Request.FilePath.ToString = "/Catalogs/CatalogProfiles" Or Request.FilePath.ToString = "/Catalogs/CatalogProperties" Or Request.FilePath.ToString = "/Catalogs/CatalogMarkets" Or Request.FilePath.ToString = "/Catalogs/CatalogWholesale" Or Request.FilePath.ToString = "/Catalogs/CatalogCompanies" Or Request.FilePath.ToString = "/Catalogs/CatalogContacts" Or Request.FilePath.ToString = "/Catalogs/CatalogPorS"  Or Request.FilePath.ToString = "/Catalogs/CatalogChannel" Or Request.FilePath.ToString = "/Catalogs/CatalogAgencyType" Or Request.FilePath.ToString = "/Catalogs/CatalogSupplier" Or Request.FilePath.ToString = "/Catalogs/CatalogDistribution" Or Request.FilePath.ToString = "/Catalogs/CatalogUnitMeasure" Then Response.Write("class='active-menu '")%> href="/Catalogs/CatalogUsers"><span><img src="<%: Url.Content("~/Content/img/icons/images/cataloge_off.png")%>"/> </span>Catalogs</a></li>
                <li><a <%If Request.FilePath.ToString = "/Reports/ReportsDetail" Then Response.Write("class='active-menu '")%> href="/Reports/ReportsDetail"><span><img src="<%: Url.Content("~/Content/img/icons/images/payments_off.png")%>"/> </span>Reports</a></li>
                <li id="log-out"><a href="/Home/LogOut" ><span><img src="<%: Url.Content("~/Content/img/icons/images/logout.png")%>" /> </span>Logout</a></li>
                <!--<li><a><span><img src=""/> </span>Profile</a></li>-->
              </ul>
            </div><!--end Sidebar-->


       <!-- Start Page content -->
            <div id="page-content-wrapper">

                                                <!-- Keep all page content within the page-content inset div! -->
                                                
                                                <!--Notification success alert-->
                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" id="AlertContent">

                                                     <div class="clear"></div>
                                                 </div>
                                                <!--Notification success alert-->

                    <!--Start page content wrapper-->
                    <div class="page-content inset">

                        <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start tabpanel-->

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab">
                                  <li role="presentation" class="active"><a href="#generalview" data-btnClick="#donepay" aria-controls="generalview" role="tab" data-toggle="tab">General View</a></li>
                                  <li role="presentation"><a href="#documents" aria-controls="documents" role="tab" data-toggle="tab">Documents / Formats</a></li>
                                  <li role="presentation"><a href="#events" aria-controls="events" role="tab" data-toggle="tab">Events</a></li>
                                  <li role="presentation"><a href="#break" aria-controls="break" role="tab" data-toggle="tab">Breakdown</a></li>
                                  <li role="presentation"><a href="#payment" aria-controls="payment" role="tab" data-toggle="tab">Payments</a></li>
                                  <li role="presentation"><a href="#log" aria-controls="log" role="tab" data-toggle="tab">LogBook</a></li>
                                </ul>
                                <!-- Nav tabs -->


                                                        
                                <div class="tab-content minheight-tab" ><!-- Tab content -->


                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in active" id="generalview"> 
                                          <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "formGroupCotizador",.autocomplete="off"})%>

                                             <%: Html.Partial("_GroupGeneralViewDos")%>

                                          <% End Using %>
                                      </div>


                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="documents">
                                         
                                             <%: Html.Partial("_GroupDocs")%>

                                      </div>


                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="events">

                                          <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEvents", .OnFailure = "OnFailureEvents", .UpdateTargetId = "AJAX_ContainerEvents"}, New With {.id = "formEvents"})%>

                                            <%: Html.Partial("_GroupEvents")%>

                                          <% End Using %>

                                      </div>

                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="break">
                                           
                                                <%: Html.Partial("_GroupBreakDownTres")%>

                                      </div>

                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="payment">
                                          <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin="OnBegin",.OnComplete="OnComplete",.OnSuccess = "OnSuccessPayments", .OnFailure = "OnFailurePayments", .UpdateTargetId = "AJAX_ContainerPayments"})%>

                                                <%: Html.Partial("_GroupPayments")%>

                                          <% End Using %>
                                      </div>

                                      <div role="tabpanel" class="tab-pane minheight-wrap fade in" id="log">

                                          <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin="OnBegin",.OnComplete="OnComplete",.OnSuccess = "OnSuccessLogBook", .OnFailure = "OnFailureLogBook", .UpdateTargetId = "AJAX_ContainerLogBook"})%>

                                            <%: Html.Partial("_GroupLogbook")%>

                                          <% End Using %>
                                      </div>


                                </div><!--End tab content-->


                        </div><!-- End Tabpael -->


                    </div>
                    <!--end page content wrapper-->


            </div><!-- end Page content-->


         </div><!--end wrapper-->



<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessAvailability", .OnFailure = "OnFailureAvailability", .UpdateTargetId = "AJAX_Container2"})%>
<!-- Modal -->

<button  id="ConsultAvailability" value="Consult_Availiability" name="GroupDetailBotons"  hidden >Start Availability</button>

<input  name="HotelAvailability" id="HotelAvailability" hidden />

<input  name="CheckinAvailability" id="CheckinAvailability" hidden />

<input  name="CheckoutAvailability" id="CheckoutAvailability" hidden />

<input  name="SuiteAvailability" id="SuiteAvailability" hidden />

<input  name="AgencyAvailability" id="AgencyAvailability" hidden />


 <div class="modal fade" id="modalPeriodos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info Unit Of Measure modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title" id="myModalLabel"><span>Suite</span>&nbsp;Availability:&nbsp;<span id="LabelSuiteAvailability"> </span></h4>
      </div>


        <div class="modal-body"  id="AJAX_Container2">

            <% Html.RenderPartial("AvailabilityModal", Model)%>

        </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end info Unit Of Measure modal-->


<% End Using %>


<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessCompany", .OnFailure = "OnFailureCompany", .UpdateTargetId = "AJAX_Container2"}, New With {.id = "grupoContacto"})%>

    <div class="modal fade" id="modalCompany" tabindex="-1" role="dialog" >
                                          <div class="modal-dialog modal-lg">
                                            <div class="modal-content" id="AJAX_Container_Company">

                                             
                                                
                                                  <% Html.RenderPartial("RequestCompanyModal", Model)%>

                                                

                                            </div><!-- /.modal-content -->
                                          </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->

<% End Using %>

<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessCompany", .OnFailure = "OnFailureCompany", .UpdateTargetId = "AJAX_Container2"}, New With {.id = "grupoCompania"})%>

    <input  name="WholesaleContactmodal" id="WholesaleContactmodal" hidden />

    <input  name="CompanyContactmodal" id="CompanyContactmodal" hidden />

    <div class="modal fade" id="modealContact" tabindex="-1" role="dialog" >
                                          <div class="modal-dialog modal-lg">
                                            <div class="modal-content" id="AJAX_Container_Contact">

                                                <% Html.RenderPartial("RequestContactModal", Model)%>
                                            
                                            </div><!-- /.modal-content -->
                                          </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->


<% End Using %>



<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessCompanyRequest", .OnFailure = "OnFailureCompanyRequest", .UpdateTargetId = "AJAX_Container_Company"})%>

    <input  name="CompanyRequestValue" id="CompanyRequestValue" hidden />

    <button id="RequestCompanyValue" value="Request_Company_Value" name="GroupDetailBotons" class="btn btn-success">Save</button>

<% End Using %>


<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessContactRequest", .OnFailure = "OnFailureContactRequest", .UpdateTargetId = "AJAX_Container_Contact"})%>

    <input  name="ContactRequestValue" id="ContactRequestValue" hidden />

    <button id="RequestContactValue" value="Request_Contact_Value" name="GroupDetailBotons" class="btn btn-success">Save</button>

<% End Using %>

</asp:Content>
