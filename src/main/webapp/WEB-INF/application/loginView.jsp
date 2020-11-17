<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<style>
body.login-page {
	background-image: url('${pageContext.request.contextPath}/resources/images/intro.png');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<script type="${pageContext.request.contextPath }/resources/cookies/js.cookie-2.2.1.min.js"></script>
<script>
function getCookieValue(cookieName){
	// 1. 브라우저에 저장되어 있는 쿠키 리스트를 변수로 저장. 
	// " ; "를 구분자로 하는 배열이 cookies라는 변수에 저장.
	var cookies = document.cookie.split("; ");	

	for (var i = 0 ; i < cookies.length ; i++){
		// 이 경우 쿠키의 이름과 쿠키의 값을 갖는 배열이 생성된다.
		var cookie = cookies[i].split("=");	
		// cookie 배열은 [쿠키의 이름 , 해당 쿠키의 값]와 같은 형태를 갖는다. 
		if (cookie[0] == cookieName){
			 return cookie[1];	// 리턴으로 하면 바로 끝난다.
		}else{
			return "";	// 해당 쿠키명이 존재하지 않는 경우에는 ""를 반환한다.
		}
	}
}

function setCookie(cookieName, cookieValue, expires){
	var today = new Date();
	// 현재 날짜에서 미래로 + expires만큼 한 날짜 구하기
	today.setDate(today.getDate() + expires);
	document.cookie = cookieName + "=" 
					+ cookieValue 
					+ "; path=/; expires=" + today.toGMTString() + ";";
	console.log(document.cookie);
}

// 해당 쿠키의 expires 속성을 과거 날짜로 변경
function deleteCookie(cookieName){
	setCookie(cookieName, "", -1);
}


$(function(){
	// 가장 먼저 쿠키가 저장되어 있는지를 확인한다.
	cookieValue = Cookies.get("REMEMBERME");
	if (cookieValue == "Y"){
		$("input[type=email]").val(Cookies.get("USERNM"));
		$("input:checkbox").prop("checked", true);
		// attr("checked", "checked")
		// "input[type=checkbox]" 와 같이 해도 된다.
	}

	// 쿠키 설정하기...
	
	$("button[type=submit]").on('click', function(){
		// 클릭 여부를 콘솔창에 전시한다.
		console.log("button_click");	
		// 아이디 기억 체크박스가 체크되어 있으면
		if ( $("input:checkbox").is(":checked") == true) {
			// is 대신 prop도 사용 가능하다.
			Cookies.set("REMEMBERME", "Y");
			Cookies.set("USERNM", $("input #userid").val());
		}
		// 아이디 기억 체크박스가 체크되어 있지 않으면
		if ( $("input:checkbox").is(":checked") == false) {
			Cookies.remove("REMEMBERME");
			Cookies.remove("USERNM");
		}
		$("form").submit();
	})
})
</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#" style="color : white;"><b>관리자 로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="/memManage/loginMethod" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="userid" name="userid"
							placeholder="아이디를 입력하세요." value=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pass"
							placeholder="패스워드를 입력하세요." value=""> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox" name="rememberMe"
									value=""> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-sm-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/dist/js/adminlte.min.js"></script>
</body>
</html>