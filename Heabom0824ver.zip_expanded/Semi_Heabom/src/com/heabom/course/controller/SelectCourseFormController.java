package com.heabom.course.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.heabom.place.model.service.PlaceService;
import com.heabom.place.model.vo.Place;

/**
 * Servlet implementation class SelectCourseFormController
 */
@WebServlet("/courseSelect.pl")
public class SelectCourseFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCourseFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arr [] =  request.getParameterValues("check").clone();
//		for(int i = 0 ; i < arr.length ; i ++) {
//			System.out.println(arr[i]+ " "  + i );
//		}
		
		int checkArr [] = new int [arr.length]; //인트값 담을 체크 배열 생성
		for(int i = 0 ; i < arr.length ; i ++) {
			checkArr[i] = Integer.parseInt(arr[i]);
		}
		HttpSession session = request.getSession();
		ArrayList searchKey = (ArrayList)session.getAttribute("searchKey");
		searchKey.add(checkArr); //1번인덱스에 추가 
		int lNo = (int)searchKey.get(0);
		session.setAttribute("searchKey", searchKey);
		
		
		ArrayList<Place> list = new PlaceService().selectPlaceList(lNo);
		
		
		
		if(!(list.isEmpty())) {
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/place/selectCourse.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg","등록된맛집이 없네용");
			response.sendRedirect(request.getContextPath());
		}
		
		
		
		request.getRequestDispatcher("views/course/selectCourse.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
