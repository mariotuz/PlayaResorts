<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogSupplier)" %>



<asp:Content ID="CatalogChannelTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Suppliers
</asp:Content>


<asp:Content ID="CatalogChannelContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



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
                document.getElementById("SupplierName").value = "";
                document.getElementById("SupplierEmail").value = "";
                document.getElementById("SupplierCity").value = "";
                document.getElementById("SupplierPhone1").value = "";
                document.getElementById("SupplierPhone2").value = "";
                document.getElementById("SupplierRFC").value = "";
                document.getElementById("supplieraddress").value = "";

            }
        }

        function OnFailure(response) {

            $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }

        function OnBegin() { }

        function OnComplete() { }



        function OnSuccessEdit(response) {

            if (response == "Error") {

                $('#supplierModal').modal('hide')
                $('#deletesupplierModal').modal('hide')
                $('#AlertContent').html('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');
               

            }
            else {

                $('#supplierModal').modal('hide')
                $('#deletesupplierModal').modal('hide')
                $('#AlertContent').html(' <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-success alert-dismissible fade in"  id="AlertSucess" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Good job!</strong> Your request has been saved successfully.</div>   ');
                $("#AlertContent").show();
                window.setTimeout(function () { $("#AlertContent").hide("slow") }, 2000);

            }

        }

        function OnFailureEdit(response) {

            $('#AlertContent').html('   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>Error!</strong> We have a service errror please try again. </div>   ');

        }


        function OnSuccessEditRequest(response) {



            if ($('input[name=SupplierRadio]:checked').length > 0) {

                $('#supplierModal').modal('show')

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

                          
                          <!-- Start tab Supplier Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new supplier list-->
                                      <li role="presentation" id="newsupp_head" class="active"><a href="#newsupp" aria-controls="newsupp" role="tab" data-toggle="tab">Add New Supplier</a></li>
                                      <li role="presentation" id="suppList_head" ><a href="#suppList" aria-controls="suppList" role="tab" data-toggle="tab">Supplier List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Supplier list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newsupp"><!--Star tab form supplier-->

                                                 <% Using Ajax.BeginForm("CatalogSupplier", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"})%>

                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierName)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierEmail)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierCity)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierPhone1)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierPhone2)%>
                                                      <%: Html.ValidationMessageFor(Function(m) m.SupplierRFC)%>
                                               
                                                    <div class="clear"></div>
                                                </div> 

                                                <header class="encabezado"><h2 class="md-display-2">Add New Supplier.</h2><p></p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Supplier Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        <%--  <input type="text" class="form-control input-custom corners-inputs" placeholder="" >--%>
                                                          <%--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>--%>
                                                            <%: Html.TextBoxFor(Function(m) m.SupplierName, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>RFC Supplier *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.SupplierRFC, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Email *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.SupplierEmail, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Telephone 1 *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <%: Html.TextBoxFor(Function(m) m.SupplierPhone1, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Telephone 2 *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <%: Html.TextBoxFor(Function(m) m.SupplierPhone2, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Country * <%--<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>--%></small></span>
                                                           <select class="selectpicker" name="suppliercountry" id="suppliercountry" data-width="100%">
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
                                                           <select class="selectpicker" name="supplierstate" id="supplierstate" data-width="100%">
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

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>City *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <%: Html.TextBoxFor(Function(m) m.SupplierCity, New With {.class = "form-control input-custom corners-inputs"})%>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Address *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                           <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="supplieraddress" name="supplieraddress"  rows="3" cols="50" ></textarea>
                                                        </div>
                                                      </div>

                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="InsertSupplier" value="Insert_Supplier" name="SupplierButtons" class="btn btn-success">Save New Supplier</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->

                                                  <% End Using %>

                                              <div class="clear"></div>
                                            </div><!--end tab form supplier-->


                                            <div role="tabpanel" class="tab-pane" id="suppList"> <!-- Start supplier list-->

                                                <header class="encabezado"><h2 class="md-display-2">Supplier List.</h2><p></p></header>

                                                <center>


                                                     <div id="AJAX_Container1">

                                                                          
                                                 
                                                                 <% Html.RenderPartial("SupplierTable", Model)%>
                                                                    
                                                  

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
