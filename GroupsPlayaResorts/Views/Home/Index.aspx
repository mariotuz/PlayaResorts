<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Outside.Master" Inherits="System.Web.Mvc.ViewPage(Of GroupsPlayaResorts.Login)" %>


<asp:Content ID="LoginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>


<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="<%: Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js")%>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")%>" type="text/javascript"></script>



    <div class="bg_login img-bg">

    <div class="login-center"> 

          <header>
            <a href="/"><img id="logo" src="<%: Url.Content("~/Content/img/logo_login.gif")%>"></a>
            <h1>Welcome to GESA</h1>
           <%--  <h1>Welcome to GESA!</h1>--%>
          </header>

           <% Using Html.BeginForm() %>

              
                            
        <%: Html.ValidationSummary(True, "Please correct errors and try again.")%>
                                               

              <div class="input-group">
                <span class="input-group-addon" class="sizing-addon2"><i class="fa fa-user fa-lg"></i></span>
                <%--<input type="text" class="form-control login-input" placeholder="User" aria-describedby="sizing-addon2">--%>
                   <%: Html.TextBoxFor(Function(m) m.UserName, New With {.class = "form-control login-input"})%>
                  <%: Html.ValidationMessageFor(Function(m) m.UserName)%>
              </div>

              <div class="input-group">
                <span class="input-group-addon" class="sizing-addon2"><i class="fa fa-lock fa-lg"></i></span>
                <%--<input type="text" class="form-control login-input" placeholder="Password" aria-describedby="sizing-addon2">--%>
                  <%: Html.PasswordFor(Function(m) m.UserPassword, New With {.class = "form-control login-input"})%>
                   <%: Html.ValidationMessageFor(Function(m) m.UserPassword)%>
              </div>

              <!--<button type="submit" class="btn btn-default" id="btn-login">Login</button>-->
              <%--<a  href="/Groups/GroupsList"  class="btn btn-default" id="btn-login" >Login</a>--%>
                
                <button id="LoginUser" value="Login_User" name="LoginButtons" class="btn btn-default">Login</button>
              
            <% End Using %>

            <a id="remember" href="/Home/ResetPassword">Forgot your password?</a>

    </div>

    <footer class="container-fluid">
      <small id="copy" class="col-md-6 col-lg-6">© 2015 All rights reserved to Playa Resorts Management.</small>
      <small id="companie" class="col-md-6 col-lg-6">® Playa Resorts</small>
    </footer>

</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%: Url.Content("~/Scripts/bootstrap/bootstrap.min.js")%>"></script>


</asp:Content>
