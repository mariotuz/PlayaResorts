<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

   <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

                                                                     <div id="toolbar-doc" >
                                                                      
                                                                      <button id="UpdateDoc" name="GroupDetailBotons" value="Update_Doc"  class="btn btn-default"> Update Data </button>
                                                                     <!--action btns table here-->
                                                                  </div>


<table class="table-no-bordered" id="table-list" data-toggle="table" data-show-export="false" data-pagination="true" data-search="true" data-show-columns="false" data-toolbar="#toolbar-doc" data-filter-control="false"  data-page-size="20"  >
                                                                        <thead>
                                                                          <tr>
                                                                              
                                                                              <th data-field="Type&nbsp;Document"  >Type Document</th>
                                                                              <th data-field="Actions"  >Actions</th>
                                                                              <th data-field="User" >User</th>
                                                                              <th data-field="Date&nbsp;Register&nbsp;Action" >Date Register Action</th>
                                                                          </tr>
                                                                        </thead>

                                                                        <tbody>
                                                                         
                                                                       

                                                                            <% 
                                                                                Dim i As Integer
                
   
                                                                                For i = 0 To Model.ListGroupDocumentsin.Count - 1
                     
                                                                                    Response.Write("<tr>")
                                                                     
                                                                    
                                                                                    Response.Write("<td>")
                                                                                    
                                                                                    If Model.ListGroupDocumentsin.Item(i).TypeDocument = 1 Then
                                                                                        Response.Write("PROPOSAL")
                                                                                    Else
                                                                                        Response.Write("ENROLLMENT FORM")
                                                                                    End If
                                                                                   
                                                                                    Response.Write("</td>")
                     
                                                                                    Response.Write("<td>")
                                                                                    
                                                                                    If Model.ListGroupDocumentsin.Item(i).Actions = 1 Then
                                                                                        Response.Write("GENERATE FILE")
                                                                                    Else
                                                                                        Response.Write("<a target='_blank' href=""/Content/uploads_files/" + Model.ListGroupDocumentsin.Item(i).URL + """ >UPLOAD FILE </a>")
                                                                                    End If
                                                                                    
                                                                                    Response.Write("</td>")
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Model.ListGroupDocumentsin.Item(i).User)
                                                                                    Response.Write("</td>")
                                                                                    
                                                                                    Dim Date1 As Date = Model.ListGroupDocumentsin.Item(i).DateRegister
                                                                                    
                                                                                    Response.Write("<td>")
                                                                                    Response.Write(Date1.ToString("yyyy-MM-dd hh:mm:ss tt"))
                                                                                    Response.Write("</td>")
                    
                    
                    
                                                                                    Response.Write("</tr>")
                                                                                Next
                
                                                                %>
                                                                          
                                                         
                                                                        </tbody>  
                                                                  </table>