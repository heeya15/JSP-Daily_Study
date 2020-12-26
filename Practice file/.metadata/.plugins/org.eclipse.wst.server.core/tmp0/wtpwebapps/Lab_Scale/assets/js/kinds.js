function kindss(e) {
	var kinds_detail_dog = ["세부종을 선택하세요", "푸들", "불독", "똥개", "광희"];
	var kinds_detail_cat = ["세부종을 선택하세요", "개냥이", "흰냥이", "양아치", "미친놈"];
	var kinds_detail_etc = ["세부종을 선택하세요", "새", "공룡", "에바", "니미", "시발"];
	var target = document.getElementById("kinds_detail");

	if(e.value == "dog") {var d = kinds_detail_dog;}
	else if(e.value == "cat") {var d = kinds_detail_cat;}
	else if(e.value == "etc") {var d = kinds_detail_etc;}

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		opt.style.backgroundColor = "#000000";
		opt.style.backgroundColor = "white";
	      opt.style.color = "black";
		target.appendChild(opt);
	}	
}

function gratuity(value){
	if(value == "singo"){
		document.getElementById("sare").style.display="block";
	}
	else if(value == "bune"){
		document.getElementById("sare").style.display="block";
	}
	else if(value == "ip"){
		document.getElementById("sare").style.display="block";
	}
	else{
		document.getElementById("sare").style.display="none";
	}
}