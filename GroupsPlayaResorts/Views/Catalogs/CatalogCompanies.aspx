<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogCompanies)" %>


<asp:Content ID="CatalogCompaniesTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Companies</asp:Content>


<asp:Content ID="CatalogCompaniesContent" ContentPlaceHolderID="MainContent" runat="server">
    
     <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <script type="text/javascript">


        function OnSuccess(response) {

            if (response == "Error") {

                $("#newcmp_head").removeClass("active");
                $("#newcmp").removeClass("active");


                $("#companylist_head").addClass("active");
                $("#companylist").addClass("active");

                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


            }
            else {

                $("#newcmp_head").removeClass("active");
                $("#newcmp").removeClass("active");


                $("#companylist_head").addClass("active");
                $("#companylist").addClass("active");

                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);
                document.getElementById("CompanieName").value = ""
                document.getElementById("CompanieKey").value = ""

            }

        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#companyModal').modal('hide')
                $('#companydeletemodal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');

            }
            else {

                $('#companyModal').modal('hide')
                $('#companydeletemodal').modal('hide')
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

            if ($('input[name=CompanyRadio]:checked').length > 0) {

                $('#companyModal').modal('show')

            }



        }

        function OnFailureEditRequest(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>');


        }

        function ValidaFormCompany(_idform) {
            if (!_Validaciones.ValidaObligatorios(_idform)) {
                return false;
            } else {
                $('#EditCompany').click();
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



                          <!-- Start tab Companies Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new company list of users-->
                                      <li role="presentation" id="newcmp_head" class="active"><a href="#newcmp" aria-controls="newcmp" role="tab" data-toggle="tab">Add New Company</a></li>
                                      <li role="presentation" id="companylist_head" ><a href="#companylist" aria-controls="companylist" role="tab" data-toggle="tab">Companies List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add company list sections-->

                                        

                                            <div role="tabpanel" class="tab-pane active" id="newcmp"><!--Star tab form copmanywholesale-->

                                                
                                            <% Using Ajax.BeginForm("CatalogCompanies", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>   


                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                      <%: Html.ValidationMessageFor(Function(m) m.CompanieName)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.CompanieKey)%>


                                                    <div class="clear"></div>
                                                </div> 

                                                


                                                <header class="encabezado"><h2 class="md-display-2">Add New Company</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Company Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <%: Html.TextBoxFor(Function(m) m.CompanieName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Key Company *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                          <%: Html.TextBoxFor(Function(m) m.CompanieKey, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>
                                                      

                                                     <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>IATA *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                          <input type="text" id="CompanieIATA" name="CompanieIATA" class="form-control input-custom corners-inputs" placeholder="" >
                                                        </div>
                                                      </div>


                                                     <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Zip Code *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                         <input type="text" id="CompanieZipCode" name="CompanieZipCode" class="form-control input-custom corners-inputs" placeholder="" >
                                                        </div>
                                                      </div>
                                                       

                                                    <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Country * <%--<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>--%></small></span>
                                                           <select class="selectpicker" name="companycountry" id="companycountry" data-width="100%">
                                                              <%--<option value="0">Country 1</option>--%>
                                                               <%
                                                                                  Dim i As Integer
                
                                                                                 For i = 0 To Model.ListCountryin.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListCountryin.Item(i).Value%>"><%:Model.ListCountryin.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                              
                                                            </select>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>State *</small></span>
                                                           <select class="selectpicker" name="companystate" id="companystate" data-width="100%">
                                                              <%--<option value="0">State 1</option>--%>
                                                                <%
                                                                                 
                
                                                                    For i = 0 To Model.ListStatein.Count - 1
                                                                                     %>
                                                                                      <option  value="<%:Model.ListStatein.Item(i).Value%>"><%:Model.ListStatein.Item(i).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                             
                                                            </select>
                                                      </div>



                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                  
                                                          <button  id="InsertCompany" value="Insert_Company" name="CompanyButtons" class="btn btn-success">Save New Company</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                                 <% End Using %>


                                              <div class="clear"></div>

                                            </div><!--end tab form company-->


                                            <div role="tabpanel" class="tab-pane" id="companylist"> <!-- Start company list-->

                                                <header class="encabezado"><h2 class="md-display-2">Company List</h2><p> </p></header>
                                                <center>

                                 

                                                      <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("CompaniesTable", Model)%>
                                                                    
                                                  

                                                        </div>



                                                </center>

                                            </div><!--end company list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add company list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab companies section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->  

</asp:Content>
