<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="CatalogPropertiesTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Properties
</asp:Content>


<asp:Content ID="CatalogPropertiesContent" ContentPlaceHolderID="MainContent" runat="server">


      <script type="text/javascript">


          $(document).ready(function () {

              $('.load-container').fadeOut('slow');

          });

    </script>


        <!-- Start Page content wrapper-->
    <div id="page-content-wrapper">
                                                        

          <!-- Keep all page content within the page-content inset div! -->
          <div class="page-content inset"><!--Start page content-->


              <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                  <div class="bhoechie-tab-content"> <!-- start tab Users section -->
                    jajajaja
                  </div><!--end tab Users sections-->


                          <!-- Start tab Profile section -->
                          <div class="bhoechie-tab-content">

                          </div><!-- end tab Profile section -->
              
                          <!-- Start tab Properties section -->
                          <div class="bhoechie-tab-content active">
                                                            <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new Property list of users-->
                                      <li role="presentation" class="active"><a href="#newproperty" aria-controls="newproperty" role="tab" data-toggle="tab">Add New Property</a></li>
                                      <li role="presentation"><a href="#propertylist" aria-controls="propertylist" role="tab" data-toggle="tab">Properties List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add Property list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newproperty"><!--Star tab form property-->

                                            

                                                <header class="encabezado"><h2 class="md-display-2">Add Property</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Property Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                          <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Property Alias *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                        </div>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                          <span><small>Country *</small></span>
                                                            <select class="selectpicker" data-width="100%" multiple title='Choose One Conutry' data-max-options="1" data-size="10">
                                                                <option data-subtext="Afganistan">AF</option>
                                                                <option data-subtext="ÅAand Islands">AX</option>
                                                                <option data-subtext="Albania">AL</option>
                                                            </select>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                          <span><small>State * <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span></small></span>
                                                            <select class="selectpicker" data-width="100%" multiple title='Choose One City' data-max-options="1" data-size="10">
                                                                <option>State 1</option>
                                                                <option>State 2</option>
                                                                <option>State 3</option>
                                                            </select>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>City *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                        </div>
                                                      </div>

                                                      <div class="add-room col-xs-12 col-sm-12 col-md-12 col-lg-12 ">

                                                        <header class="encabezado"><h2 class="md-display-2">Rooms Type</h2><p> </p></header>

                                                          
                                                          <ol>
                                                              <!--row inputs-->
                                                              
                                                              <div style="margin-bottom:4px;" class="clonedInput col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
                                                                  
                                                                    <li>
                                                                      <!--inputs group-->
                                                                      <div class=" btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                                        <span><small>Category Name (Spanish) * <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span></small></span>
                                                                        <input type="text" class="form-control input-custom corners-inputs" name="input1" /><br>

                                                                      </div>

                                                                      <div class="  btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                                        <span><small>Category Name (English) *</small></span>
                                                                        <input type="text" class="form-control input-custom corners-inputs" name="input2" /><br>
                                                                      </div>

                                                                      <div class="  btn-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                                        <span><small>Category Alias *</small></span>
                                                                        <input type="text" class="form-control input-custom corners-inputs" name="input3" /><br>
                                                                      </div>
                                                                      <!--inputs group-->

                                                                      <!--btn delete inputs-->
                                                                      <div style=" margin-top:20px; ">
                                                                        <input type="button" class="btnDel btn btn-success" value="Remove" disabled="disabled" />
                                                                      </div>
                                                                    </li>
                                                                  
                                                              </div>
                                                              <!--row inputs-->
                                                            </ol>
                                                              <!--btn add inputs-->
                                                              <div style=" margin-top:5px; ">
                                                                  <input style="background:green !important;" type="button" id="btnAdd" class="btn btn-success fa fa-plus-circle" value=" Add" />
                                                              </div>
                                                      

                                                      </div>
                                                      

                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="new" class="btn btn-success">Save New Property</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                              <div class="clear"></div>
                                            </div><!--end tab form property-->


                                            <div role="tabpanel" class="tab-pane" id="propertylist"> <!-- Start Properties list-->

                                                <header class="encabezado"><h2 class="md-display-2">Properties List</h2><p> </p></header>
                                                <center>

                                                  <div id="toolbar">
                                                    <button id="edit" type="button" class="btn btn-default" data-toggle="modal" data-target="#propertyModal"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                   <%-- <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalproperty">View info</button>--%>
                                                    <button id="delet" type="button" class="btn btn-default">Delete</button>
                                                  </div>
                                          
                                                  <table class="table-no-bordered" id="table-list"
                                                         data-toggle="table"
                                                         data-show-export="false"
                                                         data-pagination="true"
                                                         data-search="true"
                                                         data-show-columns="false"
                                                         data-toolbar="#toolbar"
                                                         data-filter-control="true"
                                                         >
                                                      <thead>
                                                        <tr>
                                                          <th data-radio="true"  data-switchable="false" class="opacity-0"></th>
                                                            <th data-field="Property&nbsp;Name" data-filter-control="select">Property Name</th>
                                                            <th data-field="Property&nbsp;Alias"  data-filter-control="select">Property Alias</th>
                                                          
                                                        </tr>
                                                      </thead>

                                                       <tbody>
                                                            <tr>
                                                                <td></td>
                                                                <td>Gran Caribe Real</td>
                                                                <td>GCR</td>
                                                               
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>Hyatt Zilara Cancun</td>
                                                                <td>TRC</td>
                                                               
                                                            </tr>
                                                             
                                                   
                                                             
                                                        </tbody>
                                                  </table>
                                                </center>

                                            </div><!--end Properties list--> 


                                      <div class="clear"></div>  
                                    </div><!--end tabs add property list sections-->
                                </div><!--end tabs-panel 125-->

                              <div class="clear"></div>

                          </div>
                          <!-- end tab Properties section-->

                          <div class="bhoechie-tab-content">
                              <center>
                                <h1 class="glyphicon glyphicon-cutlery" style="font-size:12em;color:#55518a"></h1>
                                <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                <h3 style="margin-top: 0;color:#55518a">Restaurant Diirectory</h3>
                              </center>
                          </div>

                          <div class="bhoechie-tab-content">
                              <center>
                                <h1 class="glyphicon glyphicon-credit-card" style="font-size:12em;color:#55518a"></h1>
                                <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                <h3 style="margin-top: 0;color:#55518a">Credit Card</h3>
                              </center>
                          </div>

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->     



</asp:Content>
