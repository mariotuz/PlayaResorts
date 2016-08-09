<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<script>
    $(function () {
        $('#logbookul').find('a:first').parent().addClass('active');
        $('#logbookul').find('a:first').attr('href');
        $($('#logbookul').find('a:first').attr('href')).addClass('active');
    });
</script>

<div role="tabpanel"><!-- Start Contentainer tabs-->
            <!-- Start Nav tabs -->

    <input type="text" id="grupoidlogbook" name="grupoidlogbook" hidden value="0"   >


            <br>
            <br>
            <ul class="nav nav-tabs dual-select" role="tablist" id="logbookul">
                <% If (ViewData("idseccion1subseccion4consult_permission") IsNot Nothing And ViewData("idseccion1subseccion4consult_permission") > 0) Then
                        Response.Write("<li role=""presentation"" id=""loglisthead"" class=""col-xs-6 col-md-6 active""><a href=""#loglist"" aria-controls=""loglist"" role=""tab"" data-toggle=""tab"">LogBook List</a></li>")
                    End If
                    
                    If (ViewData("idseccion1subseccion4new_permission") IsNot Nothing And ViewData("idseccion1subseccion4new_permission") > 0) Then
                        Response.Write("<li role=""presentation"" id=""lognotehead"" class=""col-xs-6 col-md-6""><a href=""#lognote"" aria-controls=""lognote"" role=""tab"" data-toggle=""tab"">Add LogBook Note</a></li>")
                    End If
                %>
            </ul>
            <!-- end Nav tabs -->

            <!-- Start Tab panes -->
            <div class="tab-content"><br>
                <% If (ViewData("idseccion1subseccion4consult_permission") IsNot Nothing And ViewData("idseccion1subseccion4consult_permission") > 0) Then%>
                    <div role="tabpanel" class="tab-pane active" id="loglist"><!-- Start documents list tabs-->
                            <header class=""><h2 class="md-display-2">LogBook List</h2></header>
                                                      
                                                      
                            <div id="AJAX_ContainerLogBook"> 
                                    <% Html.RenderPartial("LogBookConsult", Model)%>
                            </div>


                    </div><!-- end documents list tabs-->
                 <%End If%>
                                                            
                <% If (ViewData("idseccion1subseccion4new_permission") IsNot Nothing And ViewData("idseccion1subseccion4new_permission") > 0) Then%>
                    <div role="tabpanel" class="tab-pane" id="lognote"><!-- Start generet document tabs-->
                    <header class=""><h2 class="md-display-2">Add New Logbook Note</h2><p></p></header>
                        <div class="btn-group col-xs-12 col-sm-6 col-md-6 col-lg-4" role="group">
                            <span><small>Input Type</small></span>
                            <select class="selectpicker" id="inputypelogbook" name="inputypelogbook" data-width="100%">
                                <option value="1">Groups</option>
                                <option value="2">Payments</option>
                                <option value="3">Breakdown</option>
                                <option value="4">Events</option>
                            </select>
                        </div>

                        <div class="clear"></div><br>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <span><small>Add a Note</small></span><br>
                        <textarea class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="logbooknotes" name="logbooknotes" rows="5" cols="50" placeholder="Your note..."></textarea>
                        </div>

                        <div class="clear"></div>
                        <div style="display:inline-block; padding:15px;">
                        <button id="LogBookNewNote"  value="LogBook_NewNote" name="GroupDetailBotons" class="btn btn-success">Add Note</button>
                        </div>
                </div><!-- end generet document tabs-->
                <%End If%>

            </div><!--end tab pane-->
    </div><!-- end Contentainer tabs-->
