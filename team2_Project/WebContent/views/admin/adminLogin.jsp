<%@page import="com.kh.manager.model.vo.Manager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	Manager loginManager = (Manager)session.getAttribute("loginManager");
%>
<!DOCTYPE html>
<html>
<head>
  <!-- Latest compiled and minified CSS -->
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
  />

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <meta charset="UTF-8" />
  <title>로그인페이지</title>
  <link rel="stylesheet" href="resources/css/adminStyle.css"/>
</head>
<body>
<%
String alertMsg = (String)session.getAttribute("alertMsg");
%>

<% if(alertMsg != null) {%>
  <script>
      alert("<%= alertMsg %>");
  </script>
<% session.removeAttribute("alertMsg"); %>
<% } %>

    <div id="wrap">
        <div id="allBox">
          <div id="header">
            <div id="w4t_logo">
              <img src="../../../resources/img/W4T_crop.svg" alt="" />
            </div>
          </div>
          
          <div id="content">
            <form action="/team2_Project/login.ma" method="post">
              <div id="content_title">관리자 로그인</div>
              <div id="content_id">
                <div class="form-group">
                  <label for="usr">아이디</label>
                  <input
                    type="text"
                    class="form-control"
                    id="usr"
                    placeholder="아이디를 입력하세요."
                    name="managerId"
                    required
                  />
                </div>
              </div>
              <div id="content_pwd">
                <div class="form-group">
                  <label for="pwd">비밀번호</label>
                  <input
                    type="password"
                    class="form-control"
                    id="pwd"
                    placeholder="비밀번호를 입력하세요."
                    name="managerPwd"
                    required
                  />
                </div>
              </div>
              <div id="login_button">
                <input
                  type="submit"
                  class="btn btn-outline-primary"
                  value="로그인하기"
                />
              </div>
            </form>
          </div>
        </div>
    </div>
</body>
</html>
