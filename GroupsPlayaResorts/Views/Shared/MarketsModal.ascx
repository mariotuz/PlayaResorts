<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


  <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                  <span><small>Market Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditMarketName" name="EditMarketName" placeholder="" value="<%: Model.EditMarket()%>" >

                  </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                  <span><small>Key Market *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditMarketKey" name="EditMarketKey" placeholder="" value="<%: Model.EditMarketKey()%>" >
                  </div>
                </div>
                           
                 <div class="clear"></div>
              </div><!--end form-->

            <input type="text"  id="EditMarketID" name="EditMarketID" hidden value="<%:  Model.EditMarketid()%>" >

            <div class="clear"></div>

  </div><!-- End modal body-->
  