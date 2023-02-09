<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<style>
    div{border: 1px solid red;}
    .wrap{
        width: 1200px;
        height: 600px;
    }

    .wrap>div{
        height: 100%;
        display: flex;
    }

    #left{
        width: 25%;
    }

    #right{
        width: 75%;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div id="left">
            <div id="left_top"></div>
            <div id="left_bottom"></div>
        </div>
        <div id="right">
            <div id="right_top"></div>
            <div id="right_bottom">
                <div id="right_bottom_top">
                    <div id="right_bottom_top1"></div>
                    <div id="right_bottom_top2"></div>
                    <div id="right_bottom_top3"></div>
                    <div id="right_bottom_top4"></div>
                </div>
                <div id="right_bottom_middle"></div>
                <div id="right_bottom_bottom"></div>
            </div>
        </div>
    </div>
    

</body>
</html>