           var mail = document.querySelector("#email");
           var lozinka = document.querySelector("#password");
           var poruka = document.querySelector("#nevidljivo");
           var forma = document.querySelector("#mojaForma");
           var isMail = function(email){ 
		  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
				};
            var prijaviSe = function(){
                poruka.innerHTML="";
                mail.style.border="white 1px solid";
                lozinka.style.border="white 1px solid";
                if(!isMail(mail.value)||lozinka.value===""){  
                if(!isMail(mail.value)){
                 poruka.innerHTML += "Niste uneli e-mail.";
                 mail.style.border = "red 1px solid";              
            }
                if(lozinka.value===""){
                 poruka.innerHTML += " Polje za lozinku je prazno.";
                 lozinka.style.border = "red 1px solid";
                 forma.reset();
            }
                poruka.innerHTML+=" Pokušajte ponovo...";
                return false;
            }
            };

