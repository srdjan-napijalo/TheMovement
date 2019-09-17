<%-- 
    Document   : register
    Created on : Aug 24, 2019, 3:21:41 AM
    Author     : Srki
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Usluge"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html>
    <head> 
      <meta charset="UTF-8">
    	<title>Registracija</title>
      <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
      <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
      <link rel="stylesheet" type="text/css" href="styles/movement.css">
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>   
      <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>     

          <script>
                window.parentPage=true;  
                window.onload = function(){
                selThirdPart();  
                };
                
             if(localStorage.length===0) window.location="movement.jsp";
             $(function(){
                  $('#destination').load('navbar.html');});  
                                     
          </script>
    </head>
    <body>
    <div id="destination">
      
    </div>
	<div class="container" >
      <div class="row">
        <div class="col-lg 12">
          <div>         
            <form class="form-horizontal" role="form">
                <h2>Registracija</h2>
                <div class="form-group">
                    <label for="okrug" class="col-sm-3 control-label">Okrug: <span class="hintSpan"><span></label>
                    <div class="col-sm-9">
                    <select id="okrug" class="form-control">
                        <% 
                           ArrayList okrugId= Usluge.getGeneric("okrug", 1, true);
                           ArrayList okrug =   Usluge.getGeneric("okrug", 2, false);%>
                           <option value="0" disabled selected>Okrug</option><%
                            for(int i=0; i<okrug.size(); i++){%>
                        <option value="<%=okrugId.get(i)%>"><%= okrug.get(i)%></option>
                        <%}%>
                    </select>
                </div>
          </div>
                    <div class="form-group">
                    <label for="opstina" class="col-sm-3 control-label">Opstina: <span class="hintSpan"><span></label>
                    <div class="col-sm-9">
                        <select id="opstina" class="form-control">
                        <% 
                           ArrayList opstineId = Usluge.getGeneric("opstina", 1, true);
                           ArrayList opstine =   Usluge.getGeneric("opstina", 2, false);%>
                           <option value="0" disabled selected>Opstina</option><%
                            for(int i=0; i<opstine.size(); i++){%>
                        <option value="<%=opstineId.get(i)%>"><%= opstine.get(i)%></option>
                        <%}%>
                    </select>
                    </div>
                </div>
                    <div class="form-group">
                    <label for="adresa" class="col-sm-3 control-label">Adresa: </label>
                    <div class="col-sm-9">
                        <input type="text" id="adresa" placeholder="Adresa" class="form-control" autofocus>
                    </div>
                </div>
                    <div class="form-group">
                    <label for="obrazovanje" class="col-sm-3 control-label">Obrazovanje: <span class="hintSpan"><span></label>
                    <div class="col-sm-9">
                    <select id="obrazovanje" class="form-control">
                        <% 
                           ArrayList obrazovanjeId= Usluge.getGeneric("obrazovanje", 1, true);
                           ArrayList obrazovanje =   Usluge.getGeneric("obrazovanje", 2, false);%>
                           <option value="0" disabled selected>Obrazovanje</option><%
                            for(int i=0; i<obrazovanje.size(); i++){%>
                        <option value="<%=obrazovanjeId.get(i)%>"><%= obrazovanje.get(i)%></option>
                        <%}%>
                    </select>
                </div>
          </div>
                    <div class="form-group">
                    <label for="zanimanje" class="col-sm-3 control-label">Zanimanje: <span class="hintSpan"><span></label>
                    <div class="col-sm-9">
                    <select id="zanimanje" class="form-control">
                        <% 
                           ArrayList profesijaId= Usluge.getGeneric("profesija", 1, true);
                           ArrayList profesija =   Usluge.getGeneric("profesija", 2, false);%>
                           <option value="0" disabled selected>Zanimanje</option><%
                            for(int i=0; i<profesija.size(); i++){%>
                        <option value="<%=profesijaId.get(i)%>"><%=profesija.get(i)%></option>
                        <%}%>
                    </select>
                </div>
          </div>
                <div class="form-group">
                    <label for="pokret" class="col-sm-3 control-label">Pokret: <span class="hintSpan"><span></label>
                    <div class="col-sm-9">
                    <select id="pokret" class="form-control">
                        <% 
                           ArrayList pokretId= Usluge.getGeneric("pokret", 1, true);
                           ArrayList pokret =   Usluge.getGeneric("pokret", 2, false);%>
                           <option value="0" disabled selected>Pokret</option><%
                            for(int i=0; i<pokret.size(); i++){%>
                        <option value="<%=pokretId.get(i)%>"><%=pokret.get(i)%></option>
                        <%}%>
                    </select>
                </div>
          </div>
                     <span id="err" class="help-block red"> </span>
                
            <button type="button" class="btn btn-primary btn-block" onclick="myScript3()" >Nastavite</button>
            <div class="form-group">
                     
                    <div class="col-sm-12"><label> Već ste registrovani?<a href="prijava.jsp"> Prijavite se odmah!</a> </label>
                        
                    </div>
                </div> 
   		 </form>
		</div>
	 </div>
   </div>
</div>
                  
                    <script src="./scripts/registracija.js">        

                    </script>
</body>
</html>

