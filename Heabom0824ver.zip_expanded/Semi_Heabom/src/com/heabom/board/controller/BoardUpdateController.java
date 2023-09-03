package com.heabom.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.heabom.board.model.service.BoardService;
import com.heabom.board.model.vo.Board;
import com.heabom.common.MyFileRenamePolicy;
import com.heabom.common.model.vo.File;
import com.heabom.common.model.vo.HashTag;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resource/img/board/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			String boardTitle = multiRequest.getParameter("title");
			String boardCategory = multiRequest.getParameter("category");
			String boardContent = multiRequest.getParameter("content");
			String noticeUp = multiRequest.getParameter("noticeUp");
			String MemNo = multiRequest.getParameter("userNo");
			
			Board b = new Board();
			
			b.setBoardTitle(boardTitle);
			b.setBoardNo(boardCategory);
			b.setBoardContent(boardContent);
			if(noticeUp == null) {
				noticeUp = "N";
			}
			b.setBoardup(noticeUp);				
			
			b.setWriter(MemNo);
			
			ArrayList<File> list = new ArrayList<File>();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					File f = new File();
					f.setOriginName(multiRequest.getOriginalFileName(key));
					f.setChangeName(multiRequest.getFilesystemName(key));
					f.setFilePath("resource/img/board");
					list.add(f);
				}
			}
			
			// list에 사진 정보 들어있음 만약 사진이 있던거라면 originName 은 이미 있다. 
			// 새로 추가한 사진이라면 originName에 정보가 없다.
			
			for(File f : list) {
				
			}
			
			int result = new BoardService().updateBoard(b, list);
			
			String boardNo = new BoardService().returnBoardNo();
			
			String hashList = multiRequest.getParameter("tag");
			int result2 = 1;
			if(!hashList.isEmpty()) {
				HashTag ht = new HashTag();
				ht.setCategoryNo(boardNo);
				ht.setHashTagName(hashList);
				
				result2 = new BoardService().insertHash(ht);
			}
			System.out.println("업데이트 컨트롤러 보드넘버 : " + boardNo);
			System.out.println("업데이트 컨트롤러 해쉬리스트 : " + hashList);
			System.out.println("업데이트 컨트롤러 보드 : " + b);
			
			if(result > 0 && result2 > 0) {

				response.sendRedirect(request.getContextPath()+"/list.bo?cpage=1");
				
			}else {
				request.setAttribute("errorMsg", "게시물 작성에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
				
			}
			
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
