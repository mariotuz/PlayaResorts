<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>


<!-- ////////////////////////////////////////////  Modal windows user catalog //////////////////////////////////////////////////////////////////////////////// -->


<!-- Start edit user modal-->
<div class="modal fade " id="userModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit User Info</h4>
          </div>

          <div class="modal-body"><!-- Start modal body-->

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>User Name *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>E-mail *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>Employee Number *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>User Login *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>Password *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <span><small>Confirm Password *</small></span>
                    <div class="input-group  btn-group col-xs-12 col-md-12">
                      <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                    </div>
                  </div>

                  <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                     <span><small>Property *</small></span>
                       <select class="selectpicker" data-width="100%" multiple title='Choose one or more properties'>
                          <option>Canada</option>
                          <option>Ketchup</option>
                          <option>Relish</option>
                        </select>
                  </div>

                   <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                     <span><small>Profile *</small></span>
                       <select class="selectpicker" data-width="100%">
                          <option>Canada</option>
                          <option>Ketchup</option>
                          <option>Relish</option>
                        </select>
                  </div>


                  <div id="" class="permissions col-xs-12 col-sm-12 col-md-12 col-lg-12" > <!-- Start section permissions -->
                  <span><small>Permissions (extras)</small></span>
                  
                          <!-- Nav tabs prms-->
                          <div role="tabpanel"> <!--start tabs permission menu-->
                          <ul class="nav nav-tabs tabs-promos" role="tablist" >
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-prms-group" aria-controls="rates" role="tab" data-toggle="tab">Group</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-prms-events" aria-controls="pays" role="tab" data-toggle="tab">Events</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-prms-pay" aria-controls="pays" role="tab" data-toggle="tab">Payments</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3 active"><a href="#modal-prms-catalogs" aria-controls="pays" role="tab" data-toggle="tab">Catalogs</a></li>
                          </ul>

                          <!-- Start all tab permissions -->
                          <div class="tab-content">

                                    <div role="tabpanel" class="tab-pane" id="modal-prms-group"><!-- Start Tab permission groups --> 
                                               
                                          <form action=""> 

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>General View</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Document & formats</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Breackdown</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Payments</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>
                                            
                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>LogBook</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                          </form>
                                          <div class="clear"></div>
                                      
                                    </div><!-- end Tab permission groups -->

                                    <div role="tabpanel" class="tab-pane" id="modal-prms-events"><!-- Start Tab permission events -->

                                          <form action=""> 

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Events List</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>New Event</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Add Services/Product</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Banquet block</p><br>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                              <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                            </div>

                                          </form>
                                          <div class="clear"></div>

                                    </div><!-- end Tab permission events -->

                                    <div role="tabpanel" class="tab-pane" id="modal-prms-pay"><!-- Start Tab permission Payments -->

                                         <form action=""> 

                                          <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <p>Payments List</p><br>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                          </div>

                                          <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <p>Form</p><br>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                            <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                          </div>

                                        </form>
                                        <div class="clear"></div>

                                    </div><!-- end Tab permission Payments -->

                                    <div role="tabpanel" class="tab-pane active" id="modal-prms-catalogs"><!-- Start Tab permission Catalogs -->

                                       <form action=""> 

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Users</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Profiles</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Properties/Destinations</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Markets</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Group Type</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>wholesale</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Companies</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Contact</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Products/Services</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Chanels</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Agencies</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Supplier</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Distribution</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Unit Measure</p><br>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="high" value="Bike"><label class="check"></label><span>New</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="edit" value="Bike"><label class="check"></label><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="delete" value="Bike"><label class="check"></label><span>Delete</span></div>
                                          <div class="" style="display:inline-block;"><input type="checkbox" name="consult" value="Bike"><label class="check"></label><span>Consult</span></div>
                                        </div>

                                      </form>
                                      <div class="clear"></div>

                                    </div><!-- end Tab permission Catalogs -->


                                    </div> <!--end all tabs permissions-->

                                  </div><!--end tabs permission menu-->

                  </div><!-- end section permissions -->

              <div class="clear"></div>
            </div><!--end form-->

          <div class="clear"></div>
          </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button id="new" class="btn btn-success">Save Changes</button>
          </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end edit user modal-->


<!-- ////////////////////////////////////////////  Modal windows users info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info user modal-->
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">User Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>User Name *</small></span>
                <p> Joel Jimenez</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>E-mail *</small></span>
                <p>joel@je-solutions.com</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Employee Number *</small></span>
                <p>00001</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>User Login *</small></span>
                <p>key-00001</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Password *</small></span>
                <p>89y238e-d3d9jho-YVXC</p>
              </div>

              <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                 <span><small>Property *</small></span>
                 <p>Playa resot</p>
              </div>

               <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                 <span><small>Profile *</small></span>
                 <p>Admin</p>
              </div>

               <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                 <span><small>Permissions</small></span>
                 <p>Admin</p>
              </div>

            <div class="clear"></div>
          </div><!--end form-->

                           <div id="Div1" class="permissions col-xs-12 col-sm-12 col-md-12 col-lg-12" > <!-- Start section permissions -->
                  <span><small>Permissions (extras)</small></span>
                  
                          <!-- Nav tabs prms-->
                          <div role="tabpanel"> <!--start tabs permission menu-->
                          <ul class="nav nav-tabs tabs-promos" role="tablist" >
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-ifo-prms-group" aria-controls="rates" role="tab" data-toggle="tab">Group</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-info-prms-events" aria-controls="pays" role="tab" data-toggle="tab">Events</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3"><a href="#modal-info-prms-pay" aria-controls="pays" role="tab" data-toggle="tab">Payments</a></li>
                            <li role="presentation" class=" col-xs-6 col-md-3 active"><a href="#modal-info-prms-catalogs" aria-controls="pays" role="tab" data-toggle="tab">Catalogs</a></li>
                          </ul>

                          <!-- Start all tab permissions -->
                          <div class="tab-content">

                                    <div role="tabpanel" class="tab-pane" id="modal-ifo-prms-group"><!-- Start Tab permission groups --> 
                                               
                                          <form action=""> 

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>General View</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Document & formats</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Breackdown</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Payments</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>
                                            
                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>LogBook</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                          </form>
                                          <div class="clear"></div>
                                      
                                    </div><!-- end Tab permission groups -->

                                    <div role="tabpanel" class="tab-pane" id="modal-info-prms-events"><!-- Start Tab permission events -->

                                          <form action=""> 

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Events List</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>New Event</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Add Services/Product</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                            <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                              <p>Banquet block</p><br>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                              <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                            </div>

                                          </form>
                                          <div class="clear"></div>

                                    </div><!-- end Tab permission events -->

                                    <div role="tabpanel" class="tab-pane" id="modal-info-prms-pay"><!-- Start Tab permission Payments -->

                                         <form action=""> 

                                          <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <p>Payments List</p><br>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                          </div>

                                          <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <p>Form</p><br>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                            <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                          </div>

                                        </form>
                                        <div class="clear"></div>

                                    </div><!-- end Tab permission Payments -->

                                    <div role="tabpanel" class="tab-pane active" id="modal-info-prms-catalogs"><!-- Start Tab permission Catalogs -->

                                       <form action=""> 

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Users</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Profiles</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Properties/Destinations</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Markets</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Group Type</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>wholesale</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Companies</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Contact</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Products/Services</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Chanels</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Agencies</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Supplier</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Distribution</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                        <div class="box-prm-xtrs col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                          <p>Unit Measure</p><br>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>New</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Edit</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>delete</span></div>
                                          <div class="" style="display:inline-block;"><i class="fa fa-check-circle"></i><span>Consult</span></div>
                                        </div>

                                      </form>
                                      <div class="clear"></div>

                                    </div><!-- end Tab permission Catalogs -->


                                    </div> <!--end all tabs permissions-->

                                  </div><!--end tabs permission menu-->

                  </div><!-- end section permissions -->

          <div class="clear"></div>
      </div><!-- End modal body-->

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
      
    </div><!-- End container-->
  </div>
</div><!-- end info user modal-->
