<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogChannel)" %>


<!-- ////////////////////////////////////////////  Modal windows Channels edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<% Using Ajax.BeginForm("CatalogChannel", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>


<!-- Start edit Channels modal-->
<div class="modal fade " id="channelModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button id="EditCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Channel </h4>
          </div>

          <div id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("ChannelModal", Model)%>
                                                                                                             
         </div>

 
          <div class="modal-footer">
            <button id="EditClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button id="EditChannelBtn" type="button" onclick="ValidaFormChannel('channelModal');" class="btn btn-success">Save changes</button>
            <button id="EditChannel" style="display:none;" value="Edit_Channel" name="ChannelButtons" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit Channels modal-->


<!-- ////////////////////////////////////////////  Modal windows Channels info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalchann" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info Channels modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Channel Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Channel Name</small></span>
                <p>Channel 1</p>
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
</div><!-- end info channel modal-->


<!-- ////////////////////////////////////////////  Modal windows Market info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="channeldeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteChannel" value="Delete_Channel" name="ChannelButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteChannelID" name="DeleteChannelID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>