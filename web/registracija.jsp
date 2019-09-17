<%@page import="java.util.ArrayList"%>
<%@page import="model.Usluge"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
  <html>
    <head> 
      <meta charset="UTF-8">
    	<title>Registracija</title>   
      <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
      <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
      <link rel="stylesheet" href="styles/navbar.css" type="text/css">

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>   
      
         <script>
        window.parentPage=true;  
        window.onload = function() {
          start();
          addListeners1();
          };   
        localStorage.clear();
        $(function(){
        $('#destination').load('navbar.jsp');
                  });       
          
          </script>
    </head>
    <body>
    <div id="destination">  
    </div>

        <div class="container col-lg-12" >
            <div class="row">
                <form class="form" role="form" id="myForm">
                <div class="form-group col-lg-6"> <!--OVO JE PRVA KOLONA -->
                    
                        <div class="form-group">
                            <label for="firstName">Ime: <span class="hintSpan"></span></label>
                            <input type="text" id="firstName" placeholder="Unesite ime..." value="${fn:escapeXml(param.fName)}" class="form-control" autofocus>
                            <span id="fNameHint"></span>
                        </div>
                        
                        <div class="form-group">
                            <div class="form-group">
                                <label for="eMail">Email:  <span class="hintSpan"></span> </label>
                                <input type="email" id="eMail" placeholder="Unesite e-mail adresu..." value="${fn:escapeXml(param.mail)}" class="form-control" name= "eMail">
                                <span id="emailHint"></span>
                                <div>
                                 <span><%if(request.getAttribute("komentar")!=null){%>
                                     <%=request.getAttribute("komentar")%><%}%></span> 
                                </div>
                                <div>
                                <span><%if(request.getAttribute("komentar2")!=null){%>
                                    <%=request.getAttribute("komentar2")%><%}%></span>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label for="password" >Lozinka:  <span class="hintSpan"></span> </label>
                            <input type="password" id="password"  placeholder="Odaberite lozinku" class="form-control">
                            <span id="pwHint"></span>
                        </div>
                           
                         <div class="form-group col-lg-12">
                             <div class="row">
                            <label class="control-label inline">Preferirani oblik komunikacije : <span id="prefSpan"></span></label>
                            <%if(request.getAttribute("pref")=="SMS"){%>
                                        <label class="radio-inline badge" id="mailBtn"> E-mail</label><input type="radio" id="mailRadio" name="komunikacija" value="emailPref">
                                        <label class="radio-inline badge" id="smsBtn"> SMS </label><input type="radio" id="smsRadio" name="komunikacija" value="smsPref" selected>
                                        <%}else if(request.getAttribute("pref")=="Mail"){%>
                                        <label class="radio-inline badge" id="mailBtn"> E-mail</label><input type="radio" id="mailRadio" name="komunikacija" value="emailPref" selected="">
                                        <label class="radio-inline badge" id="smsBtn"> SMS </label><input type="radio" id="smsRadio" name="komunikacija" value="smsPref">
                                        <%}else{%>
                                        <label class="radio-inline badge" id="mailBtn"> E-mail</label><input type="radio" id="mailRadio" name="komunikacija" value="emailPref">
                                        <label class="radio-inline badge" id="smsBtn"> SMS </label><input type="radio" id="smsRadio" name="komunikacija" value="smsPref">
                                        <%};%>
                            </div>
                         </div>
                            
                             <div class="form-group">
                                <label for="birthYear">Datum rođenja: </label>
                                    <div class="form-group form-inline">
                                <select id="birthYear" class="form-control">
                                    <option value="1995" selected disabled>Godina</option>
                                </select>
                                <select id="birthMonth" class="form-control" >
                                    <option value="0" disabled selected>Mesec</option>
                                    <option value="1">Januar</option>
                                    <option value="2">Februar</option>
                                    <option value="3">Mart</option>
                                    <option value="4">April</option>
                                    <option value="5">Maj</option>
                                    <option value="6">Jun</option>
                                    <option value="7">Jul</option>
                                    <option value="8">Avgust</option>
                                    <option value="9">Septembar</option>
                                    <option value="10">Oktobar</option>
                                    <option value="11">Novembar</option>
                                    <option value="12">Decembar</option>
                                </select>
                                <select id="birthDay" class="form-control">
                                    <option value=30 disabled selected>Dan</option>
                                </select>
                             </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="okrug">Okrug:  <span class="hintSpan"></span></label>

                                <select id="okrug" class="form-control">
                                    <% 
                                       ArrayList okrugId= Usluge.getGeneric("okrug", 1, true);
                                       ArrayList okruzi =   Usluge.getGeneric("okrug", 2, false); %>
                                        <option value="0" disabled selected>Okrug</option><%
                                        for(int i=0; i<okruzi.size(); i++){%>
                                    <option value="<%=okrugId.get(i)%>"><%= okruzi.get(i)%></option>
                                    <%}%>
                                </select>
                            </div>
                    
                           <div class="form-group">
                           <label for="adresa">Adresa: </span></label>
                               <input type="text" id="adresa" placeholder="Unesite adresu..." class="form-control" autofocus>
                           </div>
                           
                    <div class="form-group">
                        <label for="obrazovanje">Obrazovanje:  <span class="hintSpan"></span> </label>
                        <select id="obrazovanje" class="form-control">
                           <% 
                                       ArrayList obrazovanjeId= Usluge.getGeneric("obrazovanje", 1, true);
                                       ArrayList obrazovanje =   Usluge.getGeneric("obrazovanje", 2, false); %>
                                        <option value="0" disabled selected>Obrazovanje</option><%
                                        for(int i=0; i<obrazovanje.size(); i++){%>
                                    <option value="<%=obrazovanjeId.get(i)%>"><%= obrazovanje.get(i)%></option>
                                    <%}%>
                        </select>
                </div>
                    
                            <span class="hintSpan"></span>              
                            
                 </div><!-- KRAJ PRVE KOLONE -->            
                            
                <div class="form-group col-lg-6"> <!--OVO JE DRUGA KOLONA -->
                    
                    <div class="form-group">
                        <label for="lastName">Prezime:  <span class="hintSpan"></span> </label>
                        <input type="text" id="lastName" placeholder="Unesite prezime" value="${fn:escapeXml(param.lName)}" class="form-control">
                        <span id="lNameHint"></span>
                    </div>
                    
                    <div class="form-group">
                        <label for="phoneNumber">Broj telefona:  <span class="hintSpan"></span> </label>
                            <input type="text" id="phoneNumber" placeholder="* Nikome nećemo dati Vaš broj telefona *" value="${fn:escapeXml(param.phone)}" class="form-control">
                            <span id="phoneNumberHint"></span>
                    </div>

                    <div class="form-group">
                        <label for="password" >Potvrdite lozinku:  <span class="hintSpan"></span> </label>
                        <input type="password" id="password2" placeholder="Ponovite izabranu lozinku..." class="form-control">
                        <span id="pw2Hint" class="red"></span>
                    </div>
                    
                                <div class="form-group col-lg-12">
                                     <div class="row">
                                            <label class="radio-inline badge" id="genBtn"><strong><i class="fas fa-redo"></i></strong></label>
                                            <label>Pol : </label>
                                            <label class="radio-inline badge" id="fBtn"><strong>Ž</strong></label>
                                            <input type="radio" id="femRadio"  name="pol" value="fem">
                                            <label class="radio-inline badge" id="mBtn"><strong>M</strong></label>
                                            <input type="radio" id="maleRadio" name="pol" value="male">   
                                     </div>
                              </div> 
                    
                    
                              <div class="form-group">
                                <label for=jmbg >JMBG: </label>
                                <input type="text" id="jmbg" placeholder="* Nikome nećemo otkriti Vaš JMBG *"  class="form-control" autofocus>
                                <span id="jmbgHint"></span>
                            </div>
                    
                    <div class="form-group">
                    <label for="opstina">Opstina:  <span class="hintSpan"></span> </label>
                        <select id="opstina" class="form-control">
                        <% 
                           ArrayList opstineId = Usluge.getGeneric("opstina", 1, true);
                           ArrayList opstine =   Usluge.getGeneric("opstina", 2, false);%>
                           <option value="0" disabled selected>Opstina</option><%
                            for(int i=0; i<opstine.size(); i++){%>
                            <option value="<%=opstineId.get(i)%>" ><%=opstine.get(i)%></option>
                        <%}%>
                    </select>

                </div>
                

                       <div class="form-group">
                        <label for="zanimanje" >Zanimanje:  <span class="hintSpan"></span> </label>
                        <select id="zanimanje" class="form-control">
                        <% 
                           ArrayList zanimanjaId= Usluge.getGeneric("profesija", 1, true);
                           ArrayList zanimanja =   Usluge.getGeneric("profesija", 2, false); %>
                              <option value="0" disabled selected>Zanimanje</option><%
                            for(int i=0; i<zanimanja.size(); i++){%>
                        <option value="<%=zanimanjaId.get(i)%>"><%= zanimanja.get(i)%></option>
                        <%}%>
                    </select>
                </div>
                    
                    
                    <div class="form-group">
                    <label for="pokret">Pokret:  <span class="hintSpan"></span> </label>
                    <select id="pokret" class="form-control">
                        <% 
                           ArrayList pokretiId= Usluge.getGeneric("pokret", 1, true);
                           ArrayList pokreti =   Usluge.getGeneric("pokret", 2, false); %>
                              <option value="0" disabled selected>Pokret</option><%
                            for(int i=0; i<pokreti.size(); i++){%>
                        <option value="<%=pokretiId.get(i)%>"><%= pokreti.get(i)%></option>
                        <%}%>
                    </select>
                </div>
                    <div class="form-group">
                    <label> Već ste registrovani?<a href="prijava.jsp"> Prijavite se odmah!</a> </label>   
                    </div>
                </div>
                    
                        
                     
                  
                    
                 <button type="button" class="btn btn-primary btn-block" onclick="validate()"> <i class="fas fa-fist-raised"></i> Registrujte se!</button>
                    
                  
            
             </form>
            </div>
        </div>
                    <script src="scripts/registracija.js">
                        </script>
</body>
</html>
