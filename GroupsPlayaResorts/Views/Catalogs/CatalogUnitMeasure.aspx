<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogDetail)" %>

<asp:Content ID="CatalogChannelTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Units Measure</asp:Content>


<asp:Content ID="CatalogChannelContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">

        function OnSuccess(response) {

            if (response == "Error") {

                $("#newMeasure_head").removeClass("active");
                $("#newMeasure").removeClass("active");


                $("#measureList_head").addClass("active");
                $("#measureList").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

            }
            else {

                $("#newMeasure_head").removeClass("active");
                $("#newMeasure").removeClass("active");


                $("#measureList_head").addClass("active");
                $("#measureList").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div> ');

                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("UnitMeasure").value = ""
                document.getElementById("UnitKey").value = ""

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

            $('.load-container').fadeOut('slow');

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
            $('#FormUnitsEdit').on('submit', function () {
                if (!_Validaciones.ValidaObligatorios('FormUnitsEdit')) {
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



                          <!-- Start tab measure Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                      

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new measure list-->
                                        <%
                                            If (ViewData("idseccion4subseccion13new_permission") IsNot Nothing and ViewData("idseccion4subseccion13new_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""newMeasure_head""><a href=""#newMeasure"" aria-controls=""newMeasure"" role=""tab"" data-toggle=""tab"">Add New Unit Measure </a></li>")
                                            End If
                                            
                                            If (ViewData("idseccion4subseccion13consult_permission") IsNot Nothing And ViewData("idseccion4subseccion13consult_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""measureList_head""><a href=""#measureList"" aria-controls=""measureList"" role=""tab"" data-toggle=""tab"">List Units Measure</a></li>")
                                            End If
                                        %>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add measure list sections-->

                                         
                                            <div role="tabpanel" class="tab-pane" id="newMeasure"><!--Star tab form measure-->

                                            <% Using Ajax.BeginForm("CatalogUnitMeasure", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>

                                                 
                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                     <%: Html.ValidationMessageFor(Function(m) m.UnitMeasure)%>
                                                     <%: Html.ValidationMessageFor(Function(m) m.UnitKey)%>


                                                    <div class="clear"></div>
                                                </div> 
                                               
                     
                                                <header class="encabezado"><h2 class="md-display-2">Add New Measure</h2><p> </p></header>


                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">


                                                            
                                                                <span><small>Unit Measure *</small></span>
                                                                <div class="input-group  btn-group col-xs-12 col-md-12">
                                                                  <%--<input type="text" class="form-control input-custom corners-inputs" id="UnitMeasure" name="UnitMeasure"  placeholder="" >--%>
                                                                  <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                                     <%: Html.TextBoxFor(Function(m) m.UnitMeasure, New With {.class = "form-control input-custom corners-inputs"})%>
                                                                </div>
                                                            

                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">

                                                         
                                                            <span><small>Unit Key *</small></span>
                                                            <div class="input-group  btn-group col-xs-12 col-md-12">
                                                            <%--  <input type="text" class="form-control input-custom corners-inputs" id="UnitKey" name="UnitKey" placeholder="" >--%>

                                                              <%: Html.TextBoxFor(Function(m) m.UnitKey, New With {.class = "form-control input-custom corners-inputs"})%>
                                                            </div>

                                                            

                                                      </div>

                                               
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                                        <br>

                                                        <button id="InsertMeasure" value="Insert_Measure" name="UnitMeasureButtons" class="btn btn-success">Save New Measure</button>
              
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                                    <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form measure-->


                                            

                                            <div role="tabpanel" class="tab-pane" id="measureList"> <!-- Start measure list-->

                                              

                                                <header class="encabezado"><h2 class="md-display-2">List Units Measure </h2><p> </p></header>

                                                <center>

                                           
                                                         <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("UnitMeasureTable", Model)%>
                                                                    
                                                  

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
