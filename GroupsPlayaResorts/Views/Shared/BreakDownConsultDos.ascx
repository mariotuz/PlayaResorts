<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

 <script src="<%: Url.Content("~/Scripts/table/extensions/filtercontrol/bootstrap-table-filtercontrol.js")%>"></script>
 <script src="<%: Url.Content("~/Scripts/table/bootstrap-table.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#editbreakdownhotel").val($("#breakdownhotel").val());
        $('#selectgroupby').selectpicker();
        $('.detail-view').css("display", "none");
        $("#selectgroupby").change(function () {
            $("#selectgroupbytext").val($("#selectgroupby").val());
            $("#GroupBy_Breakdown").click();
        });
        $('#CancelBreakdown').click(function (e) {
            if ($('input[name=BreakDownRadio]:checked').length > 0) {
                //alert($('input[name=MarketRadio]:checked').val())
                document.getElementById("CancelbreakdownID").value = $('input[name=BreakDownRadio]:checked').val()
                $('#breakdowncancelmodal').modal('show')
            }
        })
        $('a.detail-icon .glyphicon-plus').on('click', function () {
            var row = $(this).closest("tr");
            var nxtrow = row.next();
            nxtrow.show();
            //$(this).removeClass('glyphicon-plus');
            $(this).css("display", "none");
            row.find('.glyphicon-minus').css("display", "block");
        });
        $('a.detail-icon .glyphicon-minus').on('click', function () {
            var row = $(this).closest("tr");
            var nxtrow = row.next();
            nxtrow.hide();
            //$(this).removeClass('glyphicon-minus');
            //$(this).addClass('glyphicon-plus');
            $(this).css("display", "none");
            row.find('.glyphicon-plus').css("display", "block");
        });
        $('.glyphicon-minus').css("display", "none");

        $('.checkin').datetimepicker({ format: 'YYYY-MM-DD' });
        $('.checkout').datetimepicker({ format: 'YYYY-MM-DD' });
    });

    function SaveBreak(_element) {
        var $tr = $(_element).parent().parent();
        var numRoom = $tr.find('input[name=NumRoom]').val();
        var roomType = $tr.find('select[name=RoomType]').val();
        var checkin = $tr.find('input[name=CheckIn]').val();
        var checkout = $tr.find('input[name=CheckOut]').val();
        var numAdults = $tr.find('input[name=NumAdults]').val();
        var numTeens = $tr.find('input[name=NumTeens]').val();
        var numChilds = $tr.find('input[name=NumChilds]').val();
        var numInfants = $tr.find('input[name=NumInfants]').val();
        var guestName = $tr.find('input[name=GuestName]').val();
        var guestLastName = $tr.find('input[name=GuestLastName]').val();
        var notes = $tr.find('input[name=Notes]').val();

        $('#frmDeployment').find('#breaknumroom').val(numRoom);
        $('#frmDeployment').find('#selectypesuitebreak').val(roomType);
        $('#frmDeployment').find('#datetimepickerdate1text').val(checkin);
        $('#frmDeployment').find('#datetimepickerdate2text').val(checkout);
        $('#frmDeployment').find('#breakadults').val(numAdults);
        $('#frmDeployment').find('#breakteens').val(numTeens);
        $('#frmDeployment').find('#breakchilds').val(numChilds);
        $('#frmDeployment').find('#breakinfants').val(numInfants);
        $('#frmDeployment').find('#editbreakname').val(guestName);
        $('#frmDeployment').find('#editbreaklastname').val(guestLastName);
        $('#frmDeployment').find('#notes').val(notes);
        $('#frmDeployment').find('input[name=selectgroupby]').val($('#selectgroupby').val());
        $('#frmDeployment').find('input[name=Cve_Hotel]').val($('#cve_hoteltxt').val());

        $('#SaveBreak').click();
    }
</script>

