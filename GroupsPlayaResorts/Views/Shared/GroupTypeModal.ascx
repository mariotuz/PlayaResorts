<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

  

          <div class="modal-body"><!-- Start modal body-->
            <%--<div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->--%>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <span><small>Group Type *</small></span>
                  <div class="input-group  btn-group col-xs-12 col-md-12">
                  
                       <input type="text" class="form-control input-custom corners-inputs obligatorio" id="EditGroupTypeName" name="EditGroupTypeName" placeholder="" value="<%: Model.EditGroupTypeName()%>" >
                  </div>
                </div>

                <div class="clear"></div><br />

              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                 
                                                                    <span><small> Special Concessions Social Groups </small></span><br>
                                                                    <textarea id="EditspecialData" name="EditspecialData"   rows="15" cols="250" placeholder=""><%:  Model.EditGroupSpecial()%></textarea>

                   </div>
                                                                     
                                                      
              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                                                                        <span><small> Special Concessions MICE Groups </small></span><br>
                                                                    <textarea id="EditspecialDataMICE" name="EditspecialDataMICE"   rows="15" cols="250" placeholder=""><%:  Model.EditGroupSpecialMICE()%></textarea>


                   </div>
                                                                         
                           
                 <div class="clear"></div>
            <%--  </div><!--end form-->--%>


              <input type="text"  id="EditGroupTypeID" name="EditGroupTypeID" hidden value="<%:  Model.EditGroupTypeID()%>" >

            <div class="clear"></div>

          </div><!-- End modal body-->