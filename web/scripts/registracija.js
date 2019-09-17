var firstName,lastName,eMail,password,password2,phoneNumber,okrug,adresa,opstina,pokret,obrazovanje,zanimanje,jmbg,
    prefSpan,hintSpan, fNameHint,lNameHint,emailHint,pwHint, pw2Hint,birthYear,birthMonth, pref, gender,genBtn,
    birthDay, genderM, genderF, mailRadio, smsRadio, mBtn, fBtn, mailBtn, smsBtn, phoneNumberHint, date, jmbgHint,info;
                    var myScript = function(){ //PRVI KLIK NA DUGME na stranici movement.jsp
				$("#space").load('registracija1.html').hide().fadeIn(2000);
                                
                            };   
		
                  
                            //SKRIPTA ZA DRUGO DUGME PRILIKOM REGISTRACIJE (nakon neophodnih unosa) 
                    var myScript1 = function(){
                        takeValFirst();    
			if(check1())
			$('#myDiv').load('registracija2.html').hide().fadeIn(2500); 
                    };
                    
                     //Klik na TRECE dugme (nakon unosa datuma i jmbg-a)
                    var myScript2 = function(){  
                            takeValSecond();
                            info.innerHTML="";
                            storeLocalValues();
                            check2();
                    };
                    //Klik na register.jsp
                    var myScript3=function(){
                        clear2();  
                        takeValThird();
                        if(isAllSelected2())
                           window.location.href="RegisterServlet?pref="+localStorage.getItem("pref")+"&gender="+localStorage.getItem("gender")+"&fName="+localStorage.getItem("fName")+"&lName="+localStorage.getItem("lName")+
                                    "&pw="+localStorage.getItem("pw")+"&mail="+localStorage.getItem("mail")+"&phone="+localStorage.getItem("phone")+"&date="+localStorage.getItem("date")+"&jmbg="+localStorage.getItem("jmbg")+
                                    "&opstina="+opstinaVal+"&okrug="+okrugVal+"&profesija="+zanimanjeVal+"&obrazovanje="+obrazovanjeVal+"&pokret="+pokretVal;
                    };


                  //FUNKCIJA ZA DODAVANJE SLUSACA DOGADJAJA na prvu grupu kontrola
                     var addListeners1 = function(){
                        mailBtn.addEventListener("click",function(){
                           smsBtn.style.backgroundColor="gray";
                           mailRadio.checked=true; 
                           mailBtn.style.backgroundColor="#990000";
                        });
                        smsBtn.addEventListener("click",function(){
                           mailBtn.style.backgroundColor="gray";
                           smsRadio.checked=true; 
                           smsBtn.style.backgroundColor="#006699";
                        });
                        mailRadio.addEventListener("click",function(){
                           smsBtn.style.backgroundColor="gray";
                           mailRadio.checked=true; 
                           mailBtn.style.backgroundColor="#990000";
                        });
                        smsRadio.addEventListener("click",function(){
                           mailBtn.style.backgroundColor="gray";
                           smsRadio.checked=true; 
                           smsBtn.style.backgroundColor="#006699";
                        });
                    };
                    //FUNKCIJA ZA DODAVANJE SLUSACA DOGADJAJA na drugu grupu kontrola
                  var addListeners2 = function(){
   
                        jmbg.onfocus = function(){   
                        year = birthYear.value.toString();
                        mon = birthMonth.value.toString();
                        mon = ('0' + mon).slice(-2);
                        day = birthDay.value.toString();
                        day = ('0' + day).slice(-2);
                        yea = year.slice(1,4);
                        jmbg.value = day.concat(mon, yea);
                    } ;
                        birthYear.onchange = function(){
                         birthMonth.disabled=false;
                         if(birthDay.disabled===false) populateD();
                     }; 
                    
                         birthMonth.onchange= function(){  
                             populateD();
                             birthDay.disabled=false;
                         };
            
                         genBtn.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           fBtn.style.backgroundColor="gray";
                           genderF.checked=false;
                           genderM.checked=false;
                        });
                        genBtn.addEventListener("mouseover",function(){
                           genBtn.style.backgroundColor="black"; 
                        });
                        genBtn.addEventListener("mouseout",function(){
                           genBtn.style.backgroundColor="gray"; 
                        });
                        fBtn.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           genderF.checked=true; 
                           fBtn.style.backgroundColor="#990000";
                        });
                        mBtn.addEventListener("click",function(){
                           fBtn.style.backgroundColor="gray";
                           genderM.checked=true; 
                           mBtn.style.backgroundColor="#006699";
                        });
                        genderF.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           genderF.checked=true; 
                           fBtn.style.backgroundColor="#990000";
                        });
                        genderM.addEventListener("click",function(){
                           fBtn.style.backgroundColor="gray";
                           genderM.checked=true; 
                           mBtn.style.backgroundColor="#006699";
                       });
                    };
                    
                        var start = function(){
                            selFirstPart();
                            selSecondPart();
                            selThirdPart();
                        };
                        
                        var selFirstPart = function(){
                            firstName = document.querySelector("#firstName");
                            lastName = document.querySelector("#lastName");
                            eMail = document.querySelector("#eMail");
                            password = document.querySelector("#password");
                            password2 = document.querySelector("#password2");
                            phoneNumber = document.querySelector("#phoneNumber"); 
                            prefSpan = document.querySelector("#prefSpan");
                            hintSpan = document.querySelectorAll(".hintSpan");
                            fNameHint = document.querySelector("#fNameHint");
                            lNameHint = document.querySelector("#lNameHint");
                            emailHint = document.querySelector("#emailHint");
                            phoneNumberHint = document.querySelector("#phoneNumberHint");
                            pwHint = document.querySelector("#pwHint");
                            pw2Hint = document.querySelector("#pw2Hint");
                            mailRadio = document.querySelector("#mailRadio");
                            smsRadio = document.querySelector("#smsRadio");
                            mailBtn = document.querySelector("#mailBtn");
                            smsBtn = document.querySelector("#smsBtn");
                        };
                          var selSecondPart = function(){
                            jmbg = document.querySelector("#jmbg");
                            jmbgHint= document.querySelector("#jmbgHint");
                            birthYear = document.querySelector("#birthYear");
                            birthMonth = document.querySelector("#birthMonth");
                            birthDay = document.querySelector("#birthDay");
                            genderM = document.querySelector("#maleRadio");
                            genderF = document.querySelector("#femRadio"); 
                            mBtn = document.querySelector("#mBtn");
                            fBtn = document.querySelector("#fBtn");
                            genBtn = document.querySelector("#genBtn");
                            info = document.querySelector("#infoSpan");
                            birthMonth.disabled=true;
                            birthDay.disabled=true;
                            jmbgHint = document.querySelector("#jmbgHint");
                            
                          for(var i=2005; i>1920; i--){
                          var opt = document.createElement('option');
                          opt.value = i;
                          opt.innerHTML = i;
                          birthYear.appendChild(opt);      
                            };
                            addListeners2();
                          } ;
                          var selThirdPart = function(){
                            okrug = document.querySelector("#okrug");
                            adresa = document.querySelector("#adresa");
                            opstina = document.querySelector("#opstina");
                            pokret = document.querySelector("#pokret");
                            obrazovanje = document.querySelector("#obrazovanje");
                            zanimanje = document.querySelector("#zanimanje");
                            hintSpan = document.querySelectorAll(".hintSpan");
                        };
                       
                        
                        //KOLIKO DANA IMA MESEC
                     var getDaysInMonth = function(month,year) { 
                            return new Date(year, month, 0).getDate();
                           };
                      //POPUNI DANE
                    var   populateD = function(){
                           while (birthDay.options.length) {
                            birthDay.remove(0);
                             }
                            var days = getDaysInMonth(birthMonth.value, birthYear.value);
                             for(var i=1; i<=days; i++){
                                 var opt = document.createElement('option');
                                 opt.value=i;
                                 opt.innerHTML = i;
                                 birthDay.appendChild(opt);
                         };}; 
                     
                        //DA LI JE SELEKTOVAN DATUM    
                    isDateSel = function(){
                        if(birthYear.value!=0)
                            if(birthMonth.value!=0)
                                if(birthDay.value!=0)
                            return true;
                        else return false;
                    };
                        
                        //FUNKCIJE ZA VALIDACIJU 
                    var checkPass = function(paw)  {  //PASSWORD
                    return /^(?=.*\d)(?=.*[a-z]).{6,15}$/.test(paw);  };

                        
                    var isMail = function(email){   //MAIL
                    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);  };

                    var isCheckedPref = function(){ //PREFERIRANI OBLIK KOMUNIKACIJE
				if(mailRadio.checked === true)
					{
						pref = "Mail";
						return true;}
				else if(smsRadio.checked === true)
					{
						pref = "SMS";
						return true;}
				else return false;};
                        
                    var checkGender = function(){ //POL
				if(genderF.checked === true)
						gender = "Ž";
				else if(genderM.checked === true)
						gender = "M";
				else gender = null;};

                    var isSamePw = function(pw, pw2){ //DA LI JE ISTI PASSWORD
                                if(pw !== pw2){
                                    pw2Hint.innerHTML = "*Lozinke moraju biti identične*";
                                            return false;
                                        }else{
                                         if(checkPass(pw))return true;   
                                        else{if(isNumber(pw)||isWord(pw))
                                           pwHint.innerHTML = "Lozinka mora sadržati bar jedno slovo i bar jednu cifru.";
                                            if(pw.length<6 || pw.length>15) 
                                           pwHint.innerHTML = "Lozinka se mora sastojati od najmanje 6 i najviše 15 karaktera.";
                                            return false;
                                        }
                                    }};	
                        
                        //POMOCNE FUNKCIJE - DA LI JE KARAKTER SLOVO/CIFRA
                        var isCharLetter = function (c){
   			 if (c >= '0' && c <= '9') 
   			 	return false;
				else  return true;	
			};

			var isCharNumber = function(c){
   			 if (c >= '0' && c <= '9') 
    			return true;
				 else return false;
			};
                        //FUNKCIJE - DA LI JE SLOVO/CIFRA
			var isNumber = function(sl,num){
				sl= sl.replace(/\s/g, "");
				var provera = true;
                                if(sl.length!==0 &&((isCharNumber(sl.charAt(0)))||(sl.charAt(0)==="+")))provera=true;
                                else return false;
				for(var i =1; i<sl.length; i++){
                                    if(!isCharNumber(sl.charAt(i))){
                                        provera=false;
                                        break;
                                    }
				} if(sl.length<num)provera=false;
                                return provera;
			};

			var isWord = function(sl){
				var provera;
				if(sl===""||sl.length<2) return false;
				for(var i =0; i<sl.length; i++){
					if(isCharLetter(sl.charAt(i))) provera = true;
						else{ provera = false;
							break;
					}
				}return provera;
			};

			//POVECAJ POCETNA SLOVA IMENA I PREZIMENA
			var capitalize = function(str){
				if(typeof str !== 'string') return '';
			 	return str.charAt(0).toUpperCase()+ str.slice(1);
			};
                        
                        var takeValFirst= function(){
                        fNameVal = firstName.value;
			lNameVal = lastName.value;
			passwordVal = password.value;
			password2Val = password2.value;
			mailVal = eMail.value;
			phoneVal = phoneNumber.value;
                        };
                        
                        var takeValSecond= function(){
                        dayVal = birthDay.value;
                        monthVal= birthMonth.value;
                        yearVal = birthYear.value;
                        jmbgVal = jmbg.value;
                        checkGender(); //uzima vrednost za pol  
                        };
                        
                        var takeValThird= function(){
                        okrugVal = okrug.value;
                        obrazovanjeVal = obrazovanje.value;
                        opstinaVal = opstina.value;
                        adresaVal = adresa.value;
                        pokretVal = pokret.value;
                        zanimanjeVal = zanimanje.value;         
                        };
			var takeValues = function(){
			
                        takeValFirst();
                        takeValSecond();
                        takeValThird();
                        
                        };
                        
                        var clear1 = function(){
                           firstName.style.borderColor="white"; 
                           lastName.style.borderColor="white"; 
                           eMail.style.borderColor="white"; 
                           password.style.borderColor="white"; 
                           password2.style.borderColor="white"; 
                           phoneNumber.style.borderColor="white"; 
                           prefSpan.innerHTML="";
                           fNameHint.innerHTML="";
                           lNameHint.innerHTML="";
                           emailHint.innerHTML="";
                           phoneNumberHint.innerHTML="";
                           pwHint.innerHTML="";
                           pw2Hint.innerHTML="";   
                           for(var i=0; i<hintSpan.length;i++)
                               hintSpan[i].innerHTML="";
                        };
 
                        var clear2 = function(){
                           zanimanje.style.borderColor="white"; 
                           okrug.style.borderColor="white"; 
                           opstina.style.borderColor="white"; 
                           obrazovanje.style.borderColor="white"; 
                           pokret.style.borderColor="white";  
                           for(var i=0; i<hintSpan.length;i++)
                               hintSpan[i].innerHTML="";
                        };
                        
                        var clearAll = function(){
                            clear1();
                            clear2();                           
                        };
                        
                        var isAllSelected = function(){
                            
                            var isAll=true;
                            
                            if(zanimanjeVal==0){
                                hintSpan[10].innerHTML="*";
                                zanimanje.style.borderColor="#990000";
                                isAll=false;
                            }

                            if(pokretVal==0){
                                hintSpan[11].innerHTML="*";
                                pokret.style.borderColor="#990000";
                                isAll=false;
                            }

                            if(opstinaVal==0){ opstina.style.borderColor="#990000";
                             hintSpan[9].innerHTML="*"
                             isAll=false;
                            }
                            if(obrazovanjeVal==0){ 
                                hintSpan[4].innerHTML="*";
                                obrazovanje.style.borderColor="#990000";
                                isAll=false;
                        }      
                             if(okrugVal==0){ 
                             okrug.style.borderColor="#990000";
                             hintSpan[3].innerHTML="*";
                             isAll=false;
                            }
                         return isAll;
                        };
                        
                        var isAllSelected2 = function(){
                            
                            var isAll=true;
                            
                            if(zanimanjeVal==0){
                                hintSpan[3].innerHTML="*";
                                zanimanje.style.borderColor="#990000";
                                isAll=false;
                            }

                            if(pokretVal==0){
                                hintSpan[4].innerHTML="*";
                                pokret.style.borderColor="#990000";
                                isAll=false;
                            }

                            if(opstinaVal==0){ opstina.style.borderColor="#990000";
                             hintSpan[1].innerHTML="*"
                             isAll=false;
                            }
                            if(obrazovanjeVal==0){ 
                                hintSpan[2].innerHTML="*";
                                obrazovanje.style.borderColor="#990000";
                                isAll=false;
                        }      
                             if(okrugVal==0){ 
                             okrug.style.borderColor="#990000";
                             hintSpan[0].innerHTML="*";
                             isAll=false;
                            }
                         return isAll;
                        };
                        
                        var checkJMBG = function(){
                           if(jmbgVal==="" || jmbgVal.length!==13){
                                jmbgVal=null;
                                jmbgHint.innerHTML="JMBG se sastoji od 13 cifara.";
                           }else if(!isNumber(jmbgVal,0)){
                               jmbgHint.innerHTML="JMBG ne može sadržati slova";
                               jmbgVal=null;
                           }
                           else jmbgHint.innerHTML=""; 
                                };
                            
                          
                        
                        var checkDate = function(){
                            if(!isDateSel())date="1911-11-11";
                            else date = yearVal.concat("-",(('0' + monthVal).slice(-2)),"-",(('0' + dayVal).slice(-2)));    
                        };
                     
             
                        
                        var check = function(){
                            
                            if(!isWord(fNameVal)){ firstName.style.borderColor="#990000";
                            hintSpan[0].innerHTML="*";
                            fNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(fNameVal.length===0) fNameHint.innerHTML="Polje za unos imena ne može ostati prazno";
                            }
                            if(!isWord(lNameVal)){ lastName.style.borderColor="#990000";
                            hintSpan[6].innerHTML="*";
                            lNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(lNameVal.length===0) lNameHint.innerHTML="Polje za prezime ne može ostati prazno";
                        }
                            if(!isSamePw(passwordVal,password2Val)){
                                    hintSpan[2].innerHTML="*";
                                    password.style.borderColor="#990000";
                                    password2.style.borderColor="#990000";
                                    hintSpan[8].innerHTML="*";
                                        }
                             if(!isCheckedPref())prefSpan.innerHTML= "*";
                                         
                             if(!isMail(mailVal)){ hintSpan[1].innerHTML="*";
                                 eMail.style.borderColor="#990000";
                                 emailHint.innerHTML="Unos mora biti u skladu sa e-mail formatom";
                             }
                             
				if(!isNumber(phoneVal,8)){ hintSpan[7].innerHTML="*";
                                    phoneNumberHint.innerHTML="U ovo polje možete uneti samo cifre.";
                                     if(phoneVal.length<8) phoneNumberHint.innerHTML="Broj koji ste uneli je prekratak.";
                                     phoneNumber.style.borderColor="#990000";
                                }
							
                              if(isAllSelected()&& isWord(fNameVal)&&(isWord(lNameVal))&&(isSamePw(passwordVal,password2Val))&&isCheckedPref()&&(isMail(mailVal))&&(isNumber(phoneVal,8)))
                                  return true;
                                  else{
                                      hintSpan[5].innerHTML="* Neophodno je popuniti sva polja obeležena zvezdicom *";
                                      return false;
                              }            
			};
                        
                        
                        var check1 = function(){
                            clear1();
                            if(!isWord(fNameVal)){ firstName.style.borderColor="#990000";
                            hintSpan[0].innerHTML="*";
                            fNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(fNameVal.length===0) fNameHint.innerHTML="Polje za unos imena ne može ostati prazno";
                            }
                            if(!isWord(lNameVal)){ lastName.style.borderColor="#990000";
                            hintSpan[1].innerHTML="*";
                            lNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(lNameVal.length===0) lNameHint.innerHTML="Polje za prezime ne može ostati prazno";
                        }
                            if(!isSamePw(passwordVal,password2Val)){
                                    hintSpan[2].innerHTML="*";
                                    password.style.borderColor="#990000";
                                    password2.style.borderColor="#990000";
                                    hintSpan[3].innerHTML="*";
                                        }
                             if(!isCheckedPref())prefSpan.innerHTML= "*";
                                         
                             if(!isMail(mailVal)){
                                 eMail.style.borderColor="#990000";
                                 hintSpan[4].innerHTML="*";
                                 emailHint.innerHTML="Unos mora biti u skladu sa e-mail formatom";
                             }
                             
				if(!isNumber(phoneVal,8)){
                                    if(phoneVal.length<8) phoneNumberHint.innerHTML="Broj koji ste uneli je prekratak.";
                                   else
                                   phoneNumberHint.innerHTML="U ovo polje možete uneti samo cifre.";
                                   hintSpan[5].innerHTML="*";
                                   phoneNumber.style.borderColor="#990000";         
                              }   
							
                            // if(isWord(fNameVal)&&(isWord(lNameVal))&&(isSamePw(passwordVal,password2Val))&&isCheckedPref()&&(isMail(mailVal))&&(isNumber(phoneVal,8)))
                                 // return true;
                                 // else{
                                 //     hintSpan[6].innerHTML="* Neophodno je popuniti sva polja obeležena zvezdicom *"; 
                                      return false;
                            //  }          
		
                       };
                            
                            
                            
                         storeLocalValues= function(){
                localStorage.setItem("date", date);
                localStorage.setItem("jmbg", jmbgVal);
                localStorage.setItem("gender", gender);
                localStorage.setItem("fName", fNameVal);
                localStorage.setItem("lName", lNameVal);
                localStorage.setItem("pw", passwordVal);
                localStorage.setItem("pref", pref);
                localStorage.setItem("mail", mailVal);
                localStorage.setItem("phone", phoneVal);
                    };
                   
                            
                         var checkHelper = function(){
                           if(!isDateSel())date=null;
                            else date = birthYear.value.concat("-",(('0' + birthMonth.value).slice(-2)),"-",(('0' + birthDay.value).slice(-2)));
                                checkGender();
                                checkJMBG();
                                storeLocalValues();
                                window.location.href="RedirectServlet?pref="+pref+"&gender="+gender+"&fName="+fNameVal+"&lName="+lNameVal+
                                    "&pw="+passwordVal+"&mail="+mailVal+"&phone="+phoneVal+"&date="+date+"&jmbg="+jmbgVal;

                         };
                        
                        
                        
                        
                        var check2= function(){ if(jmbgVal!==""&&jmbgVal.length!==13){
                        var r = confirm("Niste uneli tačan JMBG!");
                         if (r === true) checkHelper();
                         else {
                          info.innerHTML="JMBG se sastoji od 13 cifara!";
                          info.style.color="red";
                             }
                            }else checkHelper();
                         };  
                           		
                    
                        
                        var validate = function(){
                            clearAll();
                            takeValues();
                            checkJMBG();
                            checkDate();
                            if(check()) window.location.href=
                                    "RegisterServlet?pref="+pref+"&gender="+gender+"&fName="+fNameVal+"&lName="+lNameVal+
                                    "&pw="+passwordVal+"&mail="+mailVal+"&phone="+phoneVal+"&date="+date+"&jmbg="+jmbgVal+"&okrug="+okrugVal+
                                    "&opstina="+opstinaVal+"&adresa="+adresaVal+"&obrazovanje="+obrazovanjeVal+"&pokret="+pokretVal+"&profesija="+zanimanjeVal;
                        };

                        
           