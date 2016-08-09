<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Inside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.GroupsList)" %>


<asp:Content ID="EventsListTitle" ContentPlaceHolderID="TitleContent" runat="server"> Event List </asp:Content>

<asp:Content ID="EventsListContent" ContentPlaceHolderID="MainContent" runat="server">

             <script type="text/javascript">


                 $(document).ready(function () {

                     $('.load-container').fadeOut('slow');

                 });

            </script>


                 <!-- Start Page content -->
            <div id="page-content-wrapper">

                <!-- Keep all page content within the page-content inset div! -->
                <div class="page-content inset"><!--Start page content wrapper-->

                  <%--  <header class="encabezado"><h2 class="md-display-2">Event List</h2>
                    </header>--%>

                  
        
                    <table class="table-no-bordered" id="table-list" data-toggle="table" data-show-export="false" data-pagination="true"  data-search="true" data-show-columns="true" data-toolbar="#toolbar" data-filter-control="false" data-page-size="50"  data-height="600" >
                          <thead>
                            <tr>

                               <%-- <th data-field="Action" data-switchable="false"></th>--%>
                                <th data-field="Id&nbsp;Event" data-filter-control="select" >Id Event</th>
                                <th data-field="Event" data-filter-control="select" >Event</th>
                                <th data-field="Id&nbsp;Group"  data-filter-control="select">Id Group</th>
                                <th data-field="Group" data-filter-control="select" >Group</th>
                                <th data-field="Wholesale" data-filter-control="select">Wholesale</th>
                                <th data-field="Contact" data-filter-control="select">Contact</th>
                                <th data-field="Company" data-filter-control="select">Company</th>
                                <th data-field="Event&nbsp;Date" data-filter-control="select">Event Date</th>
                                <th data-field="Event&nbsp;Start&nbsp;Time" data-filter-control="select">Event Start Time</th>
                                <th data-field="Event&nbsp;End&nbsp;Time" data-filter-control="select">Event End Time</th>
                                <th data-field="Assigned&nbsp;Area" data-filter-control="select">Assigned Area</th>
                                <th data-field="Status" data-filter-control="select">Status</th>
                                <th data-field="No&nbsp;Pax" data-filter-control="select">No. Pax</th>
                                <th data-field="Seller" data-filter-control="select">Seller</th>
                                <th data-field="Coordinator" data-filter-control="select">Coordinator</th>
                                <th data-field="Total&nbsp;Deposits" data-filter-control="select">Total Deposits</th>
                                <th data-field="Balance" data-filter-control="select">Balance</th>
                                <th data-field="Revenue" data-filter-control="select">Revenue</th>
                            </tr>
                          </thead>

                          <tbody>

                           <%
                               
                               Dim i As Integer
                               
                                   Dim Date1 As Date
                                   Dim Date2 As Date
                                   Dim Date3 As Date
                                   
   
                                   For i = 0 To Model.ListGroupDatain.Count - 1
                                       
                                   Response.Write("<tr>")
                                   
                                      
                                   'Response.Write("<td>")  
                                   'Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""btn btn-default"" ><i class=""fa fa-pencil-square-o""></i></a>")
                                   'Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum2)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                    
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum3.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                    
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum4)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum5.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum6.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum7.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum8.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                  
                                
                                   Date1 = Model.ListGroupDatain.Item(i).Colum9
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Date1.ToString("yyyy-MM-dd"))
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                  
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum10)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum11)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                    
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum12.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                    
                                   Select Case Model.ListGroupDatain.Item(i).Colum13
                                       Case 1
                                           Response.Write("<td >")
                                           Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list_dos confirmed""  >")
                                           Response.Write("ACTIVE")
                                       Case 2
                                           Response.Write("<td >")
                                           Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list_dos canceled""  >")
                                           Response.Write("CANCELED")
                                         
                                   End Select
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum14)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum15.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(Model.ListGroupDatain.Item(i).Colum16.ToUpper)
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(FormatNumber(Model.ListGroupDatain.Item(i).Colum17, 2, , , TriState.True))
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(FormatNumber(Model.ListGroupDatain.Item(i).Colum18, 2, , , TriState.True))
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("<td>")
                                   Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum1 + """ class=""link_list""  >")
                                   Response.Write(FormatNumber(Model.ListGroupDatain.Item(i).Colum19, 2, , , TriState.True))
                                   Response.Write(" </a>")
                                   Response.Write("</td>")
                                   
                                   Response.Write("</tr>")
                                   
                               Next
                               
                
                %>
                            
                            
                           
                          </tbody>  
                    </table>

                    <div class="balance-list-groups col-xs-12 col-sm-12 col-md-12">
                        <ul class="col-xs-12 col-sm-12 col-md-12 nopadding">
                          <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number">$0.00</span><span class="title-number">Total Deposits</span></li>
                          <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number">$0.00</span><span class="title-number">Balance</span></li>
                          <li class="col-xs-4 col-sm-4 col-md-4 clearfix"><span class="number">$0.00</span><span class="title-number">Total</span></li>
                        </ul>
                    </div>
                </div><!-- end Page content wrapper-->
            </div><!--end page content-->


</asp:Content>
