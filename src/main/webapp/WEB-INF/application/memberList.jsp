<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원 목록</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/bootstrap/dist/css/adminlte.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function memberList(page , pageSize){
	$.ajax({
		url : "/memManage/memberList",
		data : {page : page, pageSize : pageSize},
		method : "GET",
		success : function(res){
			$("#if_list_div").empty();
			var html = res.split("$$$$$$$");
			$("#if_list_div").html(html[0]);
		}
	})
}

$(function(){
	var page = 1;
	pageSize = 5;

	// read memberList ...
	memberList(page , pageSize);

	// pagingNum section handler
	$("#if_list_div").on('change', '#perPageNum', function(){
		pageSize = $(this).val();
		if(pageSize != ""){
			memberList(page,pageSize);
		};
	});
	
	// When User clicked Search Button ... 
	$("#if_list_div").on('click', "#searchBtn", function(){
		var searchType = $('#searchType').val();
		var keyword = $('#searchKeyword').val();
		if (searchType != ""){
			$.ajax({
				url : '/memManage/search',
				data : {searchType : searchType, keyword : keyword, page : 1, pageSize : 10},
				method : "GET",
				success : function(res){
					$("#if_list_div").empty();
					var html = res.split("$$$$$$$");
					$("#if_list_div").html(html[0]);
				}
			})
		}else alert("검색 유형을 선택해 주세요.");

	});
	
	$("#if_list_div").on('click', '#memberRegist', function(){
		$(location).attr('href', '/memManage/memberRegistView');
	});

	$("#homeBtn").on('click', function(){
		memberList(page , pageSize);
	});

	$("#if_list_div").on('click', '#userInfoBtn', function(){
		var userid = $(this).data('userid');
		$(location).attr('href', '/memManage/memberInfoView?userid='+userid);
	})
	
})
</script>

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a id="homeBtn" href="#"
					class="nav-link">HOME</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#;"
					class="nav-link">회원관리</a></li>
			</ul>

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources/bootstrap/dist/img/user1-128x128.jpg"
									alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources/bootstrap/dist/img/user8-128x128.jpg"
									alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources/bootstrap/dist/img/user3-128x128.jpg"
									alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"><i
						class="fas fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->


		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/" class="brand-link"> <img
				src="${pageContext.request.contextPath }/resources/images/line.png"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">사용자관리</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/memManage/ProfileImgView?userid=${s_member.userid }" class="img-circle elevation-2"
							alt="User Image">
					</div>
					<div class="info">
						<div class="row">
							<a class="col-md-8" href="#" class="d-block">ID : ${s_member.userid }</a>
							<a class="col-md-8" href="#" class="d-block">별명 : ${s_member.alias }</a>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column subMenuList"
						data-widget="treeview" data-accordion="false">

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>

			<!-- /.sidebar -->
		</aside>


		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden; height: 750px;">
			
		</div>
	</div>

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="float-right d-none d-sm-inline">Anything you want</div>
		<!-- Default to the left -->
		<strong>Copyright &copy; 2014-2019 <a
			href="https://adminlte.io">AdminLTE.io</a>.
		</strong> All rights reserved.
	</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/dist/js/adminlte.min.js"></script>


</body>
</html>
