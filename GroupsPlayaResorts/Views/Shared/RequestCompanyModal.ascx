<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<script type="text/javascript">
    $(document).ready(function () {


        $('#editcompanycountry').selectpicker();
        $('#editcompanystate').selectpicker();

    });

     </script>

                                <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                                    <%If Model.EditGroupData39Value() <> 0 Then%>

                                                <h4 class="modal-title">Update Company</h4>

                                    <%Else%>
                                                <h4 class="modal-title">New Company</h4>

                                    <%End If%>
                                              </div>
                                              <div class="modal-body" >

                                                <div class="">

                                                   <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Company Name *</small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modalcompanyname" name="modalcompanyname" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditGroupData38Value()%>" >
                                                    </div>
                                                  </div>



                                                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                    <span><small> Company Key </small></span>
                                                    <div class="input-group  btn-group col-xs-12 col-md-12">
                                                      <input type="text" id="modalcompanykey" name="modalcompanykey" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.EditGroupData37Value()%>" >
                                                    </div>
                                                  </div>



                                                      <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                        <span><small>IATA *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                          <input type="text" id="EditCompanieIATA" name="EditCompanieIATA" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditGroupData40Value()%>">
                                                        </div>
                                                      </div>


                                                      <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                                        <span><small>Zip Code *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                         <input type="text" id="EditCompanieZipCode" name="EditCompanieZipCode" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditGroupData41Value()%>" >
                                                        </div>
                                                      </div>


                  <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                   <span><small>Country *</small></span>
                     <select class="selectpicker" name="editcompanycountry" id="editcompanycountry" data-width="100%">
                                                             <%
                                                                 Dim j As Integer
                
                                                                 For j = 0 To Model.ListCountryin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListCountryin.Item(j).Value = Model.EditGroupData42Value Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListCountryin.Item(j).Value%>"><%:Model.ListCountryin.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                              
                                                            </select>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" role="group">
                   <span><small>State *</small></span>
                      <select class="selectpicker" name="editcompanystate" id="editcompanystate" data-width="100%">
                                                            <%
                                                                               
                
                                                                For j = 0 To Model.ListStatein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListStatein.Item(j).Value = Model.EditGroupData49Value Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListStatein.Item(j).Value%>"><%:Model.ListStatein.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                             
                                                            </select>
                </div>



                                                  <input type="text"  id="EditCompanyID" name="EditCompanyID" hidden value="<%:  Model.EditGroupData39Value()%>" >

                                                  <div class="clear"></div>

                                                 

                                                </div>


                                        <div class="clear"></div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="SaveCompany" value="Save_Company" name="GroupDetailBotons" class="btn btn-success">Save</button>
                                              </div>