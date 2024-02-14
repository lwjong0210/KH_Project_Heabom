package com.heabom.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.heabom.board.model.service.BoardService;
import com.heabom.board.model.vo.Reply;
import com.heabom.common.model.vo.Like;

/**
 * Servlet implementation class AjaxReplySelectController
 */
@WebServlet("/rlist.bo")
public class AjaxReplySelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplySelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bno = request.getParameter("bno");
		String mno = request.getParameter("mno");
		
		System.out.println(bno);
		System.out.println(mno);
		
		// 현재 게시글의 댓글리스트
		ArrayList<Reply> replyList = new BoardService().selectReplyList(bno, mno);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(replyList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
