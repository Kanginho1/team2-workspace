<%@page import="com.kh.community.model.vo.Instagram"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Instagram> list = (ArrayList<Instagram>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="../../resources/js/jquery-3.6.3.min.js"></script>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>

	<div class="container text-center">
		<div class="row">
			<div class="col">
				<div style="padding-top: 35px; width: 200px;">
					<select class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
						<option value="1">최신순</option>
						<option value="2">좋아요순</option>
					</select>
				</div>
			</div>
			<div class="col"></div>
			<div class="col">
				<% if (loginUser != null) { %>
				<!-- 로그인한 회원만 보이게 -->
				<div style="padding-top: 35px; float: right;">
					<a class="btn btn-secondary btn-lg"
						href="<%= contextPath %>/upload.co" role="button">스타일올리기</a>
				</div>
				<% } %>
			</div>
		</div>
		<div class="container text-center">
			<div class="row row-cols-4" style="padding-top: 35px;">
				<% if (list.isEmpty()) { %>
				<p>조회된 게시글이 없습니다.</p>
				<% } else { %>
				<% for (Instagram insta : list) { %>
				<div class="col">
					<a href="#"> <img src="<%= insta.getInstaImgSrc() %>"
						class="img-fluid" alt="...">
					</a>
				</div>
				<% } %>
				<% } %>
			</div>
		</div>

		<nav aria-label="Page navigation example" style="padding-top: 150px;">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	
	<script>
		$(".img-fluid").cl/ick(function() {
			location.href = "<%= contextPath %>/feed.co"
		})
	</script>
	
</body>
</html>