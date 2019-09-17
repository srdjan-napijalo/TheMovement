<%-- 
    Document   : movement
    Created on : Aug 21, 2019, 10:23:07 PM
    Author     : Srki
--%>

<%@page import="java.util.ArrayList"%>
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
                    

    $(function(){              
     $('#destination').load('navbar.jsp');
 });     
		</script>

		</head>
		<body>
		<div id="destination">
			
		</div>

                   
   


		<div class="container" id="space"> 
			<div class="row">
				<div class="col-lg 12">
					<div id="content3">
                                            <% int mov = Integer.valueOf(session.getAttribute("movement").toString())-1;
                                                ArrayList movements = Usluge.getGeneric("pokret", 2, false); 
                                                String movement = movements.get(mov).toString();
                                                 if(session.getAttribute("msg")!=null){%> 
                                                <h3><%=session.getAttribute("msg")%></h3>
                                                <%session.removeAttribute("msg");}%>
                                                <h2>Trenutni pokret:</h2><h3> <%=movement%></h3>
                                                <select id="movement" class="form-control">
                                                    <option value="0" disabled selected>Pokret</option>
                                                    <%for(int i=0; i<movements.size();i++){%>
                                                    <option value= '<%=i+1%>' > <%=movements.get(i)%></option>
                                                    <%}%>
                                                </select>
                                                <button type="button" class="btn btn-primary btn-block" onclick="movementChange()">Promeni <i class="fas fa-fist-raised"></i></button>
					</div>
				</div>	
			</div>
		</div>  
                                                <script>
                                                    var movementChange = function(){
                                                        var selection = document.getElementById("movement").value;
                                                        if(selection == 0)return;
                                                        else
                                                         window.location.href="SettingsServlet?selection="+selection;
                                                    };
                                                </script>
		</body>
	</html>