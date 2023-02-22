<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>common</title>

    <!-- Custom fonts for this template-->
    <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

    <script src="../../resources/vendor/jquery/jquery.min.js"></script>

    <script src="../../resources/ckeditor/ckeditor.js"></script>

</head>

<body>

    <%
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 menubar.jsp 로딩시 : null
	// 서비스 성공 후 menubar.jsp 로딩시 : alert로 띄워줄 메세지 문구
    %>

    <% if(alertMsg != null) {%>
	    <script>
	        alert("<%= alertMsg %>");
	    </script>
	<% session.removeAttribute("alertMsg"); %>
    <% } %>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="adminLogin.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Button Process Modal-->
    <div class="modal fade" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="commonModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="commonModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="commonModalBody">
                    
                    <div id="id1"></div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form action="#" method="post">
                        <input type="hidden" id="menuName" name="menuName" value="">
                        <button type="submit" class="btn btn-warning" id="checkBtn"></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Back Button Modal-->
    <div class="modal fade" id="backModal" tabindex="-1" role="dialog" aria-labelledby="backModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="commonModalBody">
                    작성중인 내용이 모두 사라집니다. <br>이전 페이지로 이동하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-warning" onclick="history.back()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

        <!-- Bootstrap core JavaScript-->
        <script src="../../resources/vendor/jquery/jquery.js"></script>
        <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    
        <!-- Core plugin JavaScript-->
        <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    
        <!-- Custom scripts for all pages-->
        <script src="../../resources/js/admin/sb-admin-2.js"></script>
    
        <!-- Page level plugins -->
        <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
         <!-- Page level custom scripts -->
         <script src="../../resources/admin/js/datatables.js"></script>

</body>

</html>