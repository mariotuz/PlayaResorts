<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogMarket)" %>

<asp:Content ID="CatalogMarketsTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Markets</asp:Content>


<asp:Content ID="CatalogMarketContent" ContentPlaceHolderID="MainContent" runat="server">

     
    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>

   

    <script type="text/javascript">


        function OnSuccess(response) {

            if (response == "Error") {

                $("#newmarket_head").removeClass("active");
                $("#newmarket").removeClass("active");

                $("#marketlist_head").addClass("active");
                $("#marketlist").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

            }
            else {

                $("#newmarket_head").removeClass("active");
                $("#newmarket").removeClass("active");

                $("#marketlist_head").addClass("active");
                $("#marketlist").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("MarketName").value = ""
                document.getElementById("MarketKey").value = ""

            }

        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#marketModal').modal('hide')
                $('#marketdeletemodal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

            }
            else {

                $('#marketModal').modal('hide')
                $('#marketdeletemodal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
            }
            $('.load-container').fadeOut('slow');

        }

        function OnFailureEdit(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }


        function OnSuccessEditRequest(response) {

            if ($('input[name=MarketRadio]:checked').length > 0) {

                $('#marketModal').modal('show')

            }



        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


        }


        function ValidaFormMarket(_idform) {
            if (!_Validaciones.ValidaObligatorios(_idform)) {
                return false;
            } else {
                $('#EditMarket').click();
                $('.load-container').fadeIn('slow');
            }
        }


        $(document).ready(function () {

            $('#EditClose').click(function (e) {
                $('#AlertContentEdit').html('')
            })


            $('#EditCloseCircule').click(function (e) {
                $('#AlertContentEdit').html('')
            })


        });


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


                          <!-- Start tab Market section-->
                          <div class="bhoechie-tab-content active">

                                <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new Market list of users-->
                                      <li role="presentation" id="newmarket_head" class="active"><a href="#newmarket" aria-controls="newmarket" role="tab" data-toggle="tab">Add New Market</a></li>
                                      <li role="presentation" id="marketlist_head"><a href="#marketlist" aria-controls="marketlist" role="tab" data-toggle="tab">Markets List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add market list sections-->

                                         

                                            <div role="tabpanel" class="tab-pane active" id="newmarket"><!--Star tab form Market-->

                                               


                                              <% Using Ajax.BeginForm("CatalogMarkets", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "FormAddMarket"})%>   


                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                      <%: Html.ValidationMessageFor(Function(m) m.MarketName)%>
                                                 <%: Html.ValidationMessageFor(Function(m) m.MarketKey)%>


                                                    <div class="clear"></div>
                                                </div> 

                                                



                                                <header class="encabezado"><h2 class="md-display-2">Add New Market</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Market Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%--<input type="text" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                             <%: Html.TextBoxFor(Function(m) m.MarketName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Key Market*</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        <%--  <input type="text" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                             <%: Html.TextBoxFor(Function(m) m.MarketKey, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>
                                                      

                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button  id="InsertMarket" value="Insert_Market" name="MarketButtons" class="btn btn-success">Save New Market</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->

                                                <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form Market-->


                                            <div role="tabpanel" class="tab-pane" id="marketlist"> <!-- Start Market list-->

                                                <header class="encabezado"><h2 class="md-display-2">Markets List</h2><p> </p></header>

                                                <center>

                                                         <div id="AJAX_Container1">

                                                                          
                                                 
                                                                  <% Html.RenderPartial("MarketsTable", Model)%>  
                                                                   
                                                  

                                                        </div>

                                              
                                                 
                                                 
                                                </center>

                                                
                                            </div><!--end Market list--> 


                                      <div class="clear"></div>  

                                         
                                    </div><!--end tabs add market list sections-->

                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- end tab market section-->

                          <div class="bhoechie-tab-content">
                              <center>
                                <h1 class="glyphicon glyphicon-credit-card" style="font-size:12em;color:#55518a"></h1>
                                <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                <h3 style="margin-top: 0;color:#55518a">Credit Card</h3>
                              </center>
                          </div>

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->  

</asp:Content>
