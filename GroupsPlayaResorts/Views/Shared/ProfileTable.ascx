<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $('#DeleteRequestProfile').click(function (e) {

            if ($('input[name=ProfileRadio]:checked').length > 0) {

                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("DeleteProfileID").value = $('input[name=ProfileRadio]:checked').val()
                $('#profiledeletemodal').modal('show')

            }

        })

    });
    function EditarPerfilPopUp() {
        var idProfile = $('input:radio[name=ProfileRadio]:checked').val();

        $('#frmProfileEdit').html($('#FormProfile').html());
        $('#frmProfileEdit').find('header.encabezado').remove();

        var array = $('#ModalEditProfile').find('select.selectpicker');
        for (var i = 0; i < array.length; i++) {
            var $select = $(array[i]);
            var $parent = $select.parent();
            var $span = $parent.find('span:first');
            $parent.html('');
            $parent.append($span);
            $parent.append($select);
        }

        $('#frmProfileEdit').find('#prms-profile-group').attr('id', 'prms-profile-group2');
        $('#frmProfileEdit').find('a[href=#prms-profile-group]').attr('href', '#prms-profile-group2');

        $('#frmProfileEdit').find('#prms-profile-events').attr('id', 'prms-profile-events2');
        $('#frmProfileEdit').find('a[href=#prms-profile-events]').attr('href', '#prms-profile-events2');

        $('#frmProfileEdit').find('#prms-profile-pay').attr('id', 'prms-profile-pay2');
        $('#frmProfileEdit').find('a[href=#prms-profile-pay]').attr('href', '#prms-profile-pay2');

        $('#frmProfileEdit').find('#prms-profile-catalogs').attr('id', 'prms-profile-catalogs2');
        $('#frmProfileEdit').find('a[href=#prms-profile-catalogs]').attr('href', '#prms-profile-catalogs2');

        $('#frmProfileEdit').find('button[id=InsertProfile]').attr('id', 'EditProfile').attr('onclick', 'CheckPermissions(true)');
        $('#frmProfileEdit').find('button[id=InsertProfileEnd]').attr('id', 'UpdateProfileEnd');

        $('#frmProfileEdit').append('<input type="hidden" name="id_profile" value="' + idProfile + '"/>');

        $.post('/Catalogs/GetDataProfile', { id_profile: idProfile }, function (data) {
            var $xml = $($.parseXML(data));

            $('#frmProfileEdit').find('#ProfileName').val($xml.find("Profile_name").text());

            var permisos = $xml.find('PERMISSIONS');

            for (var i = 0; i < permisos.length; i++) {
                var permisoActual = permisos[i];

                var div = $('#frmProfileEdit').find('#' + $(permisoActual).find("NOM_SECCION").text() + ' > div[idseccion=' + $(permisoActual).find("ID_SECCION").text() + '][idsubseccion=' + $(permisoActual).find("ID_SUBSECCION").text() + ']');

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

            $('#ModalEditProfile').find('select.selectpicker').selectpicker();

            $('#ModalEditProfile').modal({
                "backdrop": "static",
                "keyboard": false
            });
        });

    }


</script>

<% Using Ajax.BeginForm("CatalogProfiles", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container2"})%>


                                               <div id="toolbar">
                                                   <%
                                                       If (ViewData("idseccion4subseccion2edit_permission") IsNot Nothing And ViewData("idseccion4subseccion2edit_permission") > 0) Then
                                                           Response.Write("<button id=""EditRequestProfile"" type=""button""  name=""ProfileButtons"" value=""Edit_Request_Profile"" class=""btn btn-default"" onclick=""EditarPerfilPopUp();""><i class=""fa fa-pencil-square-o""></i> Edit</button>")
                                                       End If
                                                       
                                                       If (ViewData("idseccion4subseccion2delete_permission") IsNot Nothing And ViewData("idseccion4subseccion2delete_permission") > 0) Then
                                                           Response.Write("<a id=""DeleteRequestProfile""  class=""btn btn-default"">Delete</a>")
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
                                                            <th data-field="Profile&nbsp;Name" >Profile Name</th>
                                                          
                                                        </tr>
                                                      </thead>

                                                       <tbody>
                                                           <% 
                                                             Dim i As Integer
                
   
                                                               For i = 0 To Model.ListProfilein.Count - 1
                     
                                                                   Response.Write("<tr>")
                                                                     
                                                                   Response.Write("<td class=""bs-checkbox"">")
                                                                   Response.Write("<input type=""radio"" class=""custom-check2"" id=""ProfileRadio"" name=""ProfileRadio"" value=""" + Model.ListProfilein.Item(i).Id_Profile.ToString + """  ><label class=""check2""></label>")
                                                                   Response.Write("</td>")
                                                                     
                                                                   Response.Write("<td>")
                                                                   Response.Write(Model.ListProfilein.Item(i).Profile_Name)
                                                                   Response.Write("</td>")
                     
                                                                   
                    
                                                                   Response.Write("</tr>")
                                                               Next
                
                                                                %>
                                                             
                                                             
                                                      
                                                             
                                                        </tbody>
                                                  </table>
<% End Using %>

<div id="modalAsignar">
    <% Using Ajax.BeginForm("EditProfile", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEditRequest", .OnFailure = "OnFailureEditRequest", .UpdateTargetId = "AJAX_Container1"})%>
        <% Html.RenderPartial("ModalEditProfile", Model)%>
    <% End Using%>
</div>

