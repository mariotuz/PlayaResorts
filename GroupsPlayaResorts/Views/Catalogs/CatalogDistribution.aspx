<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogDistributionGroup)" %>

<asp:Content ID="CatalogChannelTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Distribution Groups
</asp:Content>


<asp:Content ID="CatalogChannelContent" ContentPlaceHolderID="MainContent" runat="server">

     <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">

        function OnSuccess(response) {

            if (response == "Error") {

                $("#newDistribution_head").removeClass("active");
                $("#newDistribution").removeClass("active");

                $("#distributionList_head").addClass("active");
                $("#distributionList").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');


            }
            else {

                $("#newDistribution_head").removeClass("active");
                $("#newDistribution").removeClass("active");

                $("#distributionList_head").addClass("active");
                $("#distributionList").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("DistributionGroupName").value = "";

            }

        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#DistributionModal').modal('hide')
                $('#distributiondeletemodal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

            }
            else {

                $('#DistributionModal').modal('hide')
                $('#distributiondeletemodal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>   ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }

            $('.load-container').fadeOut('slow');

        }

        function OnFailureEdit(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }


        function OnSuccessEditRequest(response) {



            if ($('input[name=DistributionGroupRadio]:checked').length > 0) {

                $('#DistributionModal').modal('show')

            }




        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }



        $(document).ready(function () {
            $('#FormDistributionEdit').on('submit', function () {
                if (!_Validaciones.ValidaObligatorios('FormDistributionEdit')) {
                    return false;
                } else {
                    $('.load-container').fadeIn('slow');
                }
            });

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
              $('#myTab').find('a:first').parent().addClass('active');
              $('#myTab').find('a:first').attr('href');
              $($('#myTab').find('a:first').attr('href')).addClass('active');

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


                          <!-- Start tab distribution Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new distribution list-->
                                        <%
                                            If (ViewData("idseccion4subseccion12new_permission") IsNot Nothing And ViewData("idseccion4subseccion12new_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""newDistribution_head""><a href=""#newDistribution"" aria-controls=""newDistribution"" role=""tab"" data-toggle=""tab"">Add New Distribution Group</a></li>")
                                            End If
                                            
                                            If (ViewData("idseccion4subseccion12consult_permission") IsNot Nothing And ViewData("idseccion4subseccion12consult_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""distributionList_head""><a href=""#distributionList"" aria-controls=""distributionList"" role=""tab"" data-toggle=""tab"">Distribution Groups List</a></li>")
                                            End If
                                        %>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Cdistribution list sections-->

                                            <div role="tabpanel" class="tab-pane" id="newDistribution"><!--Star tab form distribution-->

                                                <% Using Ajax.BeginForm("CatalogDistribution", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>

                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                     <%: Html.ValidationMessageFor(Function(m) m.DistributionGroupName)%>
                                               
                                                    <div class="clear"></div>
                                                </div> 

                                                <header class="encabezado"><h2 class="md-display-2">Add New Distribution Group.</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Distribution Group Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%--<input type="text" id="groupname" name="groupname" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>

                                                          <%: Html.TextBoxFor(Function(m) m.DistributionGroupName, New With {.class = "form-control input-custom corners-inputs"})%>

                                                        </div>
                                                      </div>


                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Property * <%--<span class="glyphicon glyphicon-warning-sign " aria-hidden="true"></span>--%></small></span>
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

                                                      <div class="clear"></div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">

                                                          <form id="myForm">
                                                            <header class="encabezado"><h2 class="md-display-2">Add email</h2></header>
                                                            <ol>
                                                                <!--row inputs-->
                                                                
                                                                <div style="margin-bottom:4px;" class="clonedInputmail col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                    
                                                                      <li>
                                                                        <!--inputs group-->
                                                                        <div class=" btn-group ">
                                                                          <span><small>Email *</small></span>
                                                                          <input type="text" class="form-control input-custom corners-inputs" name="emailist" /><br>
                                                                        </div>

                                                                        <!--btn delete inputs-->
                                                                        <div style=" margin-top:20px; ">
                                                                          <input type="button" class="btnDelmail btn btn-success" value="Remove" disabled="disabled" />
                                                                        </div>
                                                                      </li>
                                                                    
                                                                </div>
                                                                <!--row inputs-->
                                                              </ol>
                                                                <!--btn add inputs-->
                                                                <div style=" margin-top:5px; ">
                                                                    <input style="background:green !important;" type="button" id="btnAddmail" class="btn btn-success fa fa-plus-circle" value=" Add" />
                                                                </div>
                                                                
                                                            </form>
                                                        </div>
                                                        <div class="clear"></div>

                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertDistributionGroup" value="Insert_DistributionGroup" name="DistributionGroupsButtons" class="btn btn-success">Save New Distribution Group</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->

                                                <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form distribution-->


                                            <div role="tabpanel" class="tab-pane" id="distributionList"> <!-- Start distribution list-->

                                                <header class="encabezado"><h2 class="md-display-2">Distribution Groups List.</h2><p></p></header>
                                                <center>



                                                   <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("DistributionTable", Model)%>
                                                                    
                                                  

                                                   </div>


                                                </center>

                                            </div><!--end distribution list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add distribution list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab distribution section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->    


</asp:Content>