<div class=" breack-down-list col-xs-12 col-sm-12 col-md-12 nopadding">
    <ul class="col-xs-12 col-sm-12 col-md-6 col-lg-4 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Total Rooms</span>     <span class="dp number"><%: model.TotalNumRooms %></span> <div class="deploy">-<%: model.TotalDeployRooms %> <i class="fa fa-caret-down"></i><br> <div class="txt-dploy">Deployment</div></div> </li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Tentative Rooms</span> <span class="number"><%: model.TotalTentativeRooms %></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Adults</span>       <span class="number"><%: model.TotalAdults %></span></li>
    </ul>
    <ul class="col-xs-12 col-sm-12 col-md-6 col-lg-3 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Teenager</span>       <span class="number"><%: Model.TotalTeens%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Childs</span>       <span class="number"><%: Model.TotalChildrens%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">No. Infants</span>       <span class="number"><%: model.TotalInfants %></span></li>
    </ul>
    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-5 nopadding">
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Total Of Deposits</span><span class="number">$ <%: FormatNumber(Model.TotalDeposit, 0, , , TriState.True)%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Balance</span>       <span class="number">$ <%: FormatNumber(Model.TotalBalance, 0, , , TriState.True)%></span></li>
        <li class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding"><span class="title-number">Estimated Revenue</span>        <span class="number">$ <%: FormatNumber(model.TotalRevenue, 0, , , TriState.True) %></span></li>
    </ul>
</div>

<div class="clear"></div>

<!-- BEGIN: BreakDown Virtual -->
<% If Session.Item("IDUser") = 16 Then%>
    <% If Model.ListVirtualBreakdownin.Count > 0 Then%>
        <h2>Proposal BreakDown</h2>
        <div class="header-fixed2" data-ng-controller="rates">
            <table class="table_break">
                <thead>
                    <tr>
                        <th class="tCen">Num Rooms</th>
                        <th class="tCen">Room Type</th>
                        <th class="tCen">Num Adults</th>
                        <th class="tCen">Num Teens</th>
                        <th class="tCen">Num Childs</th>
                        <th class="tCen">Num Infants</th>
                        <th class="tCen">Guest Name</th>
                        <th class="tCen">Guest Last Name</th>
                        <th class="tCen">Arrival Date</th>
                        <th class="tCen">Departure Date</th>
                        <th class="tCen">Notes</th>
                        <th class="tCen">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Dim NumVirtual As Integer
                        Dim Checkin As Date
                        Dim Checkout As Date
                        Dim NumHab As Integer
                        
                        For NumVirtual = 0 To Model.ListVirtualBreakdownin.Count - 1
                            Checkin = Model.ListVirtualBreakdownin.Item(NumVirtual).Checkin
                            Checkout = Model.ListVirtualBreakdownin.Item(NumVirtual).CheckOut
                            
                            Response.Write("<tr>")
                            Response.Write("<td><input type=""text"" class=""inline"" name=""NumRoom"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).RoomID + """/></td>")
                            'Response.Write("<td><input type=""text"" class=""inline"" name=""RoomType"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).RoomCode + """/></td>")
                    %>
                            <td>
                                <select class="inline" name="RoomType">
                                    <% 
                                        For NumHab = 0 To Model.ListaSuitein.Count - 1
                                            Dim seleccionado As String = ""
                                            Dim activado As String = ""
                                            
                                            If (Model.ListaSuitein.Item(NumHab).Value = Model.ListVirtualBreakdownin.Item(NumVirtual).RoomCode) Then
                                                Seleccionado = " selected"
                                            End If
                                            
                                            If (Model.ListaSuitein.Item(NumHab).Status = "0") Then
                                                activado = " disabled"
                                            End If
                                            
                                            Response.Write("<option value=""" + Model.ListaSuitein.Item(NumHab).Value + """ " + seleccionado + " " + activado + ">" + Model.ListaSuitein.Item(NumHab).Text + "</option>")
                                        Next
                                    %>
                                </select>
                            </td>
                    <%
                            Response.Write("<td><input type=""text"" class=""inline"" name=""NumAdults"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).Adults.ToString() + """/></td>")
                        Response.Write("<td><input type=""text"" class=""inline"" name=""NumTeens"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).Teens.ToString() + """/></td>")
                        Response.Write("<td><input type=""text"" class=""inline"" name=""NumChilds"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).Childrens.ToString() + """/></td>")
                        Response.Write("<td><input type=""text"" class=""inline"" name=""NumInfants"" value=""" + Model.ListVirtualBreakdownin.Item(NumVirtual).Infants.ToString() + """/></td>")
                            Response.Write("<td><input type=""text"" class=""inline"" name=""GuestName"" value=""""/></td>")
                            Response.Write("<td><input type=""text"" class=""inline"" name=""GuestLastName"" value=""""/></td>")
                            Response.Write("<td><input type=""text"" class=""inline checkin"" name=""CheckIn"" value=""" + Checkin.ToString("yyyy-MM-dd") + """/></td>")
                            Response.Write("<td><input type=""text"" class=""inline checkout"" name=""CheckOut"" value=""" + Checkout.ToString("yyyy-MM-dd") + """/></td>")
                            Response.Write("<td><input type=""text"" class=""inline"" name=""Notes"" value=""""/></td>")
                            Response.Write("<td><a class=""btn btn-success"" onclick=""SaveBreak(this);"">Deployment</a></td>")
                            Response.Write("</tr>")
                        Next
                    %>            
                </tbody>
            </table>
        </div>
        <% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .UpdateTargetId = "AJAX_ContainerBreakDown"}, New With {.Id = "frmDeployment"})%>
            <input type="hidden" value="" id="breaknumroom" name="breaknumroom"/>
            <input type="hidden" value="" id="selectypesuitebreak" name="selectypesuitebreak"/>
            <input type="hidden" value="" id="datetimepickerdate1text" name="datetimepickerdate1text"/>
            <input type="hidden" value="" id="datetimepickerdate2text" name="datetimepickerdate2text"/>
            <input type="hidden" value="" id="breakadults" name="breakadults"/>
            <input type="hidden" value="" id="breakteens" name="breakteens"/>
            <input type="hidden" value="" id="breakchilds" name="breakchilds"/>
            <input type="hidden" value="" id="breakinfants" name="breakinfants"/>
            <input type="hidden" value="" id="editbreakname" name="editbreakname"/>
            <input type="hidden" value="" id="editbreaklastname" name="editbreaklastname"/>
            <input type="hidden" value="" id="notes" name="notes"/>
            <input type="hidden" value="<%:Model.GroupId%>" id="grupoidbreakdown" name="grupoidbreakdown"/>
            <input type="hidden" value="" name="selectgroupby"/>
            <input type="hidden" value="<%:Model.EditGroupData1%>" id="Cve_Hotel" name ="Cve_Hotel" />
            <button id="SaveBreak" value="Deploy_Breakdown" name="GroupDetailBotons" class="btn btn-success" style="display:none;">Save</button>
        <%End Using%>
    <% End If %>
<% End If%>
<div class="clear"></div>
<!-- END: BreakDown Virtual-->

<h2>BreakDown</h2>
<% Using Ajax.BeginForm("GroupDetail", "Groups", New AjaxOptions With {.OnBegin = "OnBegin", .OnComplete = "OnComplete", .OnSuccess = "OnSuccessBreakDownEdit", .OnFailure = "OnFailureBreakDownEdit", .UpdateTargetId = "AJAX_ContainerBreakDownDos"})%>
            
    <input type="text" id="editbreakdownhotel" name="editbreakdownhotel" hidden value="0"   >

    <br />

    <div id="toolbar-break">
        <%-- <div class="bs-checkbox filter-check-all" >
            <input id="custo-check" type="checkbox" name="btSelectAll">
            <label class="check" for="custo-check"></label>
        </div>
        <span id="select-allselect-all">All</span>
                                                                                                      
        <button id="new" class="btn btn-warning">Deposit</button>--%>

        <% If (ViewData("idseccion1subseccion3edit_permission") IsNot Nothing And ViewData("idseccion1subseccion3edit_permission") > 0) Then%>
            <button id="EditBreakdown"  name="GroupDetailBotons" value="Edit_Breakdown" class="btn btn-default"><i class="fa fa-pencil-square-o"></i> Edit</button>
        <% End If%>
                                               
        <% If (ViewData("idseccion1subseccion3delete_permission") IsNot Nothing And ViewData("idseccion1subseccion3delete_permission") > 0) Then%>
            <a id="A2" class="btn btn-default" >Cancel Room</a>
        <% End If%>   

        <div class="btn-group " >
            <select class="selectpicker" id="selectgroupby" name="selectgroupby" data-width="100%">
                <option <% If Model.GroupBy = "0" Then%> selected <% End if%> value="0">Group by Room Type</option>
                <option <% If Model.GroupBy = "1" Then%> selected <% End if%> value="1">Group by Checkin</option>
            </select>
        </div>

        <% If (ViewData("idseccion1subseccion3edit_permission") IsNot Nothing And ViewData("idseccion1subseccion3edit_permission") > 0) Then%>
            <a id="A1" class="btn btn-success right"   >Save Changes</a>
        <% End If%>
    </div>

    <div class="header-fixed" data-ng-controller="rates" >
        <table class="table_break"  >
            <thead>
                <tr>
                    <th >Actions</th>
                    <th >Num. Group by</th>
                    <th >Room Type</th>
                    <th >Checkin</th>
                    <th >Checkout</th>               
                </tr>
            </thead>
            <tbody>
              <%                                              
                    Dim i As Integer
                    Dim j As Integer
                    Dim Date1 As Date
                    Dim Date2 As Date
                    Dim AuxCont As Integer = 0
                    Dim AuxLimit As Integer = 0
   
                    For i = 0 To Model.ListGroupBreakdownin.Count - 1
                        Response.Write("<tr>")                 
                        Response.Write("<td >")
                        'Response.Write("<input type=""radio"" class=""custom-check2"" id=""BreakDownRadio"" name=""BreakDownRadio"" value=""" + Model.ListGroupBreakdownin.Item(i).RoomID.ToString + """  ><label class=""check2""></label>")
                        Response.Write("<a class=""detail-icon"" href=""javascript:""> <i class=""glyphicon glyphicon-plus"" >   </i> <i class=""glyphicon glyphicon-minus"" >   </i>    </a>  ")
                        Response.Write("</td>")
                                                          
                        Response.Write("<td>")
                        Response.Write(Model.ListGroupBreakdownin.Item(i).RoomID)
                        Response.Write("</td>")
                                                          
                        Response.Write("<td>")
                        Response.Write(Model.ListGroupBreakdownin.Item(i).RoomCode)
                        Response.Write("</td>")

                        If Model.ListGroupBreakdownin.Item(i).Checkin = "N/A" Then
                            Response.Write("<td>")
                            Response.Write("N/A")
                            Response.Write("</td>")
                                                                                    
                            Response.Write("<td>")
                            Response.Write("N/A")
                            Response.Write("</td>")
                        Else
                            Date1 = Model.ListGroupBreakdownin.Item(i).Checkin
                                                                                    
                            Response.Write("<td>")
                            Response.Write(Date1.ToString("yyyy-MM-dd"))
                            Response.Write("</td>")
                                         
                            Date2 = Model.ListGroupBreakdownin.Item(i).Checkout
                                                                                    
                            Response.Write("<td>")
                            Response.Write(Date2.ToString("yyyy-MM-dd"))
                            Response.Write("</td>")                                          
                        End If                                      
                        Response.Write("</tr>")
                                                                                      
                        Response.Write("<tr class=""detail-view"">")
                        Response.Write("<td colspan=""4"">  ")
                        Response.Write("<table class=""table_breakgroup""  >")
                                                                         
                        Response.Write("<tr>")
                        Response.Write("<th  >Actions</th>")
                        Response.Write("<th  >Id Room</th>")
                        Response.Write("<th  >Guest Name/LastName</th>")
                        Response.Write("<th  >Room Type</th>")
                        Response.Write("<th  >Tentative</th>")
                        Response.Write("<th  >Complementary</th>")
                        Response.Write("<th  >AD</th>")
                        Response.Write("<th  >TN</th>")
                        Response.Write("<th  >CH</th>")
                        Response.Write("<th  >INF</th>")
                        Response.Write("<th  >Checkin</th>")
                        Response.Write("<th  >Checkout</th>")
                        Response.Write("<th  >RN</th>")
                        Response.Write("<th  >Status P</th>")
                        Response.Write("<th  >Status R</th>")
                        Response.Write("<th  >Total Deposit</th>")
                        Response.Write("<th  >Balance</th>")
                        Response.Write("<th  >Estimated Revenue</th>")
                        Response.Write("</tr>")
                                                             
                        AuxLimit = AuxLimit + Model.ListGroupBreakdownin.Item(i).RoomID
                                                          
                        For j = AuxCont To AuxLimit - 1                   
                            Response.Write("<tr>")
                                                              
                            Response.Write("<td >")
                            Response.Write("<input type=""radio"" class=""custom-check2"" id=""BreakDownRadio"" name=""BreakDownRadio"" value=""" + Model.ListGroupBreakdownGroupByin.Item(j).RoomID.ToString + """  >")
                                                         
                            Response.Write("</td>")
                                                          
                                                                        
                            Response.Write("<td>")
                            Response.Write("000" + Model.ListGroupBreakdownGroupByin.Item(j).RoomID)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).GuestName)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).RoomCode)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            If Model.ListGroupBreakdownGroupByin.Item(j).TentativeRooms = 1 Then
                                Response.Write("YES")
                            Else
                                Response.Write("NO")
                            End If
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            If Model.ListGroupBreakdownGroupByin.Item(j).ComplementaryRooms = 1 Then
                                Response.Write("YES")
                            Else
                                Response.Write("NO")
                            End If
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).Adults)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).Teens)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).Childrens)
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).Infants)
                            Response.Write("</td>")
                                                                                                
                            Date1 = Model.ListGroupBreakdownGroupByin.Item(j).Checkin
                            Response.Write("<td>")
                            Response.Write(Date1.ToString("yyyy-MM-dd"))
                            Response.Write("</td>")
                                                              
                            Date2 = Model.ListGroupBreakdownGroupByin.Item(j).Checkout
                                                                                
                            Response.Write("<td>")
                            Response.Write(Date2.ToString("yyyy-MM-dd"))
                            Response.Write("</td>")
                                                              
                    
                            Response.Write("<td>")
                            Response.Write(Model.ListGroupBreakdownGroupByin.Item(j).RoomNighs)
                            Response.Write("</td>")
                                                          
                            Select Case Model.ListGroupBreakdownGroupByin.Item(j).StatusPayment
                                Case 1
                                    Response.Write("<td class=""no-confirm"">")
                                    Response.Write("NO PAYMENT")
                                Case 2
                                    Response.Write("<td class=""no-confirm"">")
                                    Response.Write("PARTIAL PAY")
                                Case 3
                                    Response.Write("<td class=""confirmed"">")
                                    Response.Write("PAID")
                                Case 4
                                    Response.Write("<td class=""canceled"">")
                                    Response.Write("CANCELLED")
                            End Select
                                                          
                            Response.Write("</td>")
                                                                    
                            Select Case Model.ListGroupBreakdownGroupByin.Item(j).StatusBooking
                                Case 1
                                    Response.Write("<td class=""no-confirm"">")
                                    Response.Write("NO CONFIRMED")
                                Case 2
                                    Response.Write("<td class=""confirmed"">")
                                    Response.Write("CONFIRMED")
                                Case 3
                                    Response.Write("<td class=""canceled"">")
                                    Response.Write("CANCELLED")
                                                             
                            End Select
                                                          
                            Response.Write("</td>")
                                                          
                            Response.Write("<td>")
                            Response.Write(FormatNumber(Model.ListGroupBreakdownGroupByin.Item(j).Deposit, 2, , , TriState.True))
                            Response.Write("</td>")
                                                          
                                                          
                            Response.Write("<td>")
                            Response.Write(FormatNumber(Model.ListGroupBreakdownGroupByin.Item(j).Balance, 2, , , TriState.True))
                            Response.Write("</td>")
                                                          
                                                          
                            Response.Write("<td>")
                            Response.Write(FormatNumber(Model.ListGroupBreakdownGroupByin.Item(j).Revenue, 2, , , TriState.True))
                            Response.Write("</td>")
                                                                                                                    
                            Response.Write("</tr>")                               
                        Next
                                                          
                        AuxCont = AuxCont + Model.ListGroupBreakdownin.Item(i).RoomID
                                                          
                        Response.Write("</table>")
                                                          
                        Response.Write("</td>")
                                                          
                        Response.Write("<td>")
                        Response.Write("</td>")
                                                      
                        Response.Write("<td>")
                        Response.Write("</td>")
                                                          
                        Response.Write("<td>")
                        Response.Write("</td>")
                                                          
                        Response.Write("</tr>")
                                                          
                  Next
                  %>                                                                             
            </tbody>
        </table>

    </div>

    <div class="clear"></div>

<% End Using %> 