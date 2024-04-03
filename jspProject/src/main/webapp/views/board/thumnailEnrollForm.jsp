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
        height: 700px;
        margin: auto;
        margin-top: 50px;
    }

    #enroll-form table{
        border: 1px solid white;
    }

    #enroll-form input, #enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }
    #enroll-form img:hover{
        cursor: pointer;
        scale: 0.98;
    }
</style>
</head>
<body>
	<%@ includ file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">사진게시판 작성하기</h2>
        <br>

        <form action="" id="enroll-form">
            <table align="center">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">
                        <input type="text" name="title" required>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <textarea name="content" rows="5" style="resize: none;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3">
                        <img id="title-img" width="250" height="170" onclick="chooseFile(1)">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td><img id="content-img1" width="150" height="120" onclick="chooseFile(2)"></td>
                    <td><img id="content-img2" width="150" height="120" onclick="chooseFile(3)"></td>
                    <td><img id="content-img3" width="150" height="120" onclick="chooseFile(4)"></td>
                </tr>
            </table>
            
            <div style="display: none;">
                <input type="file" name="file1" id="file1" required>
                <input type="file" name="file2" id="file2">
                <input type="file" name="file3" id="file3">
                <input type="file" name="file4" id="file4">
            </div>
            <script>
                function chooseFile(num){
                    const imgInput = document.querySelector("#file" + num);
                }
            </script>
        </form>
    </div>
</body>
</html>