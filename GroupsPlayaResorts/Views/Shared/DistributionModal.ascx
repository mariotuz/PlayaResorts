<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

 <script type="text/javascript" src="<%: Url.Content("~/Scripts/add/add_items.js")%>"></script>

 <script type="text/javascript">
     $(document).ready(function () {


         $('#EditHotelSelect').selectpicker();

     });

     </script>


            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <span><small>Distribution Group Name *</small></span>
              <div class="input-group  btn-group col-xs-12 col-md-12"> 
                <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditDistributionName" name="EditDistributionName" placeholder="" value="<%: Model.EditDistributionGroupName()%>" >
              </div>
            </div>




            <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
               <span><small>Property *</small></span>
                   <select class="selectpicker" id="EditHotelSelect" name="EditHotelSelect" data-width="100%">
                                                                              <option <% If Model.EditDistributionProperty = "GCR" Then%> selected <% End if%> value="GCR">Gran Caribe Cancun</option>
                                                                              <option <% If Model.EditDistributionProperty = "GPR" Then%> selected <% End if%> value="GPR">Gran Porto Playa del Carmen</option>
                                                                              <option <% If Model.EditDistributionProperty = "RPR" Then%> selected <% End if%> value="RPR">The Royal Playa del Carmen</option>
                                                                              <option <% If Model.EditDistributionProperty = "TRC" Then%> selected <% End if%> value="TRC">Hyatt Zilara Cancun</option>
                                                                              <option <% If Model.EditDistributionProperty = "ZLJ" Then%> selected <% End if%> value="ZLJ" >Hyatt Zilara Rose Hall Jamaica</option>
                                                                              <option <% If Model.EditDistributionProperty = "ZVC" Then%> selected <% End if%> value="ZVC">Hyatt Ziva Cancun</option>
                                                                              <option <% If Model.EditDistributionProperty = "ZVJ" Then%> selected <% End if%> value="ZVJ">Hyatt Ziva Rose Hall Jamaica</option>
                                                                              <option <% If Model.EditDistributionProperty = "ZVL" Then%> selected <% End if%> value="ZVL">Hyatt Ziva Los Cabos</option>
                                                                              <option <% If Model.EditDistributionProperty = "ZVP" Then%> selected <% End if%> value="ZVP">Hyatt Ziva Puerto Vallarta</option>
                                                                            </select>
            </div>
            <div class="clear"></div>

                                                        
             
                <header class="encabezado"><h2 class="md-display-2">Add Email</h2></header>
                  <ol >
                      <!--row inputs-->

                        <%
                                                                                    Dim j As Integer
                                                                                    
                                                                                    If Model.ListaEmailGroupsin.Count = 0 Then
                                                                                        
                                                                                        %>


                      
                      <div style="margin-bottom:4px;" class="clonedInputmailEdit col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                          
                            <li>
                              <!--inputs group-->
                              <div class=" btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <span><small>Email *</small></span>
                                <input type="text" class="form-control input-custom corners-inputs obligatorio" name="editemailist" /><br>
                              </div>

                              <!--btn delete inputs-->
                              <div style=" margin-top:20px; ">
                                <input type="button" class="btnDelmailedit btn btn-success" value="Remove" disabled="disabled" />
                              </div>
                            </li>
                          
                      </div>
                      <!--row inputs-->

                       <%
                                                                                        
                                                                                    Else
                                                                                        
                                                                                        
                                                                                    
                
                           For j = 0 To Model.ListaEmailGroupsin.Count - 1
                                                                                     %>



                         <div style="margin-bottom:4px;" class="clonedInputmailEdit col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                          
                            <li>
                              <!--inputs group-->
                              <div class=" btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <span><small>Email *</small></span>
                                <input type="text" class="form-control input-custom corners-inputs obligatorio" name="editemailist" value="<%:Model.ListaEmailGroupsin.Item(j).Text%>" /><br>
                              </div>

                              <!--btn delete inputs-->
                              <div style=" margin-top:20px; ">
                                <input type="button" class="btnDelmailedit btn btn-success" value="Remove"  disabled="disabled" />
                              </div>
                            </li>
                          
                      </div>
                      <!--row inputs-->



                       <%        
                                                                                    Next
                                                                                    
                                                                                    
                                                                                    
                                                                                End If
                                                                                    %>
                                                                


                  </ol>
                    <!--btn add inputs-->
                    <div style=" margin-top:5px; ">
                        <input style="background:green !important;" type="button" id="btnAddmailedit" class="btn btn-success fa fa-plus-circle" value=" Add" />
                    </div>
           


                <input type="text"  id="EditDistributionId" name="EditDistributionId" hidden value="<%:  Model.EditDistributionGroupID()%>" >

  

  