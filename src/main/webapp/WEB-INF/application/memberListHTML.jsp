<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

</script>

<div class="content-wrapper" style="min-height: 584px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1>회원리스트</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">회원리스트</li>
						<li class="breadcrumb-item">목록</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-primary" id="memberRegist">회원등록</button>
				<div id="keyword" class="card-tools" style="width: 550px;">
					<div class="input-group row">
						<!-- sort num -->
						<select class="form-control col-md-3" name="perPageNum"
							id="perPageNum">
							<option value="">정렬개수</option>
							<option value="3">3개씩</option>
							<option value="5">5개씩</option>
							<option value="7">7개씩</option>
						</select>
						
						
						<!-- search bar -->
						<select class="form-control col-md-3" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="i">아이디</option>
							<option value="n">이름</option>
							<option value="a">별명</option>
						</select> 
						<input id="searchKeyword" class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""> 
						<span class="input-group-append">
						<button id="searchBtn" class="btn btn-primary" type="button" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
						</span>
						<!-- end : search bar -->
					</div>
				</div>
			</div>
			<div class="card-body" style="text-align: center;">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>아이디</th>
									<th>패스워드</th>
									<th>별명</th>
									<th>도로주소</th>
									<th>등록날짜</th>
									<!-- yyyy-MM-dd  -->
								</tr>

								<c:forEach items="${memberList }" var="member">
									<tr>
										<td id="userInfoBtn" data-userid="${member.userid }">${member.userid }</td>
										<td>${member.pass }</td>
										<td>${member.usernm }</td>
										<td>${member.addr1 }</td>
										<td>${member.reg_dt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- col-sm-12 -->
				</div>
				<!-- row -->
			</div>
			<!-- card-body -->
			<div class="card-footer">
				<nav aria-label="member list Navigation">
					<ul class="pagination justify-content-center m-0">
						
						<!-- Double-left Btn. Move to first Page -->
						<li class="page-item">
							<a class="page-link" href="#" onclick="memberList(${1}, ${pageSize })">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
						
						<!-- left Btn. Hide when current page is 1 -->
						<c:if test="${1 != page }">
							<li class="page-item">
								<a class="page-link" href="#" onclick="memberList(${page-1},${pageSize } )">
									<i class="fas fa-angle-left"></i>
								</a>
							</li>
						</c:if>
						
						<!-- pageNum Btn. -->
						<c:forEach var="i" begin="1" end="${page_cnt}">
							<c:choose>
								<c:when test="${i == page }">
									<li class="page-item active">
										<a class="page-link" href="#">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="#" onclick="memberList(${i},${pageSize } )">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- right Btn. Hide when current page is last Page -->
						<c:if test="${page != page_cnt }">
							<li class="page-item">
								<a class="page-link" href="#" onclick="memberList(${page+1},${pageSize } )">
									<i class="fas fa-angle-right"></i>
								</a>
							</li>
						</c:if>
						
						<!-- Double-right Btn. Move to last Page -->						
						<li class="page-item">
						<a class="page-link" href="#" onclick="memberList(${page_cnt}, ${pageSize })">
						<i class="fas fa-angle-double-right"></i>
						</a>
						</li>
					</ul>
				</nav>

			</div>
			<!-- card-footer -->
		</div>
		<!-- card  -->
	</section>
</div>
$$$$$$$
