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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body.login-page {
	background-image: url('${pageContext.request.contextPath}/resources/images/intro.png');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<script type="text/javascript">

function getCookieValue(cookieName){
	var cookies = document.cookie.split("; ");	
	var result="";
	for (var i = 0 ; i < cookies.length; i++){
		var cookie = cookies[i].split("=");

		if (cookie[0] == cookieName){
			 result = cookie[1];
		}
	}
	return result;
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
	cookieValue = getCookieValue("REMEMBERME");
	if (cookieValue == "Y"){
		$("#userid").val(getCookieValue("USERNM"));
		
		$("input:checkbox").prop("checked", true);

		// attr("checked", "checked")
		// "input[type=checkbox]" 와 같이 해도 된다.
	}


	$("#submitBtn").on('click', function(){
		if ( $("input:checkbox").is(":checked") == true) {
			setCookie("REMEMBERME", "Y", 30);
			setCookie("USERNM",$("#userid").val(), 30);
		}
		if ( $("input:checkbox").is(":checked") == false) {
			deleteCookie("REMEMBERME");
			deleteCookie("USERNM");
		}
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
							<button id="submitBtn" type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
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