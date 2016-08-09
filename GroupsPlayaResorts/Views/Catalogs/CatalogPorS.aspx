<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="CatalogPorSTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Products & Services
</asp:Content>


<asp:Content ID="CatalogPorSContent" ContentPlaceHolderID="MainContent" runat="server">

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


                          <!-- Start tab Products & services Section-->
                          <div class="bhoechie-tab-content active">
                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new Product & service list-->
                                      <li role="presentation" class="active"><a href="#newproduct" aria-controls="newproduct" role="tab" data-toggle="tab">Add New Product Or Service</a></li>
                                      <li role="presentation"><a href="#productList" aria-controls="productList" role="tab" data-toggle="tab">Products And Services List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add product list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newproduct"><!--Star tab form product-->

                                              

                                                <header class="encabezado"><h2 class="md-display-2">Add New Product Or Service.</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Product Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                          <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
                                                        </div>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Type * <span class="glyphicon glyphicon-warning-sign " aria-hidden="true"></span></small></span>
                                                           <select class="selectpicker" data-width="100%">
                                                              <option>Type 1</option>
                                                              <option>Type 2</option>
                                                              <option>type 3</option>
                                                            </select>
                                                      </div>

                                                      <div class="btn-group col-xs-12 col-sm-4 col-md-4 col-lg-4" role="group">
                                                         <span><small>Supplier *</small></span>
                                                           <select class="selectpicker" data-width="100%">
                                                              <option>option 1</option>
                                                              <option>option 2</option>
                                                              <option>option 3</option>
                                                            </select>
                                                      </div>
                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="new" class="btn btn-success">Save New Item</button>
                                                      </div>

                                                      



                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                              <div class="clear"></div>
                                            </div><!--end tab form prodcut-->


                                            <div role="tabpanel" class="tab-pane" id="productList"> <!-- Start prodcuts list-->

                                                <header class="encabezado"><h2 class="md-display-2">Product Or Service List.</h2><p></p></header>
                                                <center>

                                                  <div id="toolbar">
                                                    <button id="edit" type="button" class="btn btn-default" data-toggle="modal" data-target="#proservModal"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                    <%--<button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalproserv">View info</button>--%>
                                                    <button id="delet" type="button" class="btn btn-default">Delete</button>
                                                  </div>
                                          
                                                  <table class="table-no-bordered" id="table-list"
                                                         data-toggle="table"
                                                         data-show-export="false"
                                                         data-pagination="true"
                                                         data-search="true"
                                                         data-show-columns="false"
                                                         data-toolbar="#toolbar"
                                                         data-filter-control="false"
                                                         data-page-size="10"
                                                         >
                                                      <thead>
                                                        <tr>
                                                            <th data-field="Actions"  data-switchable="false" >Actions</th>
                                                            <th data-field="Product&nbsp;Name" >Product Name</th>
                                                            <th data-field="Type" >Type</th>
                                                            <th data-field="Supplier" >Supplier</th>
                                                        </tr>
                                                      </thead>

                                                       <tbody>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            
                                                             
                                                        </tbody>
                                                  </table>
                                                </center>

                                            </div><!--end prodcuts list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add product list sections-->
                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>
                          </div>
                          <!-- enda tab Products & services section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper-->  


</asp:Content>
