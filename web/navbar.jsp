<%@page import="model.Usluge"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nav-Bar</title>
      <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
      <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
      <link rel="stylesheet" type="text/css" href="styles/navbar.css">
      <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>   
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
      <script>
             if(!window.parentPage) window.location = "../Movement2.0/movement.jsp";           
    $(function(){
            $('a').each(function(){
                if ($(this).prop('href') === window.location.href) {
                    $(this).addClass('active'); $(this).parents('li').addClass('active');
                }
            });
        });
      </script>
</head>
<body>

  <div class="bg-primary">
    <nav class="navbar navbar-default  bg-transparent">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <img alt="X" src="imgs/zastava.jpg" class="navbar-brand"/>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
            <span class="sr-only"></span>
            <span class="icon-bar" id="fBar"></span>
            <span class="icon-bar" id="sBar"></span>
            <span class="icon-bar" id="tBar"></span>
          </button>  
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
             <%if(session.getAttribute("mail")==null){%>
            <li ><a href="../Movement2.0/ideja.jsp"><i class="far fa-lightbulb"></i> Ideja</a></li>
            <%}%>
            <li ><a href="../Movement2.0/movement.jsp" > <i class="far fa-newspaper"></i> Naslovna strana</a></li>
             <%if(session.getAttribute("mail")!=null){
                if(false)%>
            <!--<li><a href="//<%=session.getAttribute("link")%>"><i class="fas fa-fist-raised"></i> Moj pokret </a>-->
                <li><a href="myMovement.jsp"><i class="fas fa-fist-raised"></i> Moj pokret </a>
            <li ><a class="page" href="SettingsServlet" ><i class="fas fa-tools"></i> <i class="fas fa-user-plus"></i> Nalog </a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-user"></i> A <span class="caret whitesmokeClass"></span></a>
              <ul class="dropdown-menu">
                <li><a href="LogoutServlet"> <i class="fas fa-power-off"></i> Odjava</a></li>
                <li><a href="SettingsServlet"> <i class="fas fa-wrench"></i> Podešavanja</a></li>
              </ul>  
            </li> 
            <%}else{%>
             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-paste"></i>  O pokretima <span class="caret whitesmokeClass" ></span></a> 
                 <ul class="dropdown-menu">
                <li><a href="#" >Pokret za dekriminalizaciju i legalizaciju narkotika</a></li>
                <li><a href="#">Ekološki pokret</a></li>
                <li><a href="#">Građanski pokret za izgradnju kulture i identiteta</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Zajedničke vrednosti</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Uloga građana u participativnoj demokratiji</a></li>
              </ul>
            </li>
            <li ><a class="page"  href="../Movement2.0/prijava.jsp" ><i class="fas fa-user"> <i class="fas fa-bullhorn"></i></i> Novosti</a></li>
            <%}%>
            <li ><a class="page" href="../Movement2.0/kontakt.jsp" ><i class="fas fa-phone-square"></i> Kontakt</a></li>    
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-->
    </nav>
  </div>
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
</body>
</html>
