<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.outer{
    background: black;
    color: white;
    width: 1000px;
    height: 500px;
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
</style>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        <br>
        <h2 align="center">공지사항 작성하기</h2>
        <br>

        <form action="<%=contextPath %>/insert.no" id="enroll-form" method="post">
            <table>
                <tr>
                    <th width="50">제목</th>
                    <td width="450"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style=resize:none;></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit" >등록하기</button>
                <button type="reset" >초기화</button>
                <button type="button" onclick="history.back()" >뒤로가기</button>
                <!-- 스텍으로 쌓아둔 것을 하나씩 꺼내옴. 
                    뒤로가기는 url이 있어야 사용 가능. 
                스텍 : 나중에 넣은걸 먼저 뺄수 있음. 박스안에 담는 물건을 생각하면 됨.
                큐 : 선입선출. 먼저 들어간 순서대로 뺄 수 있음. -->
            </div>
        </form>

    </div>

</body>
</html>