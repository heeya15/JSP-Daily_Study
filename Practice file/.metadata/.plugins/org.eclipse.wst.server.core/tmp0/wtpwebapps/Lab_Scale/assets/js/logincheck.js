addLoadEvent(lgch);

function addLoadEvent(func){
    var oldonload = window.onload;
    if(typeof window.onload != 'function'){
    	window.onload = func;
	}else{
		window.onload = function(){
			oldonload();
			func();
        };
    } 
}
function lgch(){
	if(location.search == "?msg=0"){
		alert("비밀번호가 다릅니다.");
	}
	else if(location.search == "?msg=-1"){
		alert("아이디가 다릅니다.");
	}
	else if(location.search == "?msg=-2"){
		alert("로그인 해주세요!");
	}
	else if(location.search == "?msg=4"){
		alert("관리자 입니다!");
	}
	else if(location.search == "?msg=3"){
		alert("없는 회원입니다.");
	}
}
function gratuity(value){
	   if(value == "신고"){
	      document.getElementById("sare").style.display="block";
	   }
	   else if(value == "분양"){
	      document.getElementById("sare").style.display="block";
	   }
	   else if(value == "입양"){
	      document.getElementById("sare").style.display="block";
	   }
	   else{
	      document.getElementById("sare").style.display="none";
	   }
	}
