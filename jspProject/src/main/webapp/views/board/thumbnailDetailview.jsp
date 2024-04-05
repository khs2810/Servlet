<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.board.model.vo.Attachment"%>
<%
	Board b = (Board)request.getAttribute("b");

	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>    
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

    .detail-area td, .detail-area th{
    	border: 1px solid white;
    	text-align: center;
    }
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">사진게시판 상세보기</h2>
        <br>

            <table class="detail-area" align="center">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3" width="600"><%=b.getBoardTitle() %></td>
                </tr>
                <tr>
                	<th>작성자</th>
                	<td><%=b.getBoardWriter() %></td>
                	<th>작성일</th>
                	<td><%=b.getCreateDate() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                    	<p style="height:50px;"><%=b.getBoardContent() %></P>
                    </td>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3">
                        <img id="title-img" width="250" height="170" >
                        <img src="<%=contextPath %>/<%=list.get(0).getFilePath() + list.get(0).getChangeName() %>" width="500" height="300">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td colspan="3">
                    	<div>
                    		<%for(int i = 1; i < list.size(); i++ ) { %>
                    			<img src="<%=contextPath %>/<%=list.get(i).getFilePath() + list.get(i).getChangeName() %>" width="200" height="150">
                    		<%} %>
                    	</div>
                    </td>
                </tr>
            </table>
            
            <br>
            
            
            <div style="display: none;">
                <input type="file" name="file1" id="file1" required onchange="loadImg(this, 1)">
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
            </div>
            <script>
                function loadImg(inputFile, num){
                    // console.log(inputFile)
                    // console.log(num)
                    //inputFile : 현재 변화가 생긴 input type=file 요소객체
                    //num : 몇번째 input요소인지 확인하기 위한 파라미터

                    // inputFile.files[0] => 선택된 파일이 담겨있다.
                    // inputFile.files.length -> 1
                    console.log(inputFile.files.length)

                    if(inputFile.files.length == 1){// 파일을 하나 선택했다. => 미리보기
                        //파일을 읽어들일 FileReader객체생성
                        const reader = new FileReader();

                        //파일을 읽어들이는 메소드
                        //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
                        reader.readAsDataURL(inputFile.files[0]);

                        //파일을 읽어들이는 메소드
                        //파일 읽어들이기 완료했을때 실행할 함수 정의
                        reader.onload = function(ev){
                            // console.log(ev.target.result) => 읽어들인 파일의 고유한 url
                            switch(num){
                                case 1: document.getElementById("title-img").src = ev.target.result; break;
                                case 2: document.querySelector("#content-img1").src = ev.target.result; break;
                                case 3: $("#content-img2").attr("src", ev.target.result); break;
                                case 4: $("#content-img3").attr("src", ev.target.result);
                            }
                        }
                    } else { // 선택된 파일을 취소한 경우 => 미리보기 지워준다.
                        switch(num){
                                case 1: document.getElementById("title-img").src = null; break;
                                case 2: document.querySelector("#content-img1").src = null; break;
                                case 3: $("#content-img2").attr("src", null); break;
                                case 4: $("#content-img3").attr("src", null); break;
                            }
                    }
                }

                function chooseFile(num){    // num번째 이미지를 클릭               
                    const imgInput = document.querySelector("#file" + num);                    
                    imgInput.click();
                }
            </script>
            
            <br>
            
            <div align="center">
            	<input type="submit" value="등록하기">
            </div>
        </form>
    </div>
</body>
</html>