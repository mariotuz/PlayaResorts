<%@ Page Language="VB"  Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.CatalogDetail)" %> 


<!-- ////////////////////////////////////////////  Modal windows distribution edit catalog //////////////////////////////////////////////////////////////////////////////// -->


<% Using Ajax.BeginForm("CatalogUnitMeasure", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "FormUnitsEdit"})%>

 
<!-- Start edit distribution modal-->
<div class="modal fade " id="measurelModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container modal-->

          <div class="modal-header">
            <button id="EditMeasureCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
            <h4 class="modal-title">Edit Unit Measure</h4>
          </div>

         <div id="AlertContentEdit"> </div>


         <div id="AJAX_Container2">
                                                                                                       
         <% Html.RenderPartial("UnitMeasureModal", Model)%>
                                                                                                             

         </div>

          <div class="modal-footer">
            <button id="EditMeasureClose" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

            <button id="EditMeasure" value="Edit_Measure" name="UnitMeasureButtons" class="btn btn-success">Save Changes</button>
          </div>
      
    </div><!-- End container modal-->
  </div>
</div><!-- end edit Unit Of Measure modal-->
 <% End Using %>

<% Using Ajax.BeginForm("CatalogUnitMeasure", "Catalogs", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessEdit", .OnFailure = "OnFailureEdit", .UpdateTargetId = "AJAX_Container1"}, New With {.id = "FormUnitsEdit"})%>
<!-- ////////////////////////////////////////////  Modal windows Unit Of Measure info catalog //////////////////////////////////////////////////////////////////////////////// -->
<!--Second  info modal-->

<div class="modal fade" id="infoModalmeasure" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info Unit Of Measure modal-->
  <div class="modal-dialog ">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Unit Measure Info</h4>
      </div>

      <div class="modal-body"><!-- Start modal body-->

          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Unit Measure</small></span>
                <p>USD</p>
              </div>

              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Measure Key</small></span>
                <p>usd76</p>
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
</div><!-- end info Unit Of Measure modal-->




<div class="modal fade" id="measuredeletemodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>
        <h4 class="modal-title">Are you sure you want to delete data? </h4>
      </div>

          <div class="modal-footer">
            <button id="CancelClose" type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <button id="DeleteMeasure" value="Delete_Measure" name="UnitMeasureButtons" class="btn btn-success">Yes</button>
          </div>
      
        <input type="text"  id="DeleteMeasureID" name="DeleteMeasureID" hidden value="" >
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->


 <% End Using %>