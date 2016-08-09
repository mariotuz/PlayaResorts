<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<%  If Model.Accion = 6 Then%>

  <script type="text/javascript">
      $(document).ready(function () {

          $("#loglisthead").addClass("active");
          $("#loglist").addClass("active");

          $("#lognotehead").removeClass("active");
          $("#lognote").removeClass("active");


      });

     </script>

<%  End If%>

                                                                   <div id="toolbar-log" >
                                                                      
                                                                      <button id="UpdateLogBook" name="GroupDetailBotons" value="Update_LogBook"  class="btn btn-default"> Update Data </button>
                                                                     <!--action btns table here-->

                                                                  </div>

   <table class="table-no-bordered" id="table-log" data-toggle="table" data-show-export="false"  data-pagination="true" data-search="true" data-show-columns="false" data-toolbar="#toolbar-log" data-filter-control="false" data-page-list="[5, 10, 25, 50, 100, All]" data-page-size="25">
                                                                        <thead>
                                                                          <tr>
                                                                              <th data-field="Id&nbsp;LogBook" >Id LogBook</th>
                                                                              <th data-field="Input&nbsp;Type"  >Input Type</th>
                                                                              <th data-field="Notes" >Notes</th>
                                                                              <th data-field="User&nbsp;" >User</th>
                                                                              <th data-field="Date&nbsp;Register&nbsp;Input" >Date Register Input</th>
                                                                          </tr>
                                                                        </thead>

                                                                        <tbody>


                                                                            <% 
                                                                                Dim i As Integer
                
   
                                                                                For i = 0 To Model.ListGroupLogBookin.Count - 1
                     
                                                                                    Response.Write("<tr>")
                                                                     
                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write("000" + Model.ListGroupLogBookin.Item(i).LogBookID.ToString)
                                                                                    Response.Write("</td>")
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                     
                                                                                    
                                                                                    Select Case Model.ListGroupLogBookin.Item(i).InputType
                                                                                        Case 1
                                                                                            Response.Write("GROUPS")
                                                                                        Case 2
                                                                                            Response.Write("PAYMENTS")
                                                                                        Case 3
                                                                                            Response.Write("BREAKDOWN")
                                                                                        Case 4
                                                                                            Response.Write("EVENTS")
                                                                                            
                                                                                    End Select
                                                                                      
                                                                                   
                                                                                    Response.Write("</td>")
                     
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Model.ListGroupLogBookin.Item(i).NotesLogBook)
                                                                                    Response.Write("</td>")
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Model.ListGroupLogBookin.Item(i).UserLogBook)
                                                                                    Response.Write("</td>")
                                                                                    
                                                                                    Dim Date1 As Date = Model.ListGroupLogBookin.Item(i).DateLogBook
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Date1.ToString("yyyy-MM-dd hh:mm:ss tt"))
                                                                                    Response.Write("</td>")
                   
                                                                                    
                                                                                    Response.Write("</tr>")
                                                                                Next
                
                                                                             %>
                                                                     
                                                                        </tbody>  
                                                                  </table>