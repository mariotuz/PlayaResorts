<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogAgencyType)" %>


<!-- ////////////////////////////////////////////  Modal windows Agency edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<% Using Ajax.BeginForm("CatalogAgencyType", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>


<!-- Start edit Agency modal-->
<div class="modal fade " id="agnecyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button id="EditCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Agency Type </h4>
          </div>

          <div id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("AgencyTypeModal", Model)%>
                                                                                                             
         </div>

          <div class="modal-footer">
            <button id="EditClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button id="EditAgencyTypelBtn" type="button" onclick="ValidaFormAGT('agnecyModal');" class="btn btn-success">Save changes</button>
            <button id="EditAgencyType" style="display:none;" value="Edit_AgencyType" name="AgencyTypeButtons" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit Agency modal-->


<!-- ////////////////////////////////////////////  Modal windows Agencys info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalagency" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info Agency modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Agency Type Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Agency Type Name</small></span>
                <p>Type 1</p>
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
</div><!-- end info Agency modal-->


<!-- ////////////////////////////////////////////  Modal windows Market info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="agencytypedeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteAgencyType" value="Delete_AgencyType" name="AgencyTypeButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteAgencyTypeID" name="DeleteAgencyTypeID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>
