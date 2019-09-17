<%-- 
    Document   : movement
    Created on : Aug 21, 2019, 10:23:07 PM
    Author     : Srki
--%>

<%@page import="model.Usluge"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>The Movement</title> 
			<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
                        <link rel="stylesheet" type="text/css" href="styles/movement.css">
                        <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
                        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
			<script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>	
       		<script>
    window.parentPage = true;                
    localStorage.clear();
                    

<% if (session.getAttribute("mail") != null) { %>
    $(function(){              
     $('#destination').load('navbar.jsp');
              });
<% } else {%>
     $(function(){    
         $('#content').load('welcome.html');
         $('#destination').load('navbar.jsp');
         
              });
<% } %>              
		</script>

		</head>
		<body>
		<div id="destination">
			
		</div>

                   
   


		<div class="container" id="space"> 
			<div class="row">
				<div class="col-lg 12">
					<div id="content">
                                            <h2>DOBRODOŠLI !!!</h2>
					</div>
				</div>	
			</div>
		</div>  
                       <script src="scripts/registracija.js"></script>
		</body>
	</html>