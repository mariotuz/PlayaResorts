<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>


<script type="text/javascript">
    $(document).ready(function () {


        $('#modalcontactype').selectpicker();



    });


     </script>


  <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                                    <%If Model.EditGroupData48Value() <> 0 Then%>

                                                <h4 class="modal-title">Update Contact</h4>

                                    <%Else%>
                                                <h4 class="modal-title">New Contact</h4>

                                    <%End If%>

                                                
                                              </div>
                                              <div class="modal-body">
                                                <div class="">

                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Contact Name *</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modalcontactname" name="modalcontactname" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditGroupData43Value()%>" >
                                                    </div>
                                                  </div>

                                                  <%--<div class="btn-group col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                                                        <span><small>Room Type</small></span>
                                                        <select class="selectpicker" data-width="100%">
                                                          <option>Junior Suite</option>
                                                          <option>Master Suite</option>
                                                        </select>
                                                  </div>--%>

                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Email </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modalemail" name="modalemail" class="form-control input-custom corners-inputs" placeholder=""  value="<%: Model.EditGroupData44Value()%>" >
                                                    </div>
                                                  </div>


                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Telephone 1 </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modaltelephone1" name="modaltelephone1" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.EditGroupData45Value()%>" >
                                                    </div>
                                                  </div>

                                                  <div class="clear"></div>

                                                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Telephone 2 </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modaltelephone2" name="modaltelephone2" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.EditGroupData46Value()%>" >
                                                    </div>
                                                  </div>
                                            


                                                 <div class="btn-group col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                                                        <span><small>Contact Type</small></span>
                                                        <select class="selectpicker" name="modalcontactype" id="modalcontactype" data-width="100%">
                                                          <option <% If Model.EditGroupData47Value = "1" Then%> selected <% End if%> value="1">Wholesale</option>
                                                          <option <% If Model.EditGroupData47Value = "0" Then%> selected <% End if%> value="0">Company</option>
                                                        </select>
                                                  </div>
                                        

                                                    <input type="text"  id="EditContactID" name="EditContactID" hidden value="<%:  Model.EditGroupData48Value()%>" >


                                                </div>
                                                <div class="clear"></div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="SaveContact" value="Save_Contact" name="GroupDetailBotons" class="btn btn-success">Save</button>
                                              </div>