package com.heabom.place.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heabom.place.model.service.PlaceService;
import com.heabom.place.model.vo.Place;

/**
 * Servlet implementation class PlaceInsertController
 */
@WebServlet("/insert.pl")
public class PlaceInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String placeTitle = request.getParameter("placeTitle");
			
			int categoryNo = 0 ; 
			String category = request.getParameter("category");
			if(category.equals("호프")) {
				categoryNo = 1 ;
			}else if (category.equals("카페")) {
				categoryNo = 2 ; 
			}else {
				categoryNo = 3 ; 
			}
			
			int locationNo = 0 ;
			String location = request.getParameter("location");
			
			switch (location) {
			case "강남구" : 
				locationNo = 1 ; 
				break;
			case "서초구" : 
				locationNo = 2 ; 
				break;
			case "동작구" : 
				locationNo = 3 ; 
				break;
			case "강서구" : 
				locationNo = 4 ; 
				break;
			case "양천구" : 
				locationNo = 5 ; 
				break;
			case "구로구" : 
				locationNo = 6 ; 
				break;
			case "금천구" : 
				locationNo = 7 ; 
				break;
			case "관악구" : 
				locationNo = 8 ; 
				break;
			case "영등포구" : 
				locationNo = 9 ; 
			case "송파구" : 
				locationNo = 10 ; 
				break;
			case "강동구" : 
				locationNo = 11 ; 
				break;
			case "광진구" : 
				locationNo = 12 ; 
				break;
			case "성동구" : 
				locationNo = 13 ; 
				break;
			case "용산구" : 
				locationNo = 14 ; 
				break;
			case "마포구" : 
				locationNo = 15 ; 
			case "서대문구" : 
				locationNo = 16 ; 
				break;
			case "중구" : 
				locationNo = 17 ; 
				break;
			case "동대문구" : 
				locationNo = 18 ; 
				break;
			case "중랑구" : 
				locationNo = 19 ; 
				break;
			case "종로구" : 
				locationNo = 20 ; 
				break;
			case "성북구" : 
				locationNo = 21 ; 
				break;
			case "은평구" : 
				locationNo = 22 ; 
				break;
			case "강북구" : 
				locationNo = 23 ; 
				break;
			case "도봉구" : 
				locationNo = 24 ; 
				break;
			case "노원구" : 
				locationNo = 25 ; 
				break;
			}
			
			
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String placeContent = request.getParameter("content");
			int startTime = Integer.parseInt(request.getParameter("startTime"));
			int endTime = Integer.parseInt(request.getParameter("endTime"));
			int starPoint =  Integer.parseInt(request.getParameter("starPoint"));
			String placeUrl = request.getParameter("placeUrl");
			int useTime =  Integer.parseInt(request.getParameter("useTime"));
			int usePrice =  Integer.parseInt(request.getParameter("usePrice"));
			
			Place p = new Place();
			
			p.setPlaceTitle(placeTitle);
			p.setCategoryNo(categoryNo);
			p.setLocationNo(locationNo);
			p.setPhone(phone);
			p.setAddress(address);
			p.setPlaceContent(placeContent);
			p.setStarPoint(starPoint);
			p.setStartTime(startTime);
			p.setEndTime(endTime);
			p.setStarPoint(starPoint);
			p.setPlaceUrl(placeUrl);
			p.setUseTime(useTime);
			p.setUsePrice(usePrice);
			
			System.out.println(p);
			
			int result = new PlaceService().insertPlace(p);
			
			
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
