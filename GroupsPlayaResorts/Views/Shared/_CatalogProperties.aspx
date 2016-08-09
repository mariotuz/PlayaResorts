<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<!-- ////////////////////////////////////////////  Modal windows Porperti edit catalog //////////////////////////////////////////////////////////////////////////////// -->


<!-- Start edit property modal-->
<div class="modal fade " id="propertyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Properties Info</h4>
          </div>

          <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Property Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Property Alias *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                    <span><small>Country *</small></span>
                      <select class="selectpicker" data-width="100%" multiple title='Choose One Conutry' data-max-options="1" data-size="10">
                          <option data-subtext="Afganistan">AF</option>
                          <option data-subtext="ÅAand Islands">AX</option>
                          <option data-subtext="Albania">AL</option>
                      </select>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                    <span><small>State *</small></span>
                      <select class="selectpicker" data-width="100%" multiple title='Choose One City' data-max-options="1" data-size="10">
                          <option>State 1</option>
                          <option>State 2</option>
                          <option>State 3</option>
                      </select>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>City *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                  </div>
                </div>

                <div class="add-room col-xs-12 col-sm-12 col-md-12 col-lg-12 ">

                  <header class="encabezado"><h2 class="md-display-2">Rooms Type</h2></header>

                    <form id="myForm">
                    <ol>
                        <!--row inputs-->
                        
                        <div style="margin-bottom:4px;" class="clonedInputdos col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                            
                              <li>
                                <!--inputs group-->
                                <div class=" btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                  <span><small>Category Name (Spanish) *</small></span>
                                  <input type="text" class="form-control input-custom corners-inputs" name="input1" /><br>
                                </div>

                                <div class="  btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                  <span><small>Category Name (English) *</small></span>
                                  <input type="text" class="form-control input-custom corners-inputs" name="input2" /><br>
                                </div>

                                <div class="  btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                  <span><small>Category Alias *</small></span>
                                  <input type="text" class="form-control input-custom corners-inputs" name="input3" /><br>
                                </div>
                                <!--inputs group-->

                                <!--btn delete inputs-->
                                <div style=" margin-top:20px; ">
                                  <input type="button" class="btnDeldos btn btn-success" value="Remove" disabled="disabled" />
                                </div>
                              </li>
                            
                        </div>
                        <!--row inputs-->
                      </ol>
                        <!--btn add inputs-->
                        <div style=" margin-top:5px; ">
                            <input style="background:green !important;" type="button" id="btnAddos" class="btn btn-success fa fa-plus-circle" value=" Add" />
                        </div>
                        
                    </form>

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
</div><!-- end edit properti modal-->


<!-- ////////////////////////////////////////////  Modal windows Properti info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalproperty" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info property modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Property Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Property Name</small></span>
                <p> Gran Caribe Cancun</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Property Alias</small></span>
                <p>GCR</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Country</small></span>
                <p>AF</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>State</small></span>
                <p>State 1</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>City</small></span>
                <p>City 1</p>
              </div>

            <div class="clear"></div>
          </div><!--end form-->

          <div class="add-room col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
            <header class="encabezado"><h2 class="md-display-2">Rooms Type</h2></header>
            <br>
                    
                <ol>
                    <li>
                      <div class="prpt-info">
                        <span><small>Category Name (Spanish) *</small></span>
                        <p>Junior Suite</p>
                      </div>

                      <div class="prpt-info">
                        <span><small>Category Name (Spanish) *</small></span>
                        <p>Junior Suite</p>
                      </div>

                      <div class="prpt-info">
                        <span><small>Category Alias</small></span>
                        <p>JRS</p>
                      </div>
                    </li>

                   
                  </ol>
                        
                </div>

          <div class="clear"></div>
      </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end info property modal-->