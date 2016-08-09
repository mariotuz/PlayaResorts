<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogAgencyType)" %>


<asp:Content ID="CatalogChannelTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Agency Type</asp:Content>


<asp:Content ID="CatalogChannelContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">


        function OnSuccess(response) {

            if (response == "Error") {

                $("#newagency_head").removeClass("active");
                $("#newagency").removeClass("active");


                $("#agencyList_head").addClass("active");
                $("#agencyList").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


            }
            else {

                $("#newagency_head").removeClass("active");
                $("#newagency").removeClass("active");


                $("#agencyList_head").addClass("active");
                $("#agencyList").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("AgencyTypeName").value = ""
            }

        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#agnecyModal').modal('hide')
                $('#agencytypedeletemodal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


            }
            else {
                $('#agnecyModal').modal('hide')
                $('#agencytypedeletemodal').modal('hide')
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

            if ($('input[name=AgencyTypeRadio]:checked').length > 0) {

                $('#agnecyModal').modal('show')

            }



        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


        }

        function ValidaFormAGT(_idform) {
            if (!_Validaciones.ValidaObligatorios(_idform)) {
                return false;
            } else {
                $('#EditAgencyType').click();
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" id="Div1">


                        <div class="clear"></div>
                    </div>
               <!--Notification success alert--> 
                                                        

          <!-- Keep all page content within the page-content inset div! -->
          <div class="page-content inset"><!--Start page content-->


              <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                      

                          <!-- Start tab Agnecy Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new Agency list-->
                                      <li role="presentation" id="newagency_head" class="active"><a href="#newagency" aria-controls="newagency" role="tab" data-toggle="tab">Add New Agency Type</a></li>
                                      <li role="presentation" id="agencyList_head" ><a href="#agencyList" aria-controls="agencyList" role="tab" data-toggle="tab">Agency List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Agency list sections-->


                                         <!--Notification success alert-->
                                                 <div id="AlertContent"> </div>
                                                <!--Notification success alert-->


                                            <div role="tabpanel" class="tab-pane active" id="newagency"><!--Star tab form agency-->

                                            <% Using Ajax.BeginForm("CatalogAgencyType", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>   


                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                       <%: Html.ValidationMessageFor(Function(m) m.AgencyTypeName)%>


                                                    <div class="clear"></div>
                                                </div> 


                                                <header class="encabezado"><h2 class="md-display-2">Add New Agency Type</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Agency Type Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                         
                                                            <%: Html.TextBoxFor(Function(m) m.AgencyTypeName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                        </div>
                                                      </div>

                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertAgencyType" value="Insert_AgencyType" name="AgencyTypeButtons" class="btn btn-success">Save New Agency Type</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                                    <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form agency-->


                                            <div role="tabpanel" class="tab-pane" id="agencyList"> <!-- Start Agency list-->

                                                <header class="encabezado"><h2 class="md-display-2">Agencies List.</h2><p></p></header>



                                                <center>


                                                            <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("AgencyTypeTable", Model)%>
                                                                    
                                                  

                                                        </div>

                                                 
                                                </center>

                                            </div><!--end agency list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add agency list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Agency section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->    


</asp:Content>
