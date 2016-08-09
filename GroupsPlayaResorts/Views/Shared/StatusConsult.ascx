<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

  
 
<%--    <script src="<%: Url.Content("~/Scripts/select/select-icons.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/select/selectboxit.js")%>"></script>
 --%>

 <script type="text/javascript">

     $(document).ready(function () {

         $("#selectstatuspayment").change(function () {

             if ($("#grupoidlabeltext").val() != "0") {

                 if ($("#selectstatuspayment").val() == "3") {

                     $('#Paymentgroupchangestatuscancelmodal').modal('show');

                 }
                 else {

                     $('#Paymentgroupchangestatusmodal').modal('show');

                 }

             }


         });


         $("#selectstatusbook").change(function () {

             if ($("#grupoidlabeltext").val() != "0") {

                 if ($("#selectstatusbook").val() == "3") {

                     $('#Bookgroupchangestatuscancelmodal').modal('show');

                 }
                 else {

                     $('#Bookgroupchangestatusmodal').modal('show');

                 }

             }

         });


         $("#selectstatushotel").change(function () {

             if ($("#grupoidlabeltext").val() != "0") {

                 if ($("#selectstatushotel").val() == "3") {

                     $('#Hotelgroupchangestatuscancelmodal').modal('show');

                 }
                 else {

                     $('#Hotelgroupchangestatusmodal').modal('show');

                 }

             }

         });



         $(function () {
             var selectBox = $(".select-status").selectBoxIt();
         });


         var d = new Date();
         //document.getElementById("date").innerHTML = d.toDateString();
         $("#date").html(d.toDateString());
     });

    </script>


                        <p>Date: <span id="date"> </span> </p>

                        <p>Payment Status:
                            <select class="select-status"  name="selectstatuspayment" id="selectstatuspayment" <% If (ViewData("idseccion1subseccion1edit_permission") Is Nothing) Then%> disabled <% End If%>>
                              <option <% If Model.GroupStatusPayment = "1" Then%> selected <% End if%> value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_yellow.png")%>">Unpaid</option>
                              <option <% If Model.GroupStatusPayment = "2" Then%> selected <% End if%> value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_noconfirm.png")%>">Partial</option>
                              <option <% If Model.GroupStatusPayment = "3" Then%> selected <% End if%> value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_cancel.png")%>">Cancelled</option>
                              <option <% If Model.GroupStatusPayment = "4" Then%> selected <% End if%> value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_transferred.png")%>">Over Paid</option>
                              <option <% If Model.GroupStatusPayment = "5" Then%> selected <% End if%> value="5" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_conciliate.png")%>">Conciliate</option>
                              <option <% If Model.GroupStatusPayment = "6" Then%> selected <% End if%> value="6" data-iconurl="<%: Url.Content("~/Content/img/icons/paid_pay.png")%>">Paid</option>
                            </select>
                        </p>

                        <p>Book Status:
                            <select class="select-status" name="selectstatusbook" id="selectstatusbook" <% If (ViewData("idseccion1subseccion1edit_permission") Is Nothing) Then%> disabled <% End If%>>
                              <option <% If Model.GroupStatusBook = "1" Then%> selected <% End if%> value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_yellow.png")%>" >Prospect</option>
                              <option <% If Model.GroupStatusBook = "2" Then%> selected <% End if%> value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_noconfirm.png")%>">Tentative</option>
                              <option <% If Model.GroupStatusBook = "3" Then%> selected <% End if%> value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_cancel.png")%>">Cancelled</option>
                              <option <% If Model.GroupStatusBook = "7" Then%> selected <% End if%> value="7" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_cancel.png")%>">Expired</option>
                              <option <% If Model.GroupStatusBook = "4" Then%> selected <% End if%> value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_turned_down.png")%>">Turned Down</option>
                              <option <% If Model.GroupStatusBook = "5" Then%> selected <% End if%> value="5" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_lost.png")%>">Lost</option>
                              <option <% If Model.GroupStatusBook = "6" Then%> selected <% End if%> value="6" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_pay.png")%>">Definitive</option>
                            </select>
                        </p>

                         <p>Hotel Status
                            <select class="select-status" name="selectstatushotel" id="selectstatushotel" <% If (ViewData("idseccion1subseccion1edit_permission") Is Nothing) Then%> disabled <% End If%>>
                                <option <% If Model.GroupStatusHotel = "1" Then%> selected <% End if%> value="1" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_yellow.png")%>" >No Confirm</option>
                                <option <% If Model.GroupStatusHotel = "2" Then%> selected <% End if%> value="2" data-iconurl="<%: Url.Content("~/Content/img/icons/sale_noconfirm.png")%>">Send</option>
                                <option <% If Model.GroupStatusHotel = "3" Then%> selected <% End if%> value="3" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_cancelled.png")%>">Cancelled</option>
                                <option <% If Model.GroupStatusHotel = "4" Then%> selected <% End if%> value="4" data-iconurl="<%: Url.Content("~/Content/img/icons/hotel_send.png")%>">Confirmed</option>
                            </select>
                        </p>
               
