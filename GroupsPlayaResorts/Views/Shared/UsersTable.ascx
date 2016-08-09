<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteUser').click(function (e) {

            if ($('input[name=UserRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteUserID").value = $('input[name=UserRadio]:checked').val()
                $('#userdeletemodal').modal('show')

            }

        })

    });

    function EditarUsuarioPopUp() {
        var idUser = $('input:radio[name=UserRadio]:checked').val();

        $('#frmUserEdit').html($('#FormEditar').html());
        $('#frmUserEdit').find('header.encabezado').remove();

        var array = $('#ModalEditUser').find('select.selectpicker');
        for (var i = 0; i < array.length; i++) {
            var $select = $(array[i]);
            var $parent = $select.parent();
            var $span = $parent.find('span:first');
            $parent.html('');
            $parent.append($span);
            $parent.append($select);
        }

        $('#frmUserEdit').find('#prms-group').attr('id', 'prms-group2');
        $('#frmUserEdit').find('a[href=#prms-group]').attr('href', '#prms-group2');

        $('#frmUserEdit').find('#prms-events').attr('id', 'prms-events2');
        $('#frmUserEdit').find('a[href=#prms-events]').attr('href', '#prms-events2');

        $('#frmUserEdit').find('#prms-pay').attr('id', 'prms-pay2');
        $('#frmUserEdit').find('a[href=#prms-pay]').attr('href', '#prms-pay2');

        $('#frmUserEdit').find('#prms-catalogs').attr('id', 'prms-catalogs2');
        $('#frmUserEdit').find('a[href=#prms-catalogs]').attr('href', '#prms-catalogs2');

        $('#frmUserEdit').find('button[id=InsertUser]').attr('id', 'EditUser').attr('onclick', 'CheckPermissions(true)');
        $('#frmUserEdit').find('button[id=InsertUserEnd]').attr('id', 'UpdateUserEnd');

        $('#frmUserEdit').append('<input type="hidden" name="id_user" value="' + idUser + '"/>');

        $.post('/Catalogs/GetDataUser', { id_user: idUser }, function (data) {
            var $xml = $($.parseXML(data));
            var hoteles = $xml.find("Hotels").text();
            var arrayHoteles = hoteles.split(",")
            var userTypes = $xml.find("UserTypes").text();
            var arrayuserTypes = userTypes.split(",")

            $('#frmUserEdit').find('#UserName').val($xml.find("User_Name").text());
            $('#frmUserEdit').find('#UserLastname').val($xml.find("Last_Name").text());
            $('#frmUserEdit').find('#UserEmail').val($xml.find("User_Email").text());
            $('#frmUserEdit').find('#UserEmailHyatt').val($xml.find("User_EmailHyatt").text());
            $('#frmUserEdit').find('#UserNumberEmploye').val($xml.find("Num_Employee").text());
            $('#frmUserEdit').find('#UserLogin').val($xml.find("User_Login").text());
            $('#frmUserEdit').find('#UserPassword').val($xml.find("Password").text());
            $('#frmUserEdit').find('#UserConfirmPassword').val($xml.find("Password").text());
            $('#frmUserEdit').find('#userprofile').val($xml.find("Id_Profile").text());
            $('#frmUserEdit').find('#userchannel').val($xml.find("Id_Channel").text());
            $('#frmUserEdit').find('#UserMaxDiscount').val($xml.find("Max_Discount").text());
            //$('#frmUserEdit').find('#usertypeuser').val($xml.find("Type_user").text());

            $('#frmUserEdit').find('#hotels').val(arrayHoteles);
            $('#frmUserEdit').find('#usertypeuser').val(arrayuserTypes);

            $('#frmUserEdit').find('#UserPassword').attr('type', 'password');
            $('#frmUserEdit').find('#UserConfirmPassword').attr('type', 'password');

            var permisos = $xml.find('PERMISSIONS');

            for (var i = 0; i < permisos.length; i++) {
                var permisoActual = permisos[i];

                var div = $('#frmUserEdit').find('#' + $(permisoActual).find("NOM_SECCION").text() + ' > div[idseccion=' + $(permisoActual).find("ID_SECCION").text() + '][idsubseccion=' + $(permisoActual).find("ID_SUBSECCION").text() + ']');
                
                if ($(permisoActual).find("NEW_PERMISSION").length > 0)
                    div.find('input[permission=newpermission]').prop('checked', true);

                if ($(permisoActual).find("EDIT_PERMISSION").length > 0)
                    div.find('input[permission=editpermission]').prop('checked', true);

                if ($(permisoActual).find("DELETE_PERMISSION").length > 0)
                    div.find('input[permission=deletepermission]').prop('checked', true);

                if ($(permisoActual).find("CONSULT_PERMISSION").length > 0)
                    div.find('input[permission=consultpermission]').prop('checked', true);

                if ($(permisoActual).find("UPLOAD_PERMISSION").length > 0)
                    div.find('input[permission=uploadpermission]').prop('checked', true);

                if ($(permisoActual).find("VALIDATE_PERMISSION").length > 0)
                    div.find('input[permission=validatepermission]').prop('checked', true);
            }

            $('#ModalEditUser').find('select.selectpicker').selectpicker();

            $('#ModalEditUser').modal({
                "backdrop": "static",
                "keyboard": false
            });
        });
        
    }
</script>

<% Using Ajax.BeginForm("CatalogUsers", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


     <div id="toolbar">
         <%
             If (ViewData("idseccion4subseccion1edit_permission") IsNot Nothing And ViewData("idseccion4subseccion1edit_permission") > 0) Then
                 Response.Write("<button id=""EditRequestUser"" type=""button""  name=""UserButtons"" value=""Edit_Request_User"" class=""btn btn-default"" onclick=""EditarUsuarioPopUp();""><i class=""fa fa-pencil-square-o""></i> Edit</button>")
             End If
                                            
             If (ViewData("idseccion4subseccion1delete_permission") IsNot Nothing And ViewData("idseccion4subseccion1delete_permission") > 0) Then
                 Response.Write("<a id=""DeleteUser""  class=""btn btn-default"">Delete</a>")
             End If
        %>
        
        <%--  <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalmeasure">View info</button>--%>                                                                                                    
     </div> 

                                   
                                  
    <table class="table-no-bordered" id="table-list"
            data-toggle="table"
            data-show-export="false"
            data-pagination="true"
            data-search="true"
            data-show-columns="false"
            data-toolbar="#toolbar"
            data-filter-control="false"
            data-page-size="10"
            >
        <thead>
        <tr>
            <th data-field="Action" data-switchable="false">Actions</th>
            <th data-field="Name" >User name</th>
            <%--<th data-field="Email"  data-filter-control="select">Email</th>--%>
            <%--<th data-field="Employe&nbsp;Number" data-filter-control="select">Employe Number</th>--%>
            <th data-field="User&nbsp;Login" >User Login</th>
            <%--<th data-field="Password" data-filter-control="select">Password</th>--%>
            <%--<th data-field="Property" data-filter-control="select">Property</th>--%>
            <th data-field="Profile" >Profile</th>
                                                   
        </tr>
        </thead>

        <tbody>
                                              
                <% 
                    Dim i As Integer
                
   
                    For i = 0 To Model.ListUsersin.Count - 1
                     
                        Response.Write("<tr>")
                                                                     
                        Response.Write("<td class=""bs-checkbox"">")
                        Response.Write("<input type=""radio"" class=""custom-check2"" id=""UserRadio"" name=""UserRadio"" value=""" + Model.ListUsersin.Item(i).Id_User.ToString + """  ><label class=""check2""></label>")
                        Response.Write("</td>")
                                                                     
                        Response.Write("<td>")
                        Response.Write(Model.ListUsersin.Item(i).User_Name)
                        Response.Write("</td>")
                                                             
                        Response.Write("<td>")
                        Response.Write(Model.ListUsersin.Item(i).User_Login)
                        Response.Write("</td>")
                                                             
                        Response.Write("<td>")
                        Response.Write(Model.ListUsersin.Item(i).User_Profile)
                        Response.Write("</td>")
                                                             
                        Response.Write("</tr>")
                    Next
                
                        %>
                                                             
                                       
                                                     
        </tbody>
    </table>
<% End Using %>


<div id="modalAsignar">
    <% Using Ajax.BeginForm("EditUser", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container1"})%>
        <% Html.RenderPartial("ModalEditUser",Model) %>
    <% End Using%>
</div>