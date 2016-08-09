<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>
  
 <script type="text/javascript">
     $(document).ready(function () {


         $('#EditContactType').selectpicker();

     });

  </script>

         <div class="modal-body"><!-- Start modal body-->

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Contact Name *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text"  class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacname" id="Editcontacname" value="<%: Model.EditContactName()%>" >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>E-mail *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacemail" id="Editcontactemail" value="<%: Model.EditContactEmail()%>"  >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Telephone 1 *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs obligatorio" placeholder="" name="Editcontacphoneuno" id="Editcontacphoneuno" value="<%: Model.EditContactPhoneUno()%>" >
              </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Telephone 2</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12">
                <input type="text" class="form-control input-custom corners-inputs" placeholder="" name="Editcontacphonedos" id="Editcontacphonedos" value="<%: Model.EditContactPhoneDos()%>"  >
              </div>
            </div>

            <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
               <span><small>Contact type *</small></span>
                 <select class="selectpicker" name="EditContactType" id="EditContactType" data-width="100%">
                                <option  <% If Model.EditContactType = "1" Then%> selected <% End if%> value="1">Wholesale</option>
                                <option  <% If Model.EditContactType = "0" Then%> selected <% End if%> value="0">Company</option>
                  </select>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
               <span><small> Wholesale / Company </small></span>
               <div class="input-group  btn-group col-xs-12 col-md-12">
                   <input type="text" class="form-control input-custom corners-inputs" placeholder="" name="Editcontacwhosalecompany" id="Editcontacwhosalecompany" value="<%: Model.EditContactWhosaleCompany()%>" >
                                                          
               </div>
            </div>

             <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Postal Code *</small></span>
                <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                    <input type="text" id="postal_code" name="postal_code" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.PostalCode()%>" >
                </div>
            </div>


            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                <span><small>Country *</small></span>
                <select class="selectpicker" name="country" id="country" data-width="100%">
                <%
                    Dim j As Integer
                
                    For j = 0 To Model.ListCountryin.Count - 1
               %>
                    <option <% If Model.ListCountryin.Item(j).Value = Model.Country Then
                            Response.Write("selected='selected'")
                        End If%> value="<%:Model.ListCountryin.Item(j).Value%>"><%:Model.ListCountryin.Item(j).Text%></option>             
                <%        
                    Next
                %>
                                                              
                </select>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                <span><small>State *</small></span>
                <select class="selectpicker" name="state" id="state" data-width="100%">
                <%
                    For j = 0 To Model.ListStatein.Count - 1
                %>
                    <option <% If Model.ListStatein.Item(j).Value = Model.State Then
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
                                                        
                    <input type="text" id="city" name="city" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.City()%>" >
                </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                <span><small>Address *</small></span>
                <div class="input-group  btn-group col-xs-12 col-md-12">
                                                        
                    <input type="text" id="address" name="address" class="form-control input-custom corners-inputs" placeholder="" value="<%: Model.Address()%>" >
                </div>
            </div>

             <input type="hidden"  id="user" name="user" value="<%: Session.Item("UserName")%>" >

           <input type="text"  id="EditContactID" name="EditContactID" hidden value="<%:  Model.EditContactid()%>" >

            <div class="clear"></div>

          </div><!-- End modal body-->