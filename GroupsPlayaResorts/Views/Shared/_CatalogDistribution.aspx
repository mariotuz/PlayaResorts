<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogDistributionGroup)" %>


<!-- ////////////////////////////////////////////  Modal windows distribution edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<% Using Ajax.BeginForm("CatalogDistribution", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "FormDistributionEdit"})%>



<!-- Start edit distribution modal-->
<div class="modal fade " id="DistributionModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Distribution Info</h4>
          </div>

        

         <div class="modal-body" id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("DistributionModal", Model)%>
                     
             
             <div class="clear"></div>                                                                                        
         </div>

         
          <div class="modal-footer">
            <button id="EditDistributionClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

            <button id="EditDistribution" value="Edit_Distribution" name="DistributionGroupsButtons" class="btn btn-success">Save Changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit distribution modal-->


<!-- ////////////////////////////////////////////  Modal windows distribution info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<% End Using %>




<% Using Ajax.BeginForm("CatalogDistribution", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>


<div class="modal fade" id="distributiondeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteDistribution" value="Delete_Distribution" name="DistributionGroupsButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteDistributionID" name="DeleteDistributionID" hidden value="" >


    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->




 <% End Using %>