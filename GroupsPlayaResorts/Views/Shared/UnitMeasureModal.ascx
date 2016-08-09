<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


 <div class="modal-body"><!-- Start modal body-->

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Unit Measure *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio"  id="EditUnitMeasure" name="EditUnitMeasure" placeholder="" value="<%: Model.EditUnitMeasure()%>" >

              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Unit Key *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditUnitKey" name="EditUnitKey" placeholder="" value="<%:  Model.EditUnitKey()%>" >
              </div>
            </div>

            <input type="text"  id="EditUnitId" name="EditUnitId" hidden value="<%:  Model.EditUnitID()%>" >


            <div class="clear"></div>

</div><!-- End modal body-->

  