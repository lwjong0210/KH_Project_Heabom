package com.heabom.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heabom.board.model.service.BoardService;
import com.heabom.board.model.vo.Board;
import com.heabom.board.model.vo.PrevNextPage;
import com.heabom.board.model.vo.Reply;
import com.heabom.common.model.vo.File;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String bno = (String)request.getParameter("bno");
		
		
		BoardService bService = new BoardService();
		ArrayList<Reply> rlist = new BoardService().selectReplyList(bno);
		
		
		int result = bService.increaseCount(bno);
		
		
		
		if(result>0) {
			Board b = bService.selectBoard(bno);
			ArrayList<File> flist = bService.selectFileList(b.getBoardNo());
			PrevNextPage p = new BoardService().prevNextBo(Integer.parseInt(bno));
			System.out.println("ㅋㅋㅋㅋㅋㅋㅋㅋㅋ배고파" + flist);
			request.setAttribute("b", b);
			request.setAttribute("flist", flist);
			request.setAttribute("rlist", rlist);
			request.setAttribute("p", p);
			
			System.out.println(p+"Zzzzzzzzzzzzzzzzzzzzzz");
			
			
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
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
