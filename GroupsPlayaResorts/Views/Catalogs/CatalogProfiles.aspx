<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogProfile)" %>

<asp:Content ID="CatalogProfilesTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Profiles
</asp:Content>


<asp:Content ID="CatalogProfilesContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">

        function OnSuccess(response) {

            if (response == "Error") {

                $("#newprofile_head").removeClass("active");
                $("#newprofile").removeClass("active");


                $("#profilelist_head").addClass("active");
                $("#profilelist").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

            }
            else {

                $("#newprofile_head").removeClass("active");
                $("#newprofile").removeClass("active");


                $("#profilelist_head").addClass("active");
                $("#profilelist").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');

                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("ProfileName").value = ""
                

            }

        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#measurelModal').modal('hide')
                $('#measuredeletemodal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');


            }
            else {

                $('#measurelModal').modal('hide')
                $('#measuredeletemodal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>   ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }

        }

        function OnFailureEdit(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }


        function OnSuccessEditRequest(response) {



            if ($('input[name=UnitMeasureRadio]:checked').length > 0) {

                $('#measurelModal').modal('show')

            }




        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }



        $(document).ready(function () {

            $('#EditMeasureClose').click(function (e) {
                $('#AlertContentEdit').html('')
            })


            $('#EditMeasureCloseCircule').click(function (e) {
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

                  <div class="bhoechie-tab-content"> <!-- start tab Users section -->
                  </div><!--end tab User sections-->


                          <!-- Start tab Profile section -->
                          <div class="bhoechie-tab-content active">
                                <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 124-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new user & list of users-->
                                      <li role="presentation" id="newprofile_head" class="active"><a href="#newprofile" aria-controls="newprofile" role="tab" data-toggle="tab">Add New Profile</a></li>
                                      <li role="presentation" id="profilelist_head"><a href="#profilelist" aria-controls="profilelist" role="tab" data-toggle="tab">Profiles List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add profile list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newprofile"><!--Star tab form user-->


                                                <% Using Ajax.BeginForm("CatalogProfiles", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>
                                                 
                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                     <%: Html.ValidationMessageFor(Function(m) m.ProfileName)%>
                                              


                                                    <div class="clear"></div>
                                                </div>


                                                <header class="encabezado"><h2 class="md-display-2">Add Profile</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Profile Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%--<input type="text" class="form-control input-custom corners-inputs" name="profilename" id="profilename" placeholder="" >--%>
                                                         <%-- <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                            <%: Html.TextBoxFor(Function(m) m.ProfileName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>


                                                      <div id="" class="permissions col-xs-12 col-sm-12 col-md-12 col-lg-12" > <!-- Start section permissions -->
                                                        <span><small>Permissions </small></span>
                                                      
                                                              <!-- Nav tabs prms-->
                                                              <div role="tabpanel"> <!--start tabs permission menu-->
                                                                  <ul class="nav nav-tabs tabs-promos" role="tablist" >
                                                                    <li role="presentation" class=" col-xs-6 col-md-3 active"><a href="#prms-profile-group" aria-controls="rates" role="tab" data-toggle="tab">Group</a></li>
                                                                    <li role="presentation" class=" col-xs-6 col-md-3"><a href="#prms-profile-events" aria-controls="pays" role="tab" data-toggle="tab">Events</a></li>
                                                                    <li role="presentation" class=" col-xs-6 col-md-3"><a href="#prms-profile-pay" aria-controls="pays" role="tab" data-toggle="tab">Payments</a></li>
                                                                    <li role="presentation" class=" col-xs-6 col-md-3"><a href="#prms-profile-catalogs" aria-controls="pays" role="tab" data-toggle="tab">Catalogs</a></li>
                                                                  </ul>

                                                              <!-- Start all tab permissions -->
                                                              <div class="tab-content">

                                                                        <div role="tabpanel" class="tab-pane active" id="prms-profile-group"><!-- Start Tab permission Profile --> 
                                                                                   
                                                                             
                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>General View </p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Document & formats</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" value="5"><label class="check"></label><span>Upload</span></div>
                                                                                  <%--<div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>--%>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Breakdown</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                               <%-- <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Payments</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                                </div>--%>
                                                                                
                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>LogBook</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permlogbook" value="1"><label class="check"></label><span>New</span></div>
                                                                                <%--  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>--%>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permlogbook" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                             
                                                                              <div class="clear"></div>
                                                                          
                                                                        </div><!-- end Tab permission Profile -->

                                                                        <div role="tabpanel" class="tab-pane" id="prms-profile-events"><!-- Start Tab permission events -->

                                                                               

                                                                            <%--    <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Events List</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                                </div>--%>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Event</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Add Services/Product</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                         <%--       <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Salon block</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                                </div>--%>

                                                                              
                                                                              <div class="clear"></div>

                                                                        </div><!-- end Tab permission events -->

                                                                        <div role="tabpanel" class="tab-pane" id="prms-profile-pay"><!-- Start Tab permission Payments -->

                                                                             

                                                                              <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                <p>Payments </p><br>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" value="1"><label class="check"></label><span>New</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" value="6"><label class="check"></label><span>Validate</span></div>
                                                                              </div>

                                                                             <%-- <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                <p>New Payment</p><br>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                              </div>--%>

                                                                           

                                                                            <div class="clear"></div>

                                                                        </div><!-- end Tab permission Payments -->

                                                                        <div role="tabpanel" class="tab-pane" id="prms-profile-catalogs"><!-- Start Tab permission Catalogs -->

                                                                          

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Users</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Profiles</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                           <%-- <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Properties/Destinations</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                            </div>--%>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Markets</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Group Types</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Promotions</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Companies</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Contacts</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Products/Services</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Channels</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Agency Types</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Suppliers</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Distribution Groups</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Units Measure</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                          

                                                                          <div class="clear"></div>

                                                                        </div><!-- end Tab permission Catalogs -->


                                                                        </div> <!--end all tabs permissions-->

                                                                      </div><!--end tabs permission menu-->

                                                      </div><!-- end section permissions -->
                                                      

                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertProfile" value="Insert_Profile" name="ProfileButtons" class="btn btn-success">Save New Profile</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                                 <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form user-->


                                            <div role="tabpanel" class="tab-pane" id="profilelist"> <!-- Start users list-->

                                                <header class="encabezado"><h2 class="md-display-2">Profiles List</h2><p> </p></header>
                                                <center>

                                                 
                                                     <div id="AJAX_Container1">

                                                                          
                                                                 <% Html.RenderPartial("ProfileTable", Model)%>
                                                                    
                                                  
                                                        </div>

                                                </center>

                                            </div><!--end users list--> 


                                      <div class="clear"></div>  
                                    </div><!--end tabs add profile list sections-->
                                </div><!--end tabs-panel 124-->

                              <div class="clear"></div>
                          </div><!-- end tab Profile section -->
              
                          <!-- hotel search -->
                          <div class="bhoechie-tab-content">
                              <center>
                                <h1 class="glyphicon glyphicon-home" style="font-size:12em;color:#55518a"></h1>
                                <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                <h3 style="margin-top: 0;color:#55518a">Hotel Directory</h3>
                              </center>
                          </div>

                          <div class="bhoechie-tab-content">
                              <center>
                                <h1 class="glyphicon glyphicon-cutlery" style="font-size:12em;color:#55518a"></h1>
                                <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                <h3 style="margin-top: 0;color:#55518a">Restaurant Diirectory</h3>
                              </center>
                          </div>

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
