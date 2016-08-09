<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogContacts)" %>

<asp:Content ID="CatalogContactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Contacts</asp:Content>


<asp:Content ID="CatalogContactContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>


      <script type="text/javascript">

          $(document).ready(function () {

              $('#FormEditContact').on('submit', function () {
                  if (!_Validaciones.ValidaObligatorios('FormEditContact')) {
                      return false;
                  } else {
                      $('.load-container').fadeIn('slow');
                  }
              });

              $('#ContactWhosaleCompany').autocomplete({
                  source: function (request, response) {
                      $.ajax({
                          url: '<%: Url.Action("WhosaleListCompany") %>',
                          dataType: "json",
                          contentType: 'application/json, charset=utf-8',
                          data: {
                              search: $("#ContactWhosaleCompany").val()
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




          });

    </script>


        <script type="text/javascript">


            function OnSuccess(response) {

                if (response == "Error") {

                    $("#newcontacts_head").removeClass("active");
                    $("#newcontacs").removeClass("active");


                    $("#contactList_head").addClass("active");
                    $("#contactList").addClass("active");

                    $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


                }
                else {

                    $("#newcontacts_head").removeClass("active");
                    $("#newcontacs").removeClass("active");


                    $("#contactList_head").addClass("active");
                    $("#contactList").addClass("active");

                    $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                    $("#AlertContent").show();
                    window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                    document.getElementById("ContactName").value = ""
                    document.getElementById("ContactEmail").value = ""
                    document.getElementById("ContactPhone").value = ""
                    document.getElementById("phonedos").value = ""
                    document.getElementById("ContactWhosaleCompany").value = ""


                }

            }

            function OnFailure(response) {

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

            }

            function OnBegin() { }

            function OnComplete() { }



            function OnSuccessEdit(response) {

                if (response == "Error") {

                    $('#contactModal').modal('hide')
                    $('#contactdeletemodal').modal('hide')
                    $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

                }
                else {

                    $('#contactModal').modal('hide')
                    $('#contactdeletemodal').modal('hide')
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

                if ($('input[name=ContactRadio]:checked').length > 0) {

                    $('#contactModal').modal('show')

                }



            }

            function OnFailureEditRequest(response) {

                $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


            }






    </script>


      <script type="text/javascript">


          $(document).ready(function () {
              $('#FormEditGroup').on('submit', function () {
                  if (!_Validaciones.ValidaObligatorios()) {
                      return false;
                  } else {
                      $('.load-container').fadeIn('slow');
                  }
              });

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

                    

                          <!-- Start tab Contacts Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new Contact list-->
                                      <li role="presentation" id="newcontacts_head" class="active"><a href="#newcontacs" aria-controls="newcontacs" role="tab" data-toggle="tab">Add New Contact</a></li>
                                      <li role="presentation" id="contactList_head" ><a href="#contactList" aria-controls="contactList" role="tab" data-toggle="tab">Contact List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add contact list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newcontacs"><!--Star tab form contact-->

                    <% Using Ajax.BeginForm("CatalogContacts", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>   


                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                      <%: Html.ValidationMessageFor(Function(m) m.ContactName)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.ContactEmail)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.ContactPhone)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.ContactWhosaleCompany)%>

                                                    <div class="clear"></div>
                                                </div>

                                                <header class="encabezado"><h2 class="md-display-2">Add New Contact</h2><p>.</p></header>


                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Contact Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <%: Html.TextBoxFor(Function(m) m.ContactName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>E-mail *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.ContactEmail, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Telephone 1</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <%: Html.TextBoxFor(Function(m) m.ContactPhone, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Telephone 2</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" id="phonedos" name="phonedos" class="form-control input-custom corners-inputs" placeholder="" >
                                                          
                                                        </div>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Contact type *</small></span>
                                                           <select class="selectpicker" name="ContactType" id="ContactType" data-width="100%">
                                                              
                                                              <option value="1">Wholesale</option>
                                                              <option value="0">Company</option>
                                                            </select>

                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small> Wholesale / Company </small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        <input type="text" id="ContactWhosaleCompany" name="ContactWhosaleCompany" class="form-control input-custom corners-inputs" placeholder="" >
                                                  
                                                        </div>
                                                      </div>
                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button  id="InsertContact" value="Insert_Contact" name="ContactButtons" class="btn btn-success">Save New Contact</button>
                                                      </div>


                                                   <div class="clear"></div>
                                                </div><!--end form-->



                     <% End Using %>

                                              <div class="clear"></div>

                                            </div><!--end tab form contact-->


                                            <div role="tabpanel" class="tab-pane" id="contactList"> <!-- Start contact list-->

                                                <header class="encabezado"><h2 class="md-display-2">Contacts List</h2><p>.</p></header>
                                                <center>

                                                      <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("ContactsTable", Model)%>
                                                                    
                                                  

                                                        </div>

                                                </center>

                                            </div><!--end conatc list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add contact list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Contacts section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->    



</asp:Content>
