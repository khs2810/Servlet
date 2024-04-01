package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
		
		//데이터추출
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		//서비스-> deleteMember();
		
		int result = new MemberService().deleteMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		
		if (result > 0) { //성공시 -> session에 login정보 삭제 후 -> 메인페이지
			session.setAttribute("alertMsg", "회원탈퇴 되었습니다. 쳇");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		} else { //실패시 -> 세션에 alertMsg로 회원탈퇴 실패
			session.setAttribute("alertMsg", "올땐 맘대로지만, 나갈땐 아니란다.");
			
			// kh/myPage.me로 이동
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}
		
		/**
		 * 정보변경, 비밀번호변경 -> 데이터를 데이터베이스로 다시 가져와 넣어주기
		 * 
		 * 탈퇴성공시 => 메인페이지 alert(성공했다.)
		 * 				단, 로그아웃처리해야함(session에 loginUser라는 키값에 데이터가 없어야 한다.)
		 * 실패시 => 마이페이지로 돌아가서 alert(회원탈퇴 실패)
		 */
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
