package com.heabom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.heabom.member.model.service.MemberService;
import com.heabom.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/insert.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("userPwd");
		String memName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String mbti = request.getParameter("mbti");
		String memphone = request.getParameter("phone");
		
		Member m = new Member();
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		m.setMemName(memName);
		m.setEmail(email);
		m.setMbit(mbti);
		m.setMemPhone(memphone);
		m.setNickname(nickName);
		
		int result = new MemberService().insertMember(m);
		if (result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입성공");
			response.sendRedirect(request.getContextPath());
		}else {
			System.out.println("실패");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
