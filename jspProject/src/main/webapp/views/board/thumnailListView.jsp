<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background: black;
        color: white;
        width: 1000px;
        height: 500px;
        margin: auto;
        margin-top: 50px;
        
    }

    .list-area{
        max-width: 850px;
        margin: auto;
        
    }
    
    .thumnail{
        display: inline-block;
        border: 1px solid white;
        padding: 12px;
        margin: 14px;
        width: 226px;

    }

    .thumnail:hover{
        cursor: pointer;
        opacity: 0.9;
        
    }

    .thumnail p > span{
        display: inline-block;
        width: 200px;
        /* text 길어서 ... 줄이려먼 무조건 span 태그 필요. */
        text-overflow: ellipsis; 
        white-space: nowrap; /* 개행 못하게 하는 문*/
        overflow: hidden; /*넘치는거 숨기는*/
    }


</style>
</head>
<body>
    <%@ includ file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판</h2>
        <br>

        <div class="list-area">
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>
            <div class="thumnail" align="center">
                <img src="" alt="썸네일" width="200px" height="150px">
                <p>
                    <span>No. 125 고순이의 하루</span> <br>
                    조회수 : 15.0M
                </p>
            </div>

        </div>
    </div>
</body>
</html>