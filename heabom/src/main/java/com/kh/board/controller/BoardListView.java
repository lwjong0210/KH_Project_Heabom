package main.java.com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardListView
 */
@WebServlet("/list.bo")
public class BoardListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;	// 현재 총 게시글 개수
		int currentPage; // 현재 페이지
		int pageLimit; // 하단에 보여지는 페이징 바의 최대개수 
		int boardLimit; // 한 페이지내에 보여질 게시글 최대개수
		
		int maxPage; // 가장 마지막 페이지
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝수
		
		listCount = new BoardService().selectListCount();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
