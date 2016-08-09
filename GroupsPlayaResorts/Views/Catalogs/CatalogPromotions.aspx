<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CataloPromo)" %>

<asp:Content ID="CatalogChannelTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Promotions
</asp:Content>


<asp:Content ID="CatalogChannelContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {

        $("#HotelSelect").change(function () {

            if ($("#HotelSelect").val() == "RPR") {

                $("#SelectPromoRoomType").show();

            }
            else {

                $("#SelectPromoRoomType").hide();

            }
          
        });

         $("#SelectPromoRoomType").hide();
            
        });

    </script>

    <script type="text/javascript">

        function OnSuccess(response) {

            if (response == "Error") {

                $("#newsupp_head").removeClass("active");
                $("#newsupp").removeClass("active");

                $("#suppList_head").addClass("active");
                $("#suppList").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');
               
            }
            else {

                $("#newsupp_head").removeClass("active");
                $("#newsupp").removeClass("active");

                $("#suppList_head").addClass("active");
                $("#suppList").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("datetimepickerdate1text").value = "";
                document.getElementById("datetimepickerdate2text").value = "";
                document.getElementById("datetimepickerdate3text").value = "";
                document.getElementById("datetimepickerdate4text").value = "";
                document.getElementById("PromoDiscount").value = "";
               
            }
        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }

        function OnBegin() { }

        function OnComplete() { }



        //function OnSuccessEdit(response) {

        //    if (response == "Error") {

        //        //$('#supplierModal').modal('hide')
        //        //$('#deletesupplierModal').modal('hide')
        //        $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');
               

        //    }
        //    else {

        //        //$('#supplierModal').modal('hide')
        //        //$('#deletesupplierModal').modal('hide')
        //        $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>   ');
        //        $("#AlertContent").show();
        //        window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

        //    }

        //}

        //function OnFailureEdit(response) {

        //    $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        //}


        //function OnSuccessEditRequest(response) {



        //    if ($('input[name=SupplierRadio]:checked').length > 0) {

        //        $('#supplierModal').modal('show')

        //    }


        //}

        //function OnFailureEditRequest(response) {

        //    $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        //}


        //$(document).ready(function () {

        //    $('#EditMeasureClose').click(function (e) {
        //        $('#AlertContentEdit').html('')
        //    })


        //    $('#EditMeasureCloseCircule').click(function (e) {
        //        $('#AlertContentEdit').html('')
        //    })


        //});


    </script>

      <script type="text/javascript">


          $(document).ready(function () {

              $('.load-container').fadeOut('slow');

          });

    </script>


        <!-- Start Page content wrapper-->
    <div id="page-content-wrapper">
                                    

        <!--Notification success alert-->
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" id="AlertContent">


                        <div class="clear"></div>
                    </div>
               <!--Notification success alert-->  
                           

          <!-- Keep all page content within the page-content inset div! -->
          <div class="page-content inset"><!--Start page content-->


              <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                          
                          <!-- Start tab Supplier Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new supplier list-->
                                      <li role="presentation" id="newsupp_head" class="active"><a href="#newsupp" aria-controls="newsupp" role="tab" data-toggle="tab">Add New Promo</a></li>
                                      <li role="presentation" id="suppList_head" ><a href="#suppList" aria-controls="suppList" role="tab" data-toggle="tab">Promotions List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Supplier list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newsupp"><!--Star tab form supplier-->

                                                 <% Using Ajax.BeginForm("CatalogPromotions", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>

                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                      <%: Html.ValidationMessageFor(Function(m) m.PromoDiscount)%>
                                                   
                                               
                                                    <div class="clear"></div>
                                                </div> 

                                                <header class="encabezado"><h2 class="md-display-2">Add New Promo.</h2><p></p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Property *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        <%--  <input type="text" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                             <select class="selectpicker" id="HotelSelect" name="HotelSelect" data-width="100%">
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

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" id="SelectPromoRoomType">
                                                        <span><small>Room Type *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <select class="selectpicker" id="RoomType" name="RoomType"  data-width="100%">
                                                                              <option  value=""></option>
                                                                           
                                                           </select>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Rate Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <input type="text" class="form-control input-custom corners-inputs"  value="FALL" id="PromoRateName" name="PromoRateName" placeholder="" >
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Año *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                            <select class="selectpicker" id="promoyear" name="promoyear" data-width="100%">
                                                                              <option  value="2016">2016</option>
                                                                              <option  value="2017">2017</option>
                                                                              <option  value="2018">2018</option>
                                                                              <option  value="2019">2019</option>
                                                                           
                                                           </select>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Discount *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.PromoDiscount, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                   
                                                      <!-- date piker 1-->
                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span class="txt-filter"><small>Initial Date *</small></span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate1'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate1text" name="datetimepickerdate1text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                      <span class="txt-filter"><small>End Date *</small></span>
                                                        <div class='date-imput'>
                                                            <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate2'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate2text" name="datetimepickerdate2text" />
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


                                                       <!-- date piker 1-->
                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <span class="txt-filter"><small>Booking Initial Date *</small></span>
                                                      <div class='date-imput'>
                                                          <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate3'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate3text" name="datetimepickerdate3text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                      <span class="txt-filter"><small>Booking End Date *</small></span>
                                                        <div class='date-imput'>
                                                            <div class="form-group">
                                                              <div class='input-group date' id='datetimepickerdate4'>
                                                                  <input type='text' class="form-control" data-format="YYYY-MM-DD"  id="datetimepickerdate4text" name="datetimepickerdate4text" />
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                  </span>
                                                              </div>
                                                            </div>
                                                        </div>
                                                  </div>
                                              
                                                    <!--date piker script -->
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#datetimepickerdate3').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $('#datetimepickerdate4').datetimepicker({ format: 'YYYY-MM-DD' });
                                                            $("#datetimepickerdate3").on("dp.change", function (e) {
                                                                $('#datetimepickerdate4').data("DateTimePicker").minDate(e.date);
                                                            });
                                                            $("#datetimepickerdate4").on("dp.change", function (e) {
                                                                //$('#datetimepickerdate1').data("DateTimePicker").maxDate(e.date);
                                                            });
                                                        });
                                                    </script><!--date piker script -->

                                                 
                                                   
                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertPromo" value="Insert_Promo" name="PromoButtons" class="btn btn-success">Save New Promo</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->

                                                  <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form supplier-->


                                            <div role="tabpanel" class="tab-pane" id="suppList"> <!-- Start supplier list-->

                                                <header class="encabezado"><h2 class="md-display-2">Promotions List.</h2><p></p></header>

                                                <center>


                                                  <div id="AJAX_Container1">
            
                                                                 <% Html.RenderPartial("PromotionsTable", Model)%>
                                                                    
                                                   </div>


                                                </center>

                                            </div><!--end supplier list--> 

                                      <div class="clear"></div>  
                                    </div><!--end tabs add supplier list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Supplier section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->  


</asp:Content>
