<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>
  
 <script type="text/javascript">
     $(document).ready(function () {


         $('#EditContactType').selectpicker();

     });

  </script>

         <div class="modal-body"><!-- Start modal body-->

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Contact Name *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text"  class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacname" id="Editcontacname" value="<%: Model.EditContactName()%>" >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>E-mail *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacemail" id="Editcontactemail" value="<%: Model.EditContactEmail()%>"  >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Telephone 1 *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacphoneuno" id="Editcontacphoneuno" value="<%: Model.EditContactPhoneUno()%>" >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Telephone 2</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs" placeholder="" name="Editcontacphonedos" id="Editcontacphonedos" value="<%: Model.EditContactPhoneDos()%>"  >
              </div>
            </div>

            <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
               <span><small>Contact type *</small></span>
                 <select class="selectpicker" name="EditContactType" id="EditContactType" data-width="100%">
                                <option  <% If Model.EditContactType = "1" Then%> selected <% End if%> value="1">Wholesale</option>
                                <option  <% If Model.EditContactType = "0" Then%> selected <% End if%> value="0">Company</option>
                  </select>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
               <span><small> Wholesale / Company </small></span>
               <div class="input-group  btn-group col-xs-12 col-md-12">
                   <input type="text" class="form-control input-custom corners-inputs" placeholder="" name="Editcontacwhosalecompany" id="Editcontacwhosalecompany" value="<%: Model.EditContactWhosaleCompany()%>" >
                                                          
               </div>
            </div>

           <input type="text"  id="EditContactID" name="EditContactID" hidden value="<%:  Model.EditContactid()%>" >

            <div class="clear"></div>

          </div><!-- End modal body-->