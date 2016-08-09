<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>



<!-- ////////////////////////////////////////////  Modal windows wholesales edit catalog //////////////////////////////////////////////////////////////////////////////// -->


<!-- Start edit wholesale modal-->
<div class="modal fade " id="wholeModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Wholesale Info</h4>
          </div>

          <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                  <span><small>Wholesale Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                  <span><small>Key Wholesale *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>
                           
                 <div class="clear"></div>
              </div><!--end form-->


            <div class="clear"></div>

          </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button id="new" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit wholesale modal-->


<!-- ////////////////////////////////////////////  Modal windows wholesale info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalwhole" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info wholesale modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Wholesale Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Wholesale Name</small></span>
                <p>EXPEDIA, INC. CAN - EUA</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Key Wholesale</small></span>
                <p>EXPEDIA</p>
              </div>

            <div class="clear"></div>
          </div><!--end form-->


          <div class="clear"></div>
      </div><!-- End modal body-->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end info wholesale modal-->
