<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<!-- ////////////////////////////////////////////  Modal windows product edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<!-- Start edit product modal-->
<div class="modal fade " id="proservModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Contact Info</h4>
          </div>

          <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Product Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>Type *</small></span>
                     <select class="selectpicker" data-width="100%">
                        <option>Type 1</option>
                        <option>Type 2</option>
                        <option>type 3</option>
                      </select>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>Supplier *</small></span>
                     <select class="selectpicker" data-width="100%">
                        <option>option 1</option>
                        <option>option 2</option>
                        <option>option 3</option>
                      </select>
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
</div><!-- end edit product modal-->


<!-- ////////////////////////////////////////////  Modal windows product info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalproserv" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info product modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Products & Services Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Product Type</small></span>
                <p>Product 1</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Type</small></span>
                <p>Type 2</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Supplier</small></span>
                <p>Supplier 3</p>
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
</div><!-- end info product modal-->


