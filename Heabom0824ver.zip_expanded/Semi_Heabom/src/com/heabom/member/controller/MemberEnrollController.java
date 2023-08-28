package com.heabom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.heabom.common.MyFileRenamePolicy;
import com.heabom.member.model.service.MemberService;
import com.heabom.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

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
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",new MyFileRenamePolicy());		
			
			
			
			String memId = multiRequest.getParameter("userId");
			String memPwd = multiRequest.getParameter("userPwd");
			String memName = multiRequest.getParameter("userName");
			String nickName = multiRequest.getParameter("nickName");
			String email = multiRequest.getParameter("email");
			String mbti = multiRequest.getParameter("mbti");
			String memphone = multiRequest.getParameter("phone");
			
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
