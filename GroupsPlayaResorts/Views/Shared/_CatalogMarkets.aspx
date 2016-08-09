<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogMarket)" %>

<!-- ////////////////////////////////////////////  Modal windows Market edit catalog //////////////////////////////////////////////////////////////////////////////// -->

<% Using Ajax.BeginForm("CatalogMarkets", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"})%>

<!-- Start edit market modal-->
<div class="modal fade " id="marketModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button id="EditCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Market </h4>
          </div>

       <%--  <div id="AlertContentEdit"> </div>--%>


         <div id="AJAX_Container2">
                                                                                                       
            <% Html.RenderPartial("MarketsModal", Model)%>
                                                                                                             
         </div>

          <div class="modal-footer">
            <button id="EditClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button id="EditMarketBtn" type="button" onclick="ValidaFormMarket('marketModal');" class="btn btn-success">Save changes</button>
              <button id="EditMarket" style="display:none;" value="Edit_Market" name="MarketButtons" class="btn btn-success">Save changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit market modal-->


<!-- ////////////////////////////////////////////  Modal windows Market info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="marketdeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteMarket" value="Delete_Market" name="MarketButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteMarketID" name="DeleteMarketID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>