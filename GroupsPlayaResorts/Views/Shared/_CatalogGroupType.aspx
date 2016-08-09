<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogGroupType)" %>


<!-- ////////////////////////////////////////////  Modal windows Group type edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<% Using Ajax.BeginForm("CatalogGroupType", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>


<!-- Start edit group type modal-->
<div class="modal fade " id="groupTypeModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button id="EditCloseCircule"  type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Group Type </h4>
          </div>

         <div id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("GroupTypeModal", Model)%>
                                                                                                             
         </div>

          <div class="modal-footer">
     
             <button id="EditClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
             <button id="EditGroupTypeBtn" type="button" onclick="ValidEditGT('groupTypeModal');" class="btn btn-success">Save changes</button>
             <button id="EditGroupType" style="display: none;" value="Edit_GroupType" name="GroupTypeButtons" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit group type modal-->


<!-- ////////////////////////////////////////////  Modal windows Group type info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalgrupoType" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info group type modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Group type Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Group type</small></span>
                <p>Wedding</p>
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
</div><!-- end info group type modal-->


<!-- ////////////////////////////////////////////  Modal windows Market info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="grouptypedeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteGroupType" value="Delete_GroupType" name="GroupTypeButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteGroupTypeID" name="DeleteGroupTypeID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>