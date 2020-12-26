<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>🐶MISSING PET|게시판|회원가입</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

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
      <div class="page-header mt-3">
        <h2>회원가입</h2>
      </div>
      <p class="lead">사용자 정보를 입력해 회원가입을 수행합니다.</p>
      <hr>
      <form name="form" action="" method="POST"  class="pt-3 md-3" style="max-width: 720px" onSubmit="return checkAll()">
        <div class="form-group">
          <label style="text-align: start">아이디</label>
           <input type="text" name="userId" class="form-control" style="display: inline; width: 550px; height: 70px;" placeholder="아이디(4~12자의 영문 대소문자와 숫자)">
         <button type="submit" formaction=" " class="btn btn-primary" name="join" value="회원가입">중복검사</button>
        </div>
        <div class="form-group">
          <label style="text-align: start">비밀번호</label>
          <input type="password" name="pw" class="form-control" placeholder="비밀번호(4~12자의 영문 대소문자와 숫자)">
        </div>
        <div class="form-group">
          <label style="text-align: start">비밀번호 확인</label>
          <input type="password" name="password2" class="form-control" placeholder="비밀번호 확인">
        </div>
        <div class="form-group">
           <label style="text-align: start">주소</label>
              <input type="text" name="add1" id="address" class="form-control" style="display: inline; width: 550px; height: 70px; margin-bottom: 10px" placeholder="주소를 입력하세요." readonly/>
            <input type="button" class="btn btn-primary" onClick="openDaumZipAddress();" value = "주소 찾기" />
            <input type="text" name="add2" id="address_etc" class="form-control"  placeholder="상세주소를 입력하세요."/>
            
            <!-- 
			<div>
			<input type="text" id="address" value="" style="width:500px;" readonly/>
			<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />
			</div>
			<br/>
			<input type="text" id="address_etc" value="" style="width:720px;"/>
			
         <input type="text" class="form-control" placeholder="주소를 입력하세요.">-->  
        </div>
        <div class="form-group">
          <label style="text-align: start">이메일</label>
          <input type="text" name="email" class="form-control" placeholder="이메일 주소(예:id@domain.com)">
        </div>
        <div class="form-group">
          <label style="text-align: start">이름</label>
          <input type="text" name="username" class="form-control">
        </div>
        <div class ="form-row">
          <div class="form-group col-md-6">
            <label for ="inputju" style="text-align: start">주민번호앞자리</label>
            <input type="text" name="jumin1" class="form-control" placeholder="주민번호 앞자리(EX:990919)">
          </div>
          <div class="form-group col-md-6">
            <label for ="inputmin" style="text-align: start">주민번호뒷자리</label>
            <input type="password" name="jumin2" class="form-control" placeholder="주민번호 뒷자리(EX:114044)">
          </div>
        </div>
        <button type="submit" formaction="/Lab-scale/userjoin.do"  class="btn btn-primary"  name="join" value="회원가입">회원가입</button>
        <button type="reset" class="btn btn-primary" name="reset" value="다시 입력">다시입력</button>
      </form>
      <footer class="text-center" style="max-width: 720px;"> </footer>
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
</html>

<script type ="text/javascript">
function checkAll() {
        if (!checkUserId(form.userId.value)) {
            return false;
        } else if (!checkPassword(form.userId.value, form.password1.value,
                form.password2.value)) {
            return false;
        } else if (!checkMail(form.mail.value)) {
            return false;
        } else if (!checkName(form.name.value)) {
            return false;
        } else if (!checkBirth(form.identi1.value, form.identi2.value)) {
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

// id 검사 함수
  function checkUserId(id) {
        //Id가 입력되었는지 확인하기
        if (!checkExistData(id, "아이디를"))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.userId.value = "";
            form.userId.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }

// 비밀번호 검사 함수
function checkPassword(id, password1, password2) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(password1, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(password2, "비밀번호 확인을"))
            return false;
 
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password1)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.password1.value = "";
            form.password1.focus();
            return false;
        }
        //비밀번호와 비밀번호 확인이 맞지 않다면..
        if (password1 != password2) {
            alert("두 비밀번호가 맞지 않습니다.");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
 
        //아이디와 비밀번호가 같을 때..
        if (id == password1) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
 }    

// 이메일 검사 함수
 function checkMail(mail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(mail, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.mail.value = "";
            form.mail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
}

// 이름 검사 함수
function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
}

// 주민등록번호 검사 함수
function checkBirth(identi1, identi2) {
        //birth이 입력되었는지 확인하기
        if (!checkExistData(identi1, "주민등록번호를 ")
                || !checkExistData(identi2, "주민등록번호를 "))
            return false;
 
        var totalIdenti = "" + identi1 + identi2;
 
        var identiArr = new Array();
        var sum = 0;
        var plus = 2;
 
        //배열에 주민등록번호 입력 후 유효값 확인하기 위해 sum에 저장
        for (var i = 0; i < 12; i++) {
            identiArr[i] = totalIdenti.charAt(i);
            if (i >= 0 && i <= 7) {
                sum += totalIdenti[i] * plus;
                plus++;
                if (i == 7)
                    plus = 2;
            } else {
                sum += totalIdenti[i] * plus;
                plus++;
            }
        }
        //주민등록번호 길이 확인하기
        if (identiArr.length < 12) {
            alert("주민등록번호는 13자리입니다.");
            form.identi1.value = "";
            form.identi2.value = "";
            form.identi1.focus();
            return false;
        }
        //주민등록번호 유효한지 확인
        var result = 11 - (sum % 11)
        if (result != totalIdenti.charAt(12)) { //주민등록번호가 유효하지 않은 경우
            alert("유효하지않은 주민번호입니다.");
            form.identi1.value = "";
            form.identi2.value = "";
            form.identi1.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
}
</script>

<!--다음 카카오주소 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

	function openDaumZipAddress() {

		new daum.Postcode({

			oncomplete:function(data) {

				jQuery("#postcode1").val(data.postcode1);

				jQuery("#postcode2").val(data.postcode2);

				jQuery("#zonecode").val(data.zonecode);

				jQuery("#address").val(data.address);

				jQuery("#address_etc").focus();

				console.log(data);

			}

		}).open();

	}


</script>