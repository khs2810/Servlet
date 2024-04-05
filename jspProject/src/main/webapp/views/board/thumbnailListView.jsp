<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.board.model.vo.Board"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판</h2>
        <br>
        
        <% if( loginUser != null) {%>
        	<div align="right" style="width: 850px; margin: auto; margin-bottom: 4px;">
                <a href="<%=contextPath %>/enrollForm.th" class="btn btn-sm btn-secondary">글쓰기</a>
            </div>
		<%} %>
        <div class="list-area">
        	<%for (Board b : list) { %>
            <div class="thumnail" align="center" key="<%=b.getBoardNo() %>">
            	<input type="hidden" value="<%=b.getBoardNo() %>">
                <img src="<%=contextPath %>/<%=b.getTitleImg() %>" width="200px" height="150px">
                <p>
                    <span>No. <%=b.getBoardNo() %> <%=b.getBoardTitle() %></span> <br>
                    조회수 : <%=b.getCount() %>
                </p>
            </div>
          <%} %>

        </div>
    </div>
    <script>
    	&(function(){
    		$(".thumbnail").click(function(){
    			
    			this.key
    			$(this).attr(key)
    			<!--$(this).children().eq(1).children().eq(0).text()-->
    			location.href = "<%=contextPath%>/detail.th?bno=" + this
    		})
    	})
    	
    	
    	
    </script>
</body>
</html>