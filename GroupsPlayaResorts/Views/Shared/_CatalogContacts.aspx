<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogContacts)" %>

<!-- ////////////////////////////////////////////  Modal windows contact edit catalog //////////////////////////////////////////////////////////////////////////////// -->


<% Using Ajax.BeginForm("CatalogContacts", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"}, New With {.id="FormEditContact"})%>


<!-- Start edit contact modal-->
<div class="modal fade " id="contactModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Contact Info</h4>
          </div>

        <div id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("ContactsModal", Model)%>
                                                                                                             
         </div>

          <div class="modal-footer">
           <button id="EditClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button id="EditContact" value="Edit_Contact" name="ContactButtons" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit contact modal-->
<% End Using %>

<% Using Ajax.BeginForm("CatalogContacts", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>
<!-- ////////////////////////////////////////////  Modal windows contact info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalcontact" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info contact modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Contact Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Contact Name</small></span>
                <p>Travelocity</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Email</small></span>
                <p>name@email.com</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Telephone 1</small></span>
                <p>2 347890</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Telephone 2</small></span>
                <p>2 347890</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Contact Type</small></span>
                <p>Contact Type 1</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Company</small></span>
                <p>Option 1</p>
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
</div><!-- end info contact modal-->



<!-- ////////////////////////////////////////////  Modal windows Market info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="contactdeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteContact" value="Delete_Contact" name="ContactButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteContactID" name="DeleteContactID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>