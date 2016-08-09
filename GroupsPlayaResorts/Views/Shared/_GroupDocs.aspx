<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>



     <div role="tabpanel"><!-- Start Contentainer tabs-->
                                                      <!-- Start Nav tabs -->
                                                      <br>
                                                      <br>
                                                      <ul class="nav nav-tabs dual-select" role="tablist" >
                                                        
                                                        <li role="presentation" class="col-xs-4 col-md-4 active"><a href="#fdft" aria-controls="fdft" role="tab" data-toggle="tab">Generate Documents & Formats</a></li>
                                                        <li role="presentation" class="col-xs-4 col-md-4"><a href="#upfile" aria-controls="upfile" role="tab" data-toggle="tab">Upload Documents</a></li>
                                                        <li role="presentation" class="col-xs-4 col-md-4 "><a href="#docsfmt" aria-controls="docsfmt" role="tab" data-toggle="tab">List of Documents & Formats</a></li>
                                                      </ul>
                                                      <!-- end Nav tabs -->

                                                      <!-- Start Tab panes -->
                                                      <div class="tab-content"><br>

                                                            <div role="tabpanel" class="tab-pane " id="docsfmt"><!-- Start documents list tabs-->


                                                            <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessDoc", .OnFailure = "OnFailureDoc", .UpdateTargetId = "AJAX_Container_Doc"})%>

                                                                 <input type="text" id="grupoiddocupdate" name="grupoiddocupdate" hidden value="0"   >

                                                                 <header class=""><h2 class="md-display-2">Documents & Formats Uploads</h2></header>
                                                                

                                                                <div id="AJAX_Container_Doc"> 

                                                 
                                                                 <% Html.RenderPartial("DocTable", Model)%>
                                                                    
                                                                     
                                                               </div>


                                                               <% End Using %>    

                                                            </div><!-- end documents list tabs-->


                                                        

                                                            <div role="tabpanel" class="tab-pane active" id="fdft"><!-- Start generet document tabs-->

                                                        <% Using Html.BeginForm("GroupDetail", "Groups", FormMethod.Post, New With {.id = "downloadDocument", .enctype = "multipart/form-data"})%>

                                                                <input type="text" id="grupoiddoc" name="grupoiddoc" hidden value="0"   >

                                                                
                                                                <script type="text/javascript">

                                                                    $(document).ready(function () {

                                                                        $('#GenerateFileAux').on('click', function (e) {

                                                                            var GroupType = 0;

                                                                            GroupType = document.getElementById("selectgrouptype").value;

                                                                          
                                                                            if (GroupType == 4 || GroupType == 6) {

                                                                                //alert("For Incentive and Corporate Groups you should use temporary manually the new corporate enrollment form ");
                                                                                $('#newenrollmentcorporate').modal('show');
                                                                            }
                                                                            else {


                                                                                //$('#newenrollment').modal('show');
                                                                                
                                                                                $('#GenerateFile').click();
                                                                            }


                                                                        });

                                                                        $('#selectypedocument').on('change', function (e) {

                                                                            var typedoc;
                                                                            typedoc = $('#selectypedocument').val();

                                                                           
                                                                            if (typedoc == 2) {
                                                                                $('#enrollmentconcessionsdiv').css("visibility", "visible");
                                                                                $('#selectincludeeventsdiv').css("visibility", "visible");
                                                                                $('#selectsourcediv').css("visibility", "visible");

                                                                                
                                                                            }
                                                                            else {

                                                                                $('#enrollmentconcessionsdiv').css("visibility", "hidden");
                                                                                $('#selectincludeeventsdiv').css("visibility", "hidden");
                                                                                $('#selectsourcediv').css("visibility", "hidden");
                                                                            }


                                                                        });
                                                                    });

                                                                </script>

                                                              <header class=""><h2 class="md-display-2">Select a Document or Format</h2></header>
                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group" >
                                                                        <span><small>Documents / Formats</small></span>
                                                                       <select class="selectpicker" id="selectypedocument" name="selectypedocument" data-width="100%">
                                                                          <%--<option value="1" >Proposal</option>--%>
                                                                          <option value="2">Enrollment Form</option>
                                                                          <option value="3">Lock Rooms</option>
                                                                          <%--<option value="4">Instructive</option>--%>
                                                                          <option value="5">Rooming List</option>
                                                                        <%--  <option value="5">ODS</option>--%>


                                                                        </select>
                                                                  </div>

                                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group" id="selectsourcediv">
                                                                      <span><small>Source</small></span>
                                                                       <select class="selectpicker" id="selectsource" name="selectsource" data-width="100%">
                                                                          <option value="0">Estimated</option>
                                                                          <option value="1">BreakDown</option>
                                                                          
                                                                   
                                                                        </select>
                                                                 </div>

                                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group" id="enrollmentconcessionsdiv">
                                                                      <span><small>Additional Special Group Concessions</small></span>
                                                                       <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="enrollmentconcessions" name="enrollmentconcessions" rows="5" cols="50" placeholder=""><%:Model.EditGroupData50%></textarea>
                                                                 </div>

                                                                

                                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-4 col-lg-3" role="group" id="selectincludeeventsdiv">
                                                                      <span><small>Include Events</small></span>
                                                                       <select class="selectpicker" id="selectincludeevents" name="selectincludeevents" data-width="100%">
                                                                          <option value="0">No</option>
                                                                          <option value="1">Yes</option>
                                                                          
                                                                   
                                                                        </select>
                                                                 </div>

                                                                 
                                                                 <div class="clear"></div>

                                                                 <div style="display:inline-block; padding:15px;">

                                                                     <a  id="GenerateFileAux" class="btn btn-success">Generate File</a>

                                                                     <button value="GenerateFile" name="GroupDetailBotons" id="GenerateFile" class="btn btn-success" style="visibility:hidden;">Generate File</button>

                                                                    

                                                                 </div>

                                                        <% End Using %>

                                                            </div><!-- end generet document tabs-->



                                                            <div role="tabpanel" class="tab-pane" id="upfile"><!-- Start upload files tabs-->

                                                        <% Using Html.BeginForm("GroupDetail", "Groups", FormMethod.Post, New With {.id="subeArchivo",.enctype = "multipart/form-data"})%>





                                                              <input type="text" id="grupoiddocupload" name="grupoiddocupload" hidden value="0"   >


                                                              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                                                  <header class=""><h2 class="md-display-2">Select the file for upload</h2></header>

                                                                  <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-4" role="group">
                                                                        <span><small>Type of Document</small></span>
                                                                       <select class="selectpicker" name="selectypedocumentupload" id="selectypedocumentupload" data-width="100%">
                                                                          <option value="1" >Proposal</option>
                                                                          <option value="2">Contract</option>
                                                                        </select>
                                                                  </div>

                                                                  <div class="clear"></div>

                                                                  <%--<div id="multipleupload">Select file</div>--%>

                                                                  <br /> <br />

                                                                  <input type="file" id="Doc_File" name="Doc_File" data-validacion="vacio" data-msgValidacion="Please select a file." />

                                                              </div>

                                                             <div style="display:inline-block; padding:15px; margin-left: 20px;"><button value="Upload_File" name="GroupDetailBotons" id="UploadFile" class="btn btn-success">Upload File</button></div>

                                                            <% End Using %>
                                                                
                                                            </div><!-- end upload files tabs-->

                                                           

                                                      </div><!--end tab pane-->
                                              </div><!-- end Contentainer tabs-->



<div class="modal fade" id="newenrollmentcorporate" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">For Incentive and Corporate Groups you should use temporary manually the new Corporate Enrollment Form </h4>
      </div>

<%--        <div class="modal-body"><!-- Start modal body-->
          

        
            <div class="clear"></div>

        </div><!-- End modal body-->--%>

          <div class="modal-footer">
            <button id="Button4" class="btn btn-default" data-dismiss="modal" >Cancel</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->




<div class="modal fade" id="newenrollment" tabindex="-1" role="dialog" ><!-- Start info market modal-->
  <div class="modal-dialog">
    <div class="modal-content"><!-- Start container-->

      <div class="modal-header">
        <%--<button id="CancelCloseCircule" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times-circle"></span></button>--%>
        <h4 class="modal-title">Use temporary manually the new Enrollment Form </h4>
      </div>

<%--        <div class="modal-body"><!-- Start modal body-->
          

        
            <div class="clear"></div>

        </div><!-- End modal body-->--%>

          <div class="modal-footer">
            <button id="Button1" class="btn btn-default" data-dismiss="modal" >Cancel</button>
          </div>
      
        
    </div><!-- End container-->
  </div>
</div><!-- end info market modal-->