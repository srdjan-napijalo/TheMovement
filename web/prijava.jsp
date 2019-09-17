<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <title>Stranica za prijavu</title>
      <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
      <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
      <link rel="stylesheet" type="text/css" href="styles/movement.css">
      <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>   
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
          <script>
              localStorage.clear();
                window.parentPage= true;       
    $(function(){
                  $('#destination').load('navbar.jsp');});
      </script>
    </head>
    <body>
    <div id="destination">
      
    </div>
                <div class="container" >
                <div class="row">
                  <div class="col-lg 12">
			<div id="content2">
                        <form class="form-horizontal" role="form" action="LoginServlet" method="POST" onsubmit="return prijaviSe()" id="mojaForma">
                            <span id="pozdrav"><%if((request.getAttribute("pozdrav1")!=null) && (request.getAttribute("pozdrav2")!=null)){%>
                                <hr class="redline">
				<%=(request.getAttribute("pozdrav1"))%>	
				<hr class="blueline">	    
                                <%=(request.getAttribute("pozdrav2"))%>
                                <hr>	
                                            <%}%>
                                </span> 
                <h2>Prijavite se: </h2>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email: </label>
                    <div class="col-sm-9">
                        <input type="email" id="email" placeholder="Email" class="form-control" name= "email" value="${fn:escapeXml(param.mail)}">
                    </div>
                </div> 
                
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Lozinka: </label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control" value="${fn:escapeXml(param.pw)}">
                    </div>
                </div>
                
                 <button type="submit" class="btn btn-primary  center-block " > <i class="fas fa-fist-raised"></i> Prijavite se </button>
                 
                 <div class="form-group">
                     <div class="col-sm-12 red" id="nevidljivo">
                         <%if(request.getAttribute("komentar")!=null){%>
                         <%=request.getAttribute("komentar")%><%}%>
                     </div>
                    <div class="col-sm-12" id="regDiv"><label> Niste registrovani?<a href="registracija.jsp"> Registrujte se odmah!</a> </label>
                        
                    </div>
                </div> 
                
                </form>
                </div>
	 </div>
   </div>
</div>
       
       
                     <script type="text/javascript" src="scripts/prijava.js">
        </script>
</body>
</html>
