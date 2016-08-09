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
        function CheckPermissions(_input2) {
            var arrayPermission = [
                    { input: "permgeneralview", idseccion: "1", idsubseccion: "1" },
                    { input: "permdocuments", idseccion: "1", idsubseccion: "2" },
                    { input: "permbreak", idseccion: "1", idsubseccion: "3" },
                    { input: "permlogbook", idseccion: "1", idsubseccion: "4" },
                    { input: "permevent", idseccion: "2", idsubseccion: "1" },
                    { input: "permservicesandproducts", idseccion: "2", idsubseccion: "2" },
                    { input: "permpayments", idseccion: "3", idsubseccion: "1" },
                    { input: "permusers", idseccion: "4", idsubseccion: "1" },
                    { input: "permprofiles", idseccion: "4", idsubseccion: "2" },
                    { input: "permmarkets", idseccion: "4", idsubseccion: "3" },
                    { input: "permgrouptypes", idseccion: "4", idsubseccion: "4" },
                    { input: "permpromotions", idseccion: "4", idsubseccion: "5" },
                    { input: "permcompanies", idseccion: "4", idsubseccion: "6" },
                    { input: "permcontacts", idseccion: "4", idsubseccion: "7" },
                    { input: "permservicesandproductscat", idseccion: "4", idsubseccion: "8" },
                    { input: "permchannels", idseccion: "4", idsubseccion: "9" },
                    { input: "permagencytypes", idseccion: "4", idsubseccion: "10" },
                    { input: "permsuppliers", idseccion: "4", idsubseccion: "11" },
                    { input: "permdistribution", idseccion: "4", idsubseccion: "12" },
                    { input: "permunitsmeasure", idseccion: "4", idsubseccion: "13" }
            ]

            if (_input2) {
                $('#frmProfileEdit').find('#DivPermisos').html('');
            } else {
                $('#DivPermisos').html('');
            }

            var xmlpermissions = '';

            for (var i = 0; i < arrayPermission.length; i++) {
                var inputPermisoActual = arrayPermission[i].input;
                var idseccion = arrayPermission[i].idseccion;
                var idsubseccion = arrayPermission[i].idsubseccion;
                var arraySeccion1Sub1 = (_input2) ? $('#frmProfileEdit').find('input[name="' + inputPermisoActual + '"]') : $('input[name="' + inputPermisoActual + '"]');

                var valuePermission = '';
                var tienePermiso = 0;

                for (var j = 0; j < arraySeccion1Sub1.length; j++) {
                    if (_input2) {
                        var valActual = ($('#frmProfileEdit').find(arraySeccion1Sub1[j]).is(":checked")) ? $(arraySeccion1Sub1[j]).val() : '';
                    } else {
                        var valActual = ($(arraySeccion1Sub1[j]).is(":checked")) ? $(arraySeccion1Sub1[j]).val() : '';
                    }

                    if (valActual != '')
                        tienePermiso++;

                    if (valActual != '') {
                        if (valuePermission == '')
                            valuePermission = '<seccion idseccion="' + idseccion + '" idsubseccion="' + idsubseccion + '"';

                        switch (valActual) {
                            case "1": valuePermission = valuePermission + ' new_permission="1"'; break;
                            case "2": valuePermission = valuePermission + ' edit_permission="1"'; break;
                            case "3": valuePermission = valuePermission + ' delete_permission="1"'; break;
                            case "4": valuePermission = valuePermission + ' consult_permission="1"'; break;
                            case "5": valuePermission = valuePermission + ' upload_permission="1"'; break;
                            case "6": valuePermission = valuePermission + ' validate_permission="1"'; break;
                        }
                    }
                }

                if (tienePermiso > 0) {
                    valuePermission = valuePermission + '/>';
                    xmlpermissions = xmlpermissions + valuePermission
                }
            }

            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            if (_input2) {
                $('#frmProfileEdit').find('#DivPermisos').append('<input type="hidden" name="xml" value="' + Base64.encode(xmlpermissions) + '"/>');
                $('#UpdateProfileEnd').click();
            } else {
                $('#DivPermisos').append('<input type="hidden" name="xml" value="' + Base64.encode(xmlpermissions) + '"/>');
                $('#InsertProfileEnd').click();
            }
        }

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

                  <div class="bhoechie-tab-content"> <!-- start tab Users section -->
                  </div><!--end tab User sections-->


                          <!-- Start tab Profile section -->
                          <div class="bhoechie-tab-content active">
                                <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 124-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new user & list of users-->
                                        <% 
                                            If (ViewData("idseccion4subseccion2new_permission") IsNot Nothing And ViewData("idseccion4subseccion2new_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""newprofile_head""><a href=""#newprofile"" aria-controls=""newprofile"" role=""tab"" data-toggle=""tab"">Add New Profile</a></li>")
                                            End If
                                      
                                            If (ViewData("idseccion4subseccion2consult_permission") IsNot Nothing And ViewData("idseccion4subseccion2consult_permission") > 0) Then
                                                Response.Write("<li role=""presentation"" id=""profilelist_head""><a href=""#profilelist"" aria-controls=""profilelist"" role=""tab"" data-toggle=""tab"">Profiles List</a></li>")
                                            End If
                                        %>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add profile list sections-->

                                            <div role="tabpanel" class="tab-pane" id="newprofile"><!--Star tab form user-->


                                                <% Using Ajax.BeginForm("CatalogProfiles", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccess", .OnFailure = "OnFailure", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "FormProfile"})%>
                                                 <div id="DivPermisos"></div>
                                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 alert-wrap" > 

                                                     <%: Html.ValidationMessageFor(Function(m) m.ProfileName)%>
                                              


                                                    <div class="clear"></div>
                                                </div>


                                                <header class="encabezado"><h2 class="md-display-2">Add Profile</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->
                                                     <input type="hidden" name="Id_User" value="<%: Session("IDUser")%>" />

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
                                                                                   
                                                                             
                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="1" idsubseccion="1">
                                                                                  <p>General View </p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" permission="deletepermission" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permgeneralview" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="1" idsubseccion="2">
                                                                                  <p>Document & formats</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permdocuments" permission="uploadpermission" value="5"><label class="check"></label><span>Upload</span></div>
                                                                                  <%--<div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>--%>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="1" idsubseccion="3">
                                                                                  <p>Breakdown</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" permission="deletepermission" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permbreak" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                               <%-- <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                                  <p>Payments</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                                </div>--%>
                                                                                
                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="1" idsubseccion="4">
                                                                                  <p>LogBook</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permlogbook" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                <%--  <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>--%>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permlogbook" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
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

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="2" idsubseccion="1">
                                                                                  <p>Event</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" permission="deletepermission" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permevent" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                </div>

                                                                                <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="2" idsubseccion="2">
                                                                                  <p>Add Services/Product</p><br>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" permission="deletepermission" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                  <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproducts" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
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

                                                                             

                                                                              <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="3" idsubseccion="1">
                                                                                <p>Payments </p><br>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" permission="deletepermission" value="3"><label class="check"></label><span>Cancelled</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                                <div class="" style="display:inline-block;"><input type="checkbox" name="permpayments" permission="validatepermission" value="6"><label class="check"></label><span>Validate</span></div>
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

                                                                          

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="1">
                                                                              <p>Users</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permusers" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="2">
                                                                              <p>Profiles</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permprofiles" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                           <%-- <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                                                              <p>Properties/Destinations</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                                                            </div>--%>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="3">
                                                                              <p>Markets</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permmarkets" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="4">
                                                                              <p>Group Types</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permgrouptypes" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="5">
                                                                              <p>Promotions</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permpromotions" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="6">
                                                                              <p>Companies</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcompanies" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="7">
                                                                              <p>Contacts</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permcontacts" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="8">
                                                                              <p>Products/Services</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permservicesandproductscat" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="9">
                                                                              <p>Channels</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permchannels" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="10">
                                                                              <p>Agency Types</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permagencytypes" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="11">
                                                                              <p>Suppliers</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permsuppliers" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="12">
                                                                              <p>Distribution Groups</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permdistribution" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4" idseccion="4" idsubseccion="13">
                                                                              <p>Units Measure</p><br>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" permission="newpermission" value="1"><label class="check"></label><span>New</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" permission="editpermission" value="2"><label class="check"></label><span>Edit</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" permission="deletepermission" value="3"><label class="check"></label><span>Delete</span></div>
                                                                              <div class="" style="display:inline-block;"><input type="checkbox" name="permunitsmeasure" permission="consultpermission" value="4"><label class="check"></label><span>Consult</span></div>
                                                                            </div>

                                                                          

                                                                          <div class="clear"></div>

                                                                        </div><!-- end Tab permission Catalogs -->


                                                                        </div> <!--end all tabs permissions-->

                                                                      </div><!--end tabs permission menu-->

                                                      </div><!-- end section permissions -->
                                                      

                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button type="button" id="InsertProfile" class="btn btn-success" onclick="CheckPermissions(false);">Save New Profile</button>
                                                        <button style="display:none;" id="InsertProfileEnd" value="Insert_Profile" name="ProfileButtons" class="btn btn-success">Save New Profile</button>
                                                        <!--button id="InsertProfile" value="Insert_Profile" name="ProfileButtons" class="btn btn-success">Save New Profile</button-->
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
