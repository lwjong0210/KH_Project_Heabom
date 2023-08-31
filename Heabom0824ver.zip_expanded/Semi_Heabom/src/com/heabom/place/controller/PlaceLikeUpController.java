package com.heabom.place.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heabom.place.model.service.PlaceService;

/**
 * Servlet implementation class PlaceLikeUpController
 */
@WebServlet("/likeup.pl")
public class PlaceLikeUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceLikeUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pNo = request.getParameter("input");
//		System.out.println(pNo);
//		System.out.println("?뭐여");
		int result = new PlaceService().likeUp(pNo);
		int likeCount = new PlaceService().likeCount();
		String responseData = "좋아요" ;
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
