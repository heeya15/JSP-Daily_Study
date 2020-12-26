<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|게시판|글작성</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<script src="https://cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
</head>
<body>

<!-- Wrapper -->
<div id="wrapper"> 
  
  <!-- Header -->
  <header id="header"> <a href="index" class="logo"><strong>Missing</strong> pet</a>
    <nav> <a href="#menu">메뉴</a> </nav>
  </header>
  
  <!-- Menu -->
   <nav id="menu">
    <ul class="links">
      <li><a href="index">홈</a></li>
      <li><a href="landing">MISSING PET이란?</a></li>
      <li><a href="/Lab-scale/board.do">게시판</a></li>
      <c:choose>
      <c:when test="${sessionScope.active eq 0}">
      <li><a href="${pageContext.request.contextPath}/admin.do">관리자페이지</a></li>
      </c:when>
      <c:otherwise><li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li></c:otherwise>
      </c:choose>
    </ul>
    <ul class="actions vertical">
      <li><a href="javascript:history.back();" class="button special fit">돌아가기</a></li>
   <c:choose>
    <c:when test="${not empty sessionScope.sessionID}">   
        ${sessionScope.sessionID}님
        <li><a href="${pageContext.request.contextPath}/logout.do"> 로그아웃 </a></li>
    </c:when>           
    <c:otherwise><li><a href="${pageContext.request.contextPath}/lab_controller/login" class="button fit">로그인/회원가입</a></li></c:otherwise>
</c:choose>
    </ul>
  </nav>
  
  
  
  <!-- Main -->
  <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
    <div align="center">
      <c:forEach items="${sessionScope.writepre}" var="item" varStatus="i">
      <c:out value = "${item.postkind}"></c:out>
      <c:out value = "${item.pkind}"></c:out>
      <div class="page-header mt-3">
        <h2>글 수정</h2>
      </div>
      <p class="lead">${item.gratuity}</p>
      <hr>
      <form  name="form" onSubmit="return checkAll()" class="pt-3 md-3" style="max-width: 920px" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label style="text-align: start; margin: 8px">카테고리</label>
          <select style="background-color: white; color: black" name="postkind" onChange="gratuity1(this.value);" class="form-control">
            <option value="${item.postkind}" selected>${item.postkind}</option>
            <option value="신고">신고</option>
            <option value="보호">보호</option>
            <option value="입양">입양</option>
            <option value="분양">분양</option>
          </select>
        </div>
        <div class="form-group">
          <label style="text-align: start; margin: 8px">종류</label>
          <select style="background-color: white; color: black" name="pkind" onchange ="kindss(this)" class="form-control"  >
            <option selected>${item.pkind}</option>
            <option value="강아지" >강아지</option>
            <option value="고양이" >고양이</option>
            <option value="기타" >기타</option>
          </select>
          <br>
          <select style="background-color: white; color: black" name="pdetailkind" id = "kinds_detail" class="form-control">
            <option style="background-color: white; color: black" value="${item.pdetailkind}">${item.pdetailkind}</option>
          </select>
        </div>
        <div class="form-group">
          <label style="text-align: start; margin: 8px">금액([선택사항]신고:사례금, 분양:분양금, 입양:입양금)</label>
          <input type="text" name ="gratuity" id="sare" class="form-control" style="background-color: white; color: black; display:none"  placeholder="신고할 시 사례금을 적어주세요.">
        </div> 
        <div class="form-group">
          <label style="text-align: start; ">나이</label>
          <input style="background-color: white; color: black" type="text" name ="page" value="${item.page}">
        </div>
        
     <!--     <label>나이</label>
        <input type="text" name ="page" value="${item.page}">
         -->
         <br>
        <div class="form-group">
          <label style="text-align: start; ">성별</label>
          <select style="background-color: white; color: black" name="psex" class="form-control" >
            <option value="${item.psex}" selected>${item.psex}</option>
            <option value="수컷" >수컷</option>
            <option value="암컷" >암컷</option>
          </select>
        </div>
        <br>
        <!-- 
        <br><label>성별</label>
        수컷<input type="radio" name ="psex" value="수컷" checked="${item.psex}">
        암컷<input type="radio" name ="psex" value="암컷" checked="${item.psex}">
         -->
         <!--  <br><label style="text-align: start">주소</label>
              <input type="text" name="missadd1" id="address" value="${item.missadd1}" class="form-control" style="display: inline; width: 550px; height: 30px; margin-bottom: 10px" placeholder="주소를 입력하세요." readonly/>
            <input type="button" class="btn btn-primary" onClick="openDaumZipAddress();" value = "주소 찾기" />
            <br><input type="text" name="missadd2" id="address_etc" value="${item.missadd2}" class="form-control"  placeholder="상세주소를 입력하세요."/>
        -->
        <div class="form-group" style="width: 100%;">
          <label style="text-align: start">주소</label>
          <div style=" width: 90%; float: left;">
            <input type="text" name="missadd1" id="sample5_address" value="${item.missadd1}" style="background-color: white; color: black" placeholder="주소">
          </div>
          <div style=" width: 8%; float: left; margin-left: 5px ">
            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
          </div>
         <br>
           <div class="form-group">
          <label style="text-align: start; ">상세주소</label>
          <input style="background-color: white; color: black;" type="text"name="missadd2" value="${item.missadd2}" class="form-control" placeholder="상세주소를 입력해주세요">
        </div>
            <br>
          <div id="map" style="width:300px;height:300px;display:none"></div>
        </div>
        <div class="form-group">
          <label style="text-align: start; margin: 8px">제목</label>
          <input style="background-color: white; color: black" type="text" name="title" value="${item.title}" class="form-control" placeholder="제목을 입력하세요.">
        </div>
        <div class="form-group">
          <label style="text-align: start; margin: 8px">내용</label>
          <textarea name="etc"  id="story">${item.etc}</textarea>
          <script>CKEDITOR.replace('story'); </script> 
        </div>
           <input type="file" name="image"  value="${seesionScope.dir}${item.image}"><br>
           <input type="file" name="image2" value="${seesionScope.dir}${item.image2}"><br>
           <input type="file" name="image3" value="${seesionScope.dir}${item.image3}"><br>
           <input type="file" name="image4" value="${seesionScope.dir}${item.image4}">
        <!-- 
    <form name="sw_write_form" method="post" enctype="multipart/form-data" action="">
        <input type="file" name="file[]" size="50" class="input_write" />
        <a href="javascript:sw_file_add(50, 'class=input_write');" >파일 추가</a>
         여기에 추가가 된다. 
        <div id="sw_file_add_form"></div>
        </form>
         -->
       <br> <button type="submit" style="margin: 30px" formaction="/Lab-scale/boardupdate.do?post=${item.no}" class="btn btn-primary">글 수정</button>
      </form>
      <footer class="text-center" style="max-width: 920px;"> </footer>
   </c:forEach>
   </div>
  </main>
  
  
  <!-- Footer -->
  <footer id="footer">
    <div class="inner">
      <ul class="icons">
        <li><a href="https://twitter.com/explore" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="https://www.facebook.com/" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="https://www.instagram.com/" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
        <li><a href="https://github.com/" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
        <li><a href="https://www.linkedin.com/" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
      </ul>
      <ul class="copyright">
        <li>&copy; Untitled</li>
        <li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
      </ul>
    </div>
  </footer>
</div>

<!-- Scripts --> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script> 
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>
</body>
<script type= "text/javascript">
// 유효성 검사 함수
function checkAll(){
	if(!checkCategory(form.category.value)){
		return false;
	}	else if (!checkKind(form.kinds.value)){
		return false;
	}	else if (!checkKinds_detail(form.kinds_detail.value)){
		return false;
	}	else if (!checkTitle(form.jemok.value))
	{
		return false;
	}	else if (!checkStory(form.story.value))
	{
		return false;
	}
	return true;
}
// 공백확인 함수
function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
}
	
	
// 카테고리 검사
function checkCategory(){
	if(document.form.category.selectedIndex == "")
		{
			alert("카테고리를 선택해주세요!");
			return false;
		}
			return true;
}

// 종 검사
function checkKind(){
	if(document.form.kinds.selectedIndex == ""){
		alert("종을 선택해주세요!");
		return false;
	}
		return true;
}
	
// 세부 종 검사	
function checkKinds_detail(){
	if(document.form.kinds_detail.selectedIndex == ""){
		alert("세부 종을 선택해주세요!");
		return false;
	}
		return true;
}

// 제목 검사
function checkTitle(jemok){
	if(!checkExistData(jemok,"제목을"))
		return false;
	return true;
}

// 내용 검사
function checkStory(story){
	if(!checkExistData(story,"내용을"))
		return false;
	return true;
}
function kindss(e) {
	   var kinds_detail_dog = ["세부종을 선택하세요", "푸들", "불독", "잡종", "웰시코기"];
	   var kinds_detail_cat = ["세부종을 선택하세요", "개냥이", "흰냥이", "양아치", "미친놈"];
	   var kinds_detail_etc = ["세부종을 선택하세요", "조류", "파충류", "영장류", "", "기타"];
	var target = document.getElementById("kinds_detail");

	if(e.value == "강아지") {var d = kinds_detail_dog;}
	else if(e.value == "고양이") {var d = kinds_detail_cat;}
	else if(e.value == "기타") {var d = kinds_detail_etc;}

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

function gratuity1(value){
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
</script>

<!--다음 카카오주소 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

	function openDaumZipAddress() {

		new daum.Postcode({

			oncomplete:function(data) {

		    	$("#map_x").val(result[0]["address"].x); 
		    	$("#map_y").val(result[0]["address"].y);
		    	
				jQuery("#postcode1").val(data.postcode1);

				jQuery("#postcode2").val(data.postcode2);

				jQuery("#zonecode").val(data.zonecode);

				jQuery("#address").val(data.address);

				jQuery("#address_etc").focus();

				console.log(data);

			}

		}).open();

	}
	// 사례금 숫자입력
	function onlyNumber(event){
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        return false;
	}
	// 사례금 숫자입력2 
	function removeChar(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
	// 라인을 늘일 변수
    var uf = '';
    // sw_file_add_form div에 input 태그를 추가하는 함수
    function sw_file_add(size, ext) {
        // 최초 sw_file_add_form에 추가하고 다음부터는 sw_file_add_form1, 2, 3, 4, ... 로 계속 추가가 된다.
        // 물론 그에 맞는 div도 계속 생성한다. 차후에 추가한 div를 제거하는 것도 필요하다.
        eval('sw_file_add_form' + uf).innerHTML += "<input type=file name=file[] size='" + size + "' " + ext + "><div id='sw_file_add_form" + (uf+1) + "'></div>";        
        uf++;

    }

</script>

<!-- 
eval('sw_file_add_form' + uf).innerHTML += "<input type=file name=file[] size='" + size + "' " + ext + "><div id='sw_file_add_form" + (uf+1) + "'disabled=true></div>";
 -->
</html>        
