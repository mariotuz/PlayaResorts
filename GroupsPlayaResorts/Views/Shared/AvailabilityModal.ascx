<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Common" %>

<%--<%:  Model.EditGroupData20()%>--%>


<script type="text/javascript">



    $(document).ready(function () {


        $('#LabelSuiteAvailability').text("<%:Model.GroupAvailabilitySuiteName%>");


    });

</script>

<%  
    
    Dim z As Integer
    Dim i As Integer=0 
   
    
    For z = 0 To Model.ListaAvailabilityin.Count - 1
        
        If i = 0 Then
            Response.Write("<div class=""m-row""> ")
            
        End If
        
        
        If Model.ListaAvailabilityin.Count - 1 <> 0 Then
            
      
            Dim CloseFlag() As String = Split(Model.ListaAvailabilityin.Item(z).Text, ",")
        
            Response.Write("<div class=""m-cell""> ")
            Response.Write("<div class=""fecha-cell"">" + CloseFlag(0) + "</div> ")
        
        
            If CloseFlag(1) = 4 Then
                Response.Write("<div class=""disponibildad""  style=""color:red"">" + Model.ListaAvailabilityin.Item(z).Value.ToString + "</div> ")
            Else
                Response.Write("<div class=""disponibildad""  >" + Model.ListaAvailabilityin.Item(z).Value.ToString + "</div> ")
            End If
        
       
            Response.Write("</div> ")
        
        End If
        
        If i = 3 Then
            Response.Write("</div>")
            i = 0
        Else
            i = i + 1
        End If
        
       
        
         
    Next
    
    If i < 3 Then
        Response.Write("</div>")
    End If
    
   
    %>


  