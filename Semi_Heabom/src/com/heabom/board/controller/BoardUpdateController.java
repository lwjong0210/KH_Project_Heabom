package com.heabom.board.controller;

import java.awt.print.Book;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.heabom.board.model.service.BoardService;
import com.heabom.board.model.vo.Board;
import com.heabom.common.MyFileRenamePolicy;
import com.heabom.common.model.vo.File;
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
			b.setBoardNo(boardContent);
			b.setWriter(MemNo);
			
//			String[] fileNo = multiRequest.getParameterValues("fileNo");
//			String[] filePath = multiRequest.getParameterValues("filePath");
//			String[] originName = multiRequest.getParameterValues("originName");
//			String[] changeName = multiRequest.getParameterValues("changeName");
//			
//	        for (int i = 0; i < fileNo.length; i++) {
//	            System.out.println(fileNo[i]);
//	        }
//			
//			System.out.println(fileNo);
//			System.out.println(filePath);
//			System.out.println(originName);
//			System.out.println(changeName);
			

			
			// 기존에 사진이 3개있었다면 첫번째 두번째 세번째에 있던 사진의 사진 no 가필요함 
			// 그 사진 no를 이용해서 file1 의 값이 있다면 원래사진 no를 가져감
			String boardNo = multiRequest.getParameter("boardNo");
			System.out.println(boardNo);
			
			ArrayList<File> originFileList = new BoardService().selectAttachmentList(boardNo);
			System.out.println("오리진 파일리스트" + originFileList.size());
			
			for(File f : originFileList) {
				System.out.println(f);
			}
			
//			ArrayList<File> updateflist = new ArrayList<File>();
//			ArrayList<File> insertflist = new ArrayList<File>();
//			ArrayList<File> updateList = new ArrayList<File>();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {	// 새롭게 추가된 파일이라면
					
					// 첫번째 파일이 그대로 두번째 삽입
						System.out.println(key);
						File f = new File();
						
						// 보드넘버 세팅
						f.setOriginName(multiRequest.getOriginalFileName(key));
						f.setChangeName(multiRequest.getFilesystemName(key));
						f.setFilePath("resource/img/board");
						System.out.println(f);
				}else {
					File f = new File();
					String flag = (String)multiRequest.getParameter("hidden" + i);


					f.setFileNo(flag);
					System.out.println("여긴 esle 임 : " + key);
					System.out.println("else 에서의 f : " + f);
//					File f = new File();
					// 보드넘버 세팅
//					f.setOriginName((String)multiRequest.getParameter("hidden" + i + i));
					
					System.out.println(flag);
					// 길이만큼 돌려 만약 거기에 벨류가 없다면 또한 originname 도 없다면 그값의 status 를 n으로
					// 근데 벨류가 없는데 originname 가 이썽? 그럼 그값에 업데이틓라ㅏㅈ
					
					
				}
			}
			

		}
	}
			
			
			
			
			
			
			
				
			
		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
