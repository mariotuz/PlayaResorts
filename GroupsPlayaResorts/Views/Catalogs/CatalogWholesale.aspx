<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="CatalogWholesaleTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Catalog Wholesale
</asp:Content>


<asp:Content ID="CatalogWholesaleContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Start Page content wrapper-->
    <div id="page-content-wrapper">
                                                        

          <!-- Keep all page content within the page-content inset div! -->
          <div class="page-content inset"><!--Start page content-->


              <div class="col-lg-11 col-md-10 col-sm-10 col-xs-10 bhoechie-tab minheight-tab"><!--star group tab-->

                          <div class="bhoechie-tab-content"> <!-- start tab Users section -->
                            users
                          </div><!--end tab Users sections-->

                          <!-- Start tab Profile section -->
                          <div class="bhoechie-tab-content">
                            profile
                          </div><!-- end tab Profile section -->
              
                          <!-- Start tab Properties section -->
                          <div class="bhoechie-tab-content">
                            Properties
                          </div>
                          <!-- end tab Properties section-->

                          <!-- Start tab Market section-->
                          <div class="bhoechie-tab-content">
                            Market
                          </div>
                          <!-- end tab market section-->

                          <!-- Start tab Group Type Section-->
                          <div class="bhoechie-tab-content">
                            Group type
                          </div>
                          <!-- enda tab Group Type section-->

                          <!-- Start tab Wholesale section-->
                          <div class="bhoechie-tab-content active">

                              <div role="tabpanel" class="col-md-12 minheight group-tabs"><!--Start  tabs-panel 125-->

                                    <ul class="nav nav-tabs my-tabs" role="tablist" id="myTab"><!--menu tab new wholesale list of users-->
                                      <li role="presentation" class="active"><a href="#newhole" aria-controls="newhole" role="tab" data-toggle="tab">Add New Wholesale</a></li>
                                      <li role="presentation"><a href="#wholelist" aria-controls="wholelist" role="tab" data-toggle="tab">Wholesales List</a></li>
                                    </ul>

                                    <div class="tab-content "><!--Start tabs add wholesale list sections-->

                                            <div role="tabpanel" class="tab-pane active" id="newhole"><!--Star tab form wholesale-->

                                                

                                                <header class="encabezado"><h2 class="md-display-2">Add New Wholesale</h2><p> </p></header>

                                                <div class="col-lg-11 col-md-12 col-sm-12 col-xs-12 form-catalog"><!--form-->

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Wholesale Name *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                          <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
                                                        </div>
                                                      </div>

                                                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <span><small>Key Wholesale *</small></span>
                                                        <div class="input-group  btn-group col-xs-12 col-md-12">
                                                          <input type="text" class="form-control input-custom corners-inputs" placeholder="" >
                                                        </div>
                                                      </div>
                                                      
                                                      <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <br>
                                                        <button id="new" class="btn btn-success">Save New Wholesale</button>
                                                      </div>

                                                   <div class="clear"></div>
                                                </div><!--end form-->


                                              <div class="clear"></div>
                                            </div><!--end tab form wholesale-->


                                            <div role="tabpanel" class="tab-pane" id="wholelist"> <!-- Start wholesale list-->

                                                <header class="encabezado"><h2 class="md-display-2">Wholesales List</h2><p> </p></header>
                                                <center>

                                                  <div id="toolbar">
                                                    <button id="edit" type="button" class="btn btn-default" data-toggle="modal" data-target="#wholeModal"><i class="fa fa-pencil-square-o"></i> Edit</button>
                                                    <button id="info" type="button" class="btn btn-default" data-toggle="modal" data-target="#infoModalwhole">View info</button>
                                                    <button id="delet" type="button" class="btn btn-default">Delete</button>
                                                  </div>
                                          
                                                  <table class="table-no-bordered" id="table-list"
                                                         data-toggle="table"
                                                         data-show-export="true"
                                                         data-pagination="true"
                                                         data-search="true"
                                                         data-show-columns="true"
                                                         data-toolbar="#toolbar"
                                                         data-filter-control="true"
                                                         >
                                                      <thead>
                                                        <tr>
                                                          <th data-radio="true"  data-switchable="false" class="opacity-0"></th>
                                                            <th data-field="Wholesale&nbsp;Name" data-filter-control="select">Wholesale Name</th>
                                                            <th data-field="Key&nbsp;Wholesale" data-filter-control="select">Key Wholesale</th>
                                                        </tr>
                                                      </thead>

                                                       <tbody>

                                                            <tr>
                                                                <td></td>
                                                                <td>THE MARK TRAVEL CORPORATION</td>
                                                                <td>FUNJET</td>
                                                            </tr>
                                                             
                                                            <tr>
                                                                <td></td>
                                                                <td>EXPEDIA, INC. CAN - EUA</td>
                                                                <td>EXPEDIA</td>
                                                            </tr>
                                                             
                                                        </tbody>
                                                  </table>
                                                </center>

                                            </div><!--end wholesale list--> 
                                      <div class="clear"></div>  
                                    </div><!--end tabs add wholesale list sections-->

                                </div><!--end tabs-panel 125-->
                              <div class="clear"></div>

                          </div>
                          <!-- end tab Wholesale section-->

              <div class="clear"></div>
              </div><!--end group tab-->



          <div class="clear"></div>
          </div><!--end page content-->

     <div class="clear"></div>
    </div>
    <!-- end Page content wrapper--> 

</asp:Content>
