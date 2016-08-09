<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>



  

 <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Agency Type Name *</small></span>
                <div class="input-group  btn-group col-xs-12 col-md-12">
                   <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditAgencyTypeName" name="EditAgencyTypeName" placeholder="" value="<%: Model.EditAgencyTypeName()%>" >
                </div>
              </div>
                           
                 <div class="clear"></div>
              </div><!--end form-->


            <input type="text"  id="EditAgencyTypeID" name="EditAgencyTypeID" hidden value="<%:  Model.EditAgencyTypeID()%>" >

            <div class="clear"></div>

          </div><!-- End modal body-->