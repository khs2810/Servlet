<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	background-color: black;
	color: white;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
	padding: 10px 0px 50px 0px;
}

table {
	margin: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<!-- ../ : 지금위치로부터 뒤로 한칸 빠질수 있음 -->
	<%
	String userId = loginUser.getUserId();
	String userName = loginUser.getUserName();
	String phone = loginUser.getPhone() == null ? "" : loginUser.getPhone();
	String email = loginUser.getEmail() == null ? "" : loginUser.getEmail();
	String address = loginUser.getAddress() == null ? "" : loginUser.getAddress();
	String interest = loginUser.getInterest() == null ? "" : loginUser.getInterest();
	%>

	<div class="outer">
		<br>
		<h2 align="center">마이페이지</h2>
		<form action="<%=contextPath%>/update.me" id="enroll=form"
			method="POST">
			<table>
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" maxlength="12"
						value="<%=userId%>" readonly></td>
					<td></td>
					<!-- form태그 안이므로, type을 버튼으로 안주면 submit이 되어버림 -->
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="6"
						value="<%=userName%>" required></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" placeholder="- 포함해서 입력"
						value="<%=phone%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="<%=email%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=address%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td colspan="2"><input type="checkbox" name="interest"
						id="sports" value="운동"> <label for="sports">운동</label> <!-- label에 id와 동일하게 넣어줘야 인식함 -->
						<input type="checkbox" name="interest" id="climbing" value="등산">
						<label for="sports">등산</label> <input type="checkbox"
						name="interest" id="fishing" value="낚시"> <label
						for="sports">낚시</label> <br> <input type="checkbox"
						name="interest" id="cooking" value="요리"> <label
						for="sports">요리</label> <input type="checkbox" name="interest"
						id="game" value="게임"> <label for="sports">게임</label> <input
						type="checkbox" name="interest" id="movie" value="영화"> <label
						for="sports">영화</label> <input type="checkbox" name="interest"
						id="etc" value="기타"> <label for="sports">기타</label></td>
				</tr>
			</table>
			<Script>
                const interest = "<%=interest%>"; // 운동, 낚시 
                const inputArr = document.querySelectorAll("input[name=interest]");
                //[<input>,<input>,<input>,<input>,<input>,<input>]

                for(let input of inputArr){
                    if(interest.includes(input.value)){ // interest에 input.value의 값이 
                        input.checked = true;
                    }
                }
            </Script>

			<br>
			<br>

			<div align="center">
				<button type="submit" class="btn btn-sm btn-info">정보변경</button>
				<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update-pwd-modal">비밀번호변경</button>
				<button type="submit" class="btn btn-sm btn-danger">회원탈퇴</button>
			</div>
		</form>
	</div>

	<script>
        function checkPwd(){
            const pwd = document.querySelector("#enroll-form input[name=userPwd]").value;
            const pwdCheck = document.querySelector("#enroll-form input[name=userPwdCheck]").value;

            if(pwd !== pwdCheck){
                alert("비밀번호가 일치하지 않습니다.");
                return false;

            }
        }
    </script>
    



	<!-- 비밀번호 변경 modal -->
	<div class="modal" id="update-pwd-modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="<%=contextPath%>/updatePwd.me" method="POST">
                        <input type="hidden" name="userId" value="<%=userId%>">
                        <table>
                            <tr>
                                <td>현재 비밀번호</td>
                                <td><input type="password" name="userPwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호</td>
                                <td><input type="password" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호 확인</td>
                                <td><input type="password" name="checkPwd" required></td>
                            </tr>
                        </table>
                        <br>
                        <button id="edit-pwd-btn" type="submit" class="btn btn-sm btn-secondary">
                            비밀번호 변경
                        </button>
                    </form>
                    <script>
                        document.getElementById("edit-pwd-btn").onclick = function(){
                            const updatePwd = document.querySelector("input[name=updatePwd]").value;
                            const checkPwd = document.querySelector("input[name=checkPwd]").value;
                            
                            if(updatePwd !== checkPwd){
                                alert("비밀번호를 확인해주세요.");
                                return false;
                            }
                            
                            // if($("input[name=updatePwd]").val() !== $("input[name=checkPwd]").val){

                            // }
                        }
                    </script>
				</div>

				

			</div>
		</div>
	</div>
</body>
</html>