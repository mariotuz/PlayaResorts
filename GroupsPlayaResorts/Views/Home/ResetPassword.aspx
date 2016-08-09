<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
    <title>Reset Password</title>

    <!--my css -->
    <link href="<%: Url.Content("~/Content/login.css")%>" rel="stylesheet">
    <link href="<%: Url.Content("~/Content/font-awesome.css")%>" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<%: Url.Content("~/Content/bootstrap.min.css")%>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   <script src="<%: Url.Content("~/Scripts/jquery.min.js")%>"></script>

  </head>
  <body>

<div class="bg_login">

   <header class="nav-gris">
    <a href="/"> <img id="logo" src="<%: Url.Content("~/Content/img/logo_login.gif")%>"></a>
    </header>

    <div class="login-center"> 
      <header class="instructions">
      <h4>Forgot your password?</h4>
      <p>Enter your user login and clic in "Reset Password" then a email will send to you with instructions for reset your password.</p><br>
    </header>


      <form id="content-input">
        <div class="input-group">
                <span class="input-group-addon" class="sizing-addon2"><i class="fa fa-user fa-lg"></i></span>
                <input type="text" class="form-control login-input" placeholder="User" aria-describedby="sizing-addon2">
              </div>
        <button type="submit" class="btn btn-default">Reset Password</button>
      </form>

    </div>


    <footer class="container-fluid">
      <small id="copy" class="col-md-6 col-lg-6">© 2015 All rights reserved to JE-Solutions.</small>
      <small id="companie" class="col-md-6 col-lg-6">® Playa Resorts</small>
    </footer>
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="<%: Url.Content("~/Scripts/bootstrap/bootstrap.min.js")%>"></script>
  </body>
</html>
