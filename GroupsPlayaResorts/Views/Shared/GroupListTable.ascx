<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

 <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
   <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<%--<script type="text/javascript">

    $(document).ready(function () {

        $(".th-inner").click(function () {

            alert("edgar");

        });
  

    });
</script>--%>

<script type="text/javascript">
    function ValidaTecla(obj) {
        var tecla = (document.all) ? obj.e.keyCode : obj.e.which;
        var valor = obj.valor;

        if (tecla == 13) {
            if (isNaN(obj.valor)) {
                valor = obj.valor.replace(/\D/g, '');
            }

            $('#buscarGrupo').val('');
            window.open('/Groups/GroupDetail?id=' + valor);
        }
    }

    function MuestraGrupo() {
        var valor = $('#buscarGrupo').val();

        if (isNaN(valor)) {
            valor = valor.replace(/\D/g, '');
        }

        $('#buscarGrupo').val('');
        window.open('/Groups/GroupDetail?id=' + valor);
    }

    $(document).ready(function () {
        $('#TotalRevenue').html("$ <%: FormatNumber(Math.Ceiling(Model.TotalRevenue), 0, , , TriState.True) %>");
     });

</script>




                    <div id="toolbar">  
                        <a id="new" target="_blank" class="btn btn-default" href="/Groups/GroupDetail" >Add New Group  </a>
                        <div class="pull-right btnSearch"><span class="btn btn-default fa fa-search" onclick="MuestraGrupo();"></span></div>
                        <div class="pull-right findGroup"><input class="form-control findGroupTxt" type="text" placeholder="Find group" id="buscarGrupo" onkeypress="ValidaTecla({e:event, valor:value});"></div>
                        <%--<a id="donepay" class="btn btn-default" data-toggle="modal" data-target="#deploy">Filters</a>--%>
                    </div>

                    <table class="table-no-bordered" id="table-list" data-toggle="table" data-show-export="false" data-pagination="true" data-height="500" data-search="true" data-show-columns="true" data-toolbar="#toolbar"  data-filter-control="false" data-page-size="50">
                          <thead>
                            <tr>
                               <%-- <th data-field="Action" data-switchable="false" data-visible="false"></th>--%>
                                <th data-field="Quote&nbsp;Date"  data-filter-control="select" >Quote&nbsp;Date</th>
                                <th data-field="Id&nbsp;Group"  data-filter-control="select" >Id Group</th>
                                <th data-field="Group" data-filter-control="select"  >Group</th>
                                <th data-field="Client" data-filter-control="select"  >Client</th>
                                <th data-field="Market" data-filter-control="select" data-visible="false"  >Market</th>
                                <th data-field="Contact" data-filter-control="select"  data-visible="false"  >Contact</th>
                                <th data-field="Agent" data-filter-control="select"  >Agent</th>
                                <th data-field="Checkin" data-filter-control="select" >Checkin</th>
                                <th data-field="Checkout" data-filter-control="select" >Checkout</th>
                                <th data-field="Motive" data-filter-control="select"    >Motive</th>
                                <th data-field="Book&nbsp;Status" data-filter-control="select"  >Book&nbsp;Status</th>
                                <th data-field="Pay&nbsp;Status" data-filter-control="select"  >Pay&nbsp;Status</th>
                                <th data-field="Hotel&nbsp;Status" data-filter-control="select"  >Hotel&nbsp;Status</th>
                                <th data-field="Hotel" data-filter-control="select"  data-visible="false" >Hotel</th>
                                <th data-field="Blended&nbsp;Rate"  data-filter-control="select">Blended Rate</th>
                                <th data-field="Quoted&nbsp;Rate"  data-filter-control="select" data-visible="false">Quoted&nbsp;Rate</th>
                                <th data-field="Peak&nbsp;Nights" data-filter-control="select"  >Peak&nbsp;Nights</th>
                                <th data-field="No&nbsp;Rooms" data-filter-control="select">No&nbsp;Rooms</th>
                                <th data-field="Revenue" data-filter-control="select" >Revenue</th>
                                <th data-field="Deposits" data-filter-control="select" >Deposits</th>
                                <th data-field="Balance" data-filter-control="select"  >Balance</th>

                               <%-- <th data-field="Id&nbsp;Group" data-filter-control="select" >Id Group</th>
                                <th data-field="Group" data-filter-control="select" >Group</th>
                                <th data-field="Quoted&nbsp;Date"  data-filter-control="select" >Quoted&nbsp;Date</th>
                                <th data-field="Client" data-filter-control="select"  >Client</th>
                                <th data-field="Market" data-filter-control="select" data-visible="false" >Market</th>
                                <th data-field="Contact" data-filter-control="select"  data-visible="false" >Contact</th>
                                <th data-field="Agent" data-filter-control="select" >Agent</th>
                                <th data-field="Checkin" data-filter-control="select" >Checkin</th>
                                <th data-field="Checkout" data-filter-control="select" >Checkout</th>
                                <th data-field="Motive" data-filter-control="select"  data-visible="false" >Motive</th>
                                <th data-field="Book&nbsp;Status" data-filter-control="select" >Book&nbsp;Status</th>
                                <th data-field="Pay&nbsp;Status" data-filter-control="select" >Pay&nbsp;Status</th>
                                <th data-field="Hotel&nbsp;Status" data-filter-control="select" >Hotel&nbsp;Status</th>
                                <th data-field="Hotel" data-filter-control="select"  data-visible="false">Hotel</th>
                                <th data-field="Blended&nbsp;Rate"  data-filter-control="select">Blebded Rate</th>
                                <th data-field="Quoted&nbsp;Rate"  data-filter-control="select" data-visible="false">Quoted&nbsp;Rate</th>
                                <th data-field="Peak&nbsp;Nights" data-filter-control="select"  >Peak&nbsp;Nights</th>
                                <th data-field="No&nbsp;Rooms" data-filter-control="select">No&nbsp;Rooms</th>
                                <th data-field="Revenue" data-filter-control="select" >Revenue</th>
                                <th data-field="Deposits" data-filter-control="select" >Deposits</th>
                                <th data-field="Balance" data-filter-control="select"  >Balance</th>--%>
                                
                            </tr>
                          </thead>

                          <tbody>
                            
                              
                               <% 
                                   Dim i As Integer
                                   Dim Date1 As Date
                                   Dim Date2 As Date
                                   Dim Date3 As Date
                                   
   
                                   For i = 0 To Model.ListGroupDatain.Count - 1
                                       
                                       'Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class="""" >")
                                       
                                       Response.Write("<tr  >")
                                       
                                      
                                       '
                    
                                       'Response.Write("<td>")
                                       'Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""btn btn-default"" ><i class=""fa fa-pencil-square-o""></i></a>")
                                       'Response.Write("</td>")
                                       
                                       Date1 = Model.ListGroupDatain.Item(i).Colum2
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Date1.ToString("yyyy-MM-dd"))
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td   >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum1)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       Response.Write("<td >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list""  target=""_blank"" >")
                                       Response.Write("<span style=""display:block;width:150px;height:24px;overflow:hidden;""    >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum20.ToUpper)
                                       Response.Write("</span>")
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       
                                     
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write("<span style=""display:block;width:150px;height:24px;overflow:hidden;""   >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum3.ToUpper)
                                       Response.Write("</span>")
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum4.ToUpper)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum5.ToUpper)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum6.ToUpper)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Date2 = Model.ListGroupDatain.Item(i).Colum7
                                       Response.Write("<td  >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list""  target=""_blank"" >")
                                       Response.Write(Date2.ToString("yyyy-MM-dd"))
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Date3 = Model.ListGroupDatain.Item(i).Colum8
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Date3.ToString("yyyy-MM-dd"))
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum9.ToUpper)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Select Case Model.ListGroupDatain.Item(i).Colum10
                                           Case 1
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("PROSPECT")
                                           Case 2
                                               Response.Write("<td    >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("TENTATIVE")
                                           Case 3
                                               Response.Write("<td    >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos canceled"" target=""_blank""  >")
                                               Response.Write("CANCELED")
                                           Case 4
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm""  target=""_blank"" >")
                                               Response.Write("TURNED DOWN")
                                           Case 5
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("LOST")
                                           Case 6
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos confirmed"" target=""_blank""  >")
                                               Response.Write("DEFINITIVE")
                                           Case 7
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos canceled""  target=""_blank"" >")
                                               Response.Write("EXPIRED")
                                         
                                       End Select
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       
                                       Select Case Model.ListGroupDatain.Item(i).Colum11
                                           Case 1
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("UNPAID")
                                           Case 2
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm""  target=""_blank"" >")
                                               Response.Write("PARTIAL")
                                           Case 3
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos canceled"" target=""_blank""  >")
                                               Response.Write("CANCELED")
                                           Case 4
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("OVER PAID")
                                           Case 5
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("CONCILIATE")
                                           Case 6
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos confirmed""  target=""_blank"" >")
                                               Response.Write("PAID")
                                         
                                       End Select
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       Select Case Model.ListGroupDatain.Item(i).Colum21
                                           Case 1
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm""  target=""_blank"" >")
                                               Response.Write("NO CONFIRM")
                                           Case 2
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos no-confirm"" target=""_blank""  >")
                                               Response.Write("SEND")
                                           Case 3
                                               Response.Write("<td   >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos canceled""  target=""_blank"" >")
                                               Response.Write("CANCELED")
                                           Case 4
                                               Response.Write("<td  >")
                                               Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list_dos confirmed"" target=""_blank""  >")
                                               Response.Write("CONFIRMED")
                                         
                                       End Select
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum12)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td   > ")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list""  target=""_blank"" >$ ")
                                       Response.Write(FormatNumber(Model.ListGroupDatain.Item(i).Colum13, 0, , , TriState.True))
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       
                                       If Model.ListGroupDatain.Item(i).Colum14 = 5 Then
                                           Response.Write("MICE")
                                       End If
                                       
                                       If Model.ListGroupDatain.Item(i).Colum14 = 1 Then
                                           Response.Write("TARIFARIO")
                                       End If
                                       
                                       If Model.ListGroupDatain.Item(i).Colum14 = 2 Then
                                           Response.Write("MANUAL")
                                       End If
                                       
                                       If Model.ListGroupDatain.Item(i).Colum14 = 3 Then
                                           Response.Write("SEMIAUTOMATICO")
                                       End If
                                       
                                       
                                       If Model.ListGroupDatain.Item(i).Colum14 = 4 Then
                                        
                                           
                                               Response.Write("COMPENSATION")
                                           
                                       End If
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum15)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list""  target=""_blank"" >")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum16)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list""  target=""_blank"" >$ ")
                                       Response.Write(FormatNumber(Model.ListGroupDatain.Item(i).Colum18, 0, , , TriState.True))
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       Response.Write("<td    >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >$ ")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum17)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                    
                                       
                                       Response.Write("<td   >")
                                       Response.Write(" <a  href=""/Groups/GroupDetail?id=" + Model.ListGroupDatain.Item(i).Colum19 + """ class=""link_list"" target=""_blank""  >$ ")
                                       Response.Write(Model.ListGroupDatain.Item(i).Colum17)
                                       Response.Write(" </a>")
                                       Response.Write("</td>")
                                       
                                       
                                       Response.Write("</tr>")
                                       
                                       'Response.Write("</a>")
                                   Next
                
                %>


                          
               
                          </tbody>  
                    </table>


                   

               