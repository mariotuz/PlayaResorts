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


                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Supplier Name *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12" >
                    <input type="text" name="editsuppliername" id="editsuppliername" class="form-control input-custom corners-inputs obligatorio" placeholder=""  value="<%: Model.EditSupplierName()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>RFC Supplier *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" name="editsupplierrfc" id="editsupplierrfc" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditSupplierRFC()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Email *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" name="editsupplieremail" id="editsupplieremail" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditSupplierEmail()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Telephone 1 *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" name="editphone1" id="editphone1" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditSupplierPhone1()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Telephone 2 *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" name="editphone2" id="editphone2" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditSupplierPhone2()%>" >
                  </div>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>Country *</small></span>
                     <select class="selectpicker" name="editsuppliercountry" id="editsuppliercountry" data-width="100%">
                                                             <%
                                                                 Dim j As Integer
                
                                                                 For j = 0 To Model.ListCountryin.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListCountryin.Item(j).Value = Model.EditSupplierCountry Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListCountryin.Item(j).Value%>"><%:Model.ListCountryin.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                              
                                                            </select>
                </div>

                <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                   <span><small>State *</small></span>
                      <select class="selectpicker" name="editsupplierstate" id="editsupplierstate" data-width="100%">
                                                            <%
                                                                               
                
                                                                For j = 0 To Model.ListStatein.Count - 1
                                                                                     %>
                                                                                      <option <% If Model.ListStatein.Item(j).Value = Model.EditSupplierState Then
                                                                                              Response.Write("selected='selected'")
                                                                                          End If%> value="<%:Model.ListStatein.Item(j).Value%>"><%:Model.ListStatein.Item(j).Text%></option>             
                                                                                    <%        
                                                                                        Next
                                                                                    %>
                                                             
                                                            </select>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>City *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <input type="text" name="editsuppliercity" id="editsuppliercity" class="form-control input-custom corners-inputs obligatorio" placeholder="" value="<%: Model.EditSupplierCity()%>" >
                  </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Address *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                    <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="editsupplieraddress" name="editsupplieraddress"  rows="3" cols="50" ><%: Model.EditSupplierAddress()%></textarea>
                  </div>
                </div>

                    <div class="clear"></div>
                           
                   <input type="text"  id="EditSupplierId" name="EditSupplierId" hidden value="<%:  Model.EditSupplierID()%>" >

              
               

  

  