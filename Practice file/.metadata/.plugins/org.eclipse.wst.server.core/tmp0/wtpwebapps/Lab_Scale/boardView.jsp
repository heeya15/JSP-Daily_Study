<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.swiper-container {
	width: 550px;
	height: 380px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<head>
<title>🐶MISSING PET|게시판|글작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />

</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<a href="index" class="logo"><strong>Missing</strong> pet</a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
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
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="actions vertical">
				<li><a href="javascript:history.back();"
					class="button special fit">돌아가기</a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.sessionID}">   
        ${sessionScope.sessionID}님
        <li><a href="${pageContext.request.contextPath}/logout.do">
								로그아웃 </a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/lab_controller/login"
							class="button fit">로그인/회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- Main -->
		<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
			<c:forEach items="${sessionScope.Viewlist}" var="item" varStatus="i">
				<div align="center">
					<div class="page-header mt-3">
						<h2>글 보기</h2>
					</div>
					<p class="lead">게시글을 확인합니다.</p>
					<hr>
					<form class="pt-3 md-3" style="width: 60%" method="POST">
						<table width="100" he border="0">
							<tbody style="text-align: center">
								<tr>
									<th style="text-align: center" scope="col">제목</th>
									<th style="text-align: center" scope="col">작성자</th>
									<th style="text-align: center" scope="col">작성일자</th>
								</tr>
								<tr style="font-size: 30px">
									<td>${item.title}</td>
									<td>${item.user_id}</td>
									<td>${item.regdate}</td>
								</tr>
							</tbody>
						</table>



						<table width="100" he border="0">
							<tbody style="text-align: center">
								<tr>
									<th style="text-align: center" scope="col">분류</th>
									<th style="text-align: center" scope="col">종</th>
									<th style="text-align: center" scope="col">세부종</th>
									<th style="text-align: center" scope="col">사례금</th>
									<th style="text-align: center" scope="col">성별</th>
									<th style="text-align: center" scope="col">나이</th>
								</tr>
								<tr>
									<td>${item.postkind}</td>
									<td>${item.pkind}</td>
									<td>${item.pdetailkind}</td>
									<td>${item.gratuity}</td>
									<td>${item.psex}</td>
									<td>${item.page}</td>
								</tr>
							</tbody>
						</table>

						<!-- Swiper를 사용하기 위한 최소 기본 형태 -->
						<!-- 클래스명은 변경하면 안 됨 -->
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:if test="${not empty item.image}">
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/images/${item.image}">
									</div>
								</c:if>
								<c:if test="${not empty item.image2}">
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/images/${item.image2}">
									</div>
								</c:if>
								<c:if test="${not empty item.image3}">
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/images/${item.image3}">
									</div>
								</c:if>
								<c:if test="${not empty item.image4}">
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/images/${item.image4}">
									</div>
								</c:if>
								<div class="swiper-slide" style="font-size: 50pt;">사진이 더
									이상 없습니다.</div>
							</div>
						</div>
						<div style="text-align: center; margin-top: 5px;">사진 갤러리</div>
						<script>
							// 클래스명 swiper-container 입력
							// 이 클래스명은 변경하면 안됨
							new Swiper('.swiper-container');
						</script>
						<table width="100" border="0">
							<tbody>
								<tr>
									<th style="text-align: center" scope="col">주소</th>
								</tr>
								<tr>
									<td style="text-align: center">${item.missadd1},${item.missadd2}</td>

								</tr>
							</tbody>
						</table>
						<table width="400" border="0">
							<tbody>
								<tr>
									<th style="text-align: center; margin-bottom: 0px" scope="col">지도</th>
								</tr>
								<tr>
								</tr>
							</tbody>
						</table>
						<div id="map" style="width: 100%; height: 200px; margin-top: 0px"></div>

						<hr>

						<div style="width: auto"></div>

						<div class="form-group">
							<label>내용</label>
							<div contenteditable="true">
								<textarea value="only read" readonly disabled="True"
									style="resize: none;">${item.etc}</textarea>
							</div>



							<ul class="actions horizontal">
								<c:choose>
									<c:when
										test="${item.user_id eq sessionScope.sessionID || sessionScope.active eq 0}">
										<li style="padding: 0"><button type="submit"
												formaction="/Lab-scale/boarddel.do?post=${item.no}"
												style="background-color: aliceblue; color: black"
												class="button fit">삭제</button></li>
										<li style="padding: 0"><a
											style="background-color: aliceblue; color: black"
											href="/Lab-scale/boardpreupdate.do?post=${item.no}"
											class="button fit">수정</a></li>
									</c:when>
								</c:choose>
								<li style="padding: 0"><a
									style="background-color: aliceblue; color: black"
									href="javascript:history.back();" class="button fit">목록</a></li>

							</ul>
							<c:if test="${not empty sessionScope.replylist}">
								<table>
									<thead>
										<tr>
											<th scope="col" style="width: 100px; text-align: center;">번호</th>
											<th scope="col" style="width: auto; text-align: center;">내용</th>
											<th scope="col" style="width: 150px; text-align: center;">작성자</th>
											<th scope="col" style="width: 200px; text-align: center;">날짜</th>
										</tr>
									</thead>
									<tbody style="text-align: center">
										<c:forEach items="${sessionScope.replylist}" var="jtem"
											varStatus="status">
											<tr>
												<th scope="row" style="text-align: center;">${status.count}</th>
												<td><p>${jtem.reply_content}</p></td>
												<td>${jtem.user_id}</td>
												<td>${jtem.regdate}</td>
												<c:choose>
													<c:when
														test="${jtem.user_id eq sessionScope.sessionID || sessionScope.active eq 0}">
														<td><button type="submit"
																formaction="/Lab-scale/replydel.do?reply=${jtem.reply_no}&post=${item.no}"
																style="width: 70; text-align: center">댓글삭제</button></td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>

							<div style="width: 100%; height: 100px;">
								<div style="width: 85%; float: left;">
									<textarea name="reply_content"
										style="background-color: white; color: black; margin-right: 1px; resize: none">댓글입력</textarea>
								</div>
								<div style="width: 15%; float: left;">
									<button type="submit"
										formaction="/Lab-scale/replyinsert.do?reply=${item.no}"
										style="float: left; width: 100%; height: 125%; margin-left: 5px; text-align: center">댓글등록</button>
								</div>
							</div>

						</div>
					</form>

				</div>

			</c:forEach>
		</main>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/kinds.js"></script>


</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e24307f74088feda65ee820398b79c9b&libraries=services"></script>
<script>
	var missadd1 = '<c:out value="${sessionScope.missadd}"/>';
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					missadd1,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0; color:black">실종지역</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);

							var markerPosition = new kakao.maps.LatLng(
									result[0].y, result[0].x);
							console.log(result[0].y);
							console.log(result[0].x);
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						}
					});
</script>
</html>



