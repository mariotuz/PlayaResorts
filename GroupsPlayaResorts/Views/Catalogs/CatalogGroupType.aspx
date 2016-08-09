<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogGroupType)" %>

<asp:Content ID="CatalogGroupTypeTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Group Type</asp:Content>

<asp:Content ID="CatalogGroupTypeContent" ContentPlaceHolderID="MainContent" runat="server">

    
     <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">


        function OnSuccess(response) {

            if (response == "Error") {

                $("#newgroup_head").removeClass("active");
                $("#newgroup").removeClass("active");

                $("#grouplist_head").addClass("active");
                $("#grouplist").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');

                document.getElementById("GroupTypeName").value = ""

            }

            else {

                $("#newgroup_head").removeClass("active");
                $("#newgroup").removeClass("active");

                $("#grouplist_head").addClass("active");
                $("#grouplist").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("GroupTypeName").value = ""
            }



        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#groupTypeModal').modal('hide')
                $('#grouptypedeletemodal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');

            }

            else {

                $('#groupTypeModal').modal('hide')
                $('#grouptypedeletemodal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

                $('.load-container').fadeOut('slow');
            }



        }

        function OnFailureEdit(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }


        function OnSuccessEditRequest(response) {

            if ($('input[name=GroupTypeRadio]:checked').length > 0) {

                $('#groupTypeModal').modal('show')

            }



        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


        }

        function ValidEditGT(_idform) {
            if (!_Validaciones.ValidaObligatorios(_idform)) {
                return false;
            } else {
                $('#EditGroupType').click();
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

              

                          <!-- Start tab Group Type Section-->
                          <div class="bhoechie-tab-content active">

                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs"  role="tablist" id="myTab"><!--menu tab new group type list of users-->
                                      <li role="presentation" id="newgroup_head" class="active"><a href="#newgroup" aria-controls="newgroup" role="tab" data-toggle="tab">Add New Group Type</a></li>
                                      <li role="presentation" id="grouplist_head" ><a href="#grouplist" aria-controls="grouplist" role="tab" data-toggle="tab">Group Types List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add group type list sections-->

                                      


                                            <div role="tabpanel" class="tab-pane active" id="newgroup"><!--Star tab form group type-->

                                            <% Using Ajax.BeginForm("CatalogGroupType", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>   


                                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                     <%: Html.ValidationMessageFor(Function(m) m.GroupTypeName)%>


                                                    <div class="clear"></div>
                                                </div> 

                                                 
                                         
                                                
                                                <header class="encabezado"><h2 class="md-display-2">Add New Group Type</h2><p></p></header>


                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Group Type Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.GroupTypeName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                        </div>
                                                      </div>
                                                      
                                                     <div class="clear"></div><br />

                                                      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                                    <span><small> Special Concessions Social Groups </small></span><br>
                                                                    <textarea id="specialData" name="specialData" rows="15" cols="200" placeholder=""></textarea>
                                                                     
                                                                  </div>


                                                      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                                    <span><small> Special Concessions MICE Groups </small></span><br>
                                                                    <textarea id="specialDataMICE" name="specialDataMICE" rows="15" cols="200" placeholder=""></textarea>
                                                                     
                                                                  </div>

                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertGroupType" value="Insert_GroupType" name="GroupTypeButtons" class="btn btn-success">Save New Group Type</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                                 <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form group type-->


                                            <div role="tabpanel" class="tab-pane" id="grouplist"> <!-- Start Group Type list-->

                                                <header class="encabezado"><h2 class="md-display-2">Group Types List</h2><p></p></header>
                                                <center>


                                                        <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("GroupTypeTable", Model)%>
                                                                    
                                                  

                                                        </div>



                                                 
                                                </center>

                                            </div><!--end Group Type list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add group type list sections-->

                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>

                          </div>
                          <!-- enda tab Group Type section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->   

</asp:Content>
