<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>
  
<script type="text/javascript">
    $(document).ready(function () {


        $('#editsuppliercountry').selectpicker();
        $('#editsupplierstate').selectpicker();

    });

     </script>

  <div class="modal-body"><!-- Start modal body-->
            <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Company Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                     <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditCompanyName" name="EditCompanyName" placeholder="" value="<%: Model.EditCompanie()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Key Company *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditCompanyKey" name="EditCompanyKey" placeholder="" value="<%: Model.EditComapnieKey()%>" >
                  </div>
                </div>


                                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>IATA *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                          <input type="text" id="EditCompanieIATA" name="EditCompanieIATA" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.EditCompanieIATA()%>" >
                                                        </div>
                                                      </div>


                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Zip Code *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                                                         <input type="text" id="EditCompanieZipCode" name="EditCompanieZipCode" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.EditCompanieZIP()%>" >
                                                        </div>
                                                      </div>


                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>Country *</small></span>
                     <select class="selectpicker" name="editcompanycountry" id="editcompanycountry" data-width="100%">
                                                             <%
                                                                 Dim j As Integer
                
                                                                 For j = 0 To Model.ListCountryin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListCountryin.Item(j).Value = Model.EditCompanieCountry Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListCountryin.Item(j).Value%>"><%:Model.ListCountryin.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                              
                                                            </select>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>State *</small></span>
                      <select class="selectpicker" name="editcompanystate" id="editcompanystate" data-width="100%">
                                                            <%
                                                                               
                
                                                                For j = 0 To Model.ListStatein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListStatein.Item(j).Value = Model.EditCompanieState Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListStatein.Item(j).Value%>"><%:Model.ListStatein.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                             
                                                            </select>
                </div>


                           
                 <div class="clear"></div>
              </div><!--end form-->

                <input type="text"  id="EditComapnyID" name="EditComapnyID" hidden value="<%:  Model.EditCompanieid()%>" >

            <div class="clear"></div>

          </div><!-- End modal body-->