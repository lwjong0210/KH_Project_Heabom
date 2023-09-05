package com.heabom.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.heabom.member.model.service.MemberService;
import com.heabom.member.model.vo.Member;

/**
 * Servlet implementation class CheckListUpdateController
 */
@WebServlet("/update.ck")
public class CheckListUpdateController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckListUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      request.setCharacterEncoding("UTF-8");
      
      
      String userId = request.getParameter("memId");
      int point = Integer.parseInt(request.getParameter("memPoint"));
      
      System.out.println(userId +" "+ point);
      
      /*
      int listSize = Integer.parseInt(request.getParameter("listSize")); 
      
      System.out.println("컨트롤러 1번 : " + listSize);
      
      String memId = "";
      
      int memPoint = 0;
      
      for(int i = 0; i<listSize; i++) {
    	  if(i < 0) {
    		  System.out.println(i);
    	  }else {
    		  memId = request.getParameter("memId"+i);
    		  memPoint = Integer.parseInt(request.getParameter("memPoint"+i));
    		  System.out.println(request.getParameter("memPoint"+i));
    		  System.out.println("여기는 controller"+i);
    	  }
      }
      */
      
      
         Member m = new Member(userId, point);
         Member updateMem = new MemberService().updateMember(m);
         
         System.out.println("asd"+ userId);
         System.out.println("++++++="+ point);
        	 
      
      
      if(updateMem != null) {
         
         HttpSession session = request.getSession();         
         session.setAttribute("memId", updateMem);
         session.setAttribute("alertMsg", "성공");
         
         response.sendRedirect(request.getContextPath() + "/check.ad");
         
      }else {
         request.setAttribute("errorMsg", "실패");
         RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
         view.forward(request, response);
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