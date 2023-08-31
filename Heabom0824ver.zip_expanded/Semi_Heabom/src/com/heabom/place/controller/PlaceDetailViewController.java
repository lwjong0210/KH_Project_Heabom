package com.heabom.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.heabom.common.model.vo.File;
import com.heabom.place.model.service.PlaceService;
import com.heabom.place.model.vo.Place;

/**
 * Servlet implementation class PlaceDetailViewController
 */
@WebServlet("/placeDetailView.pl")
public class PlaceDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("안뇽");
		HttpSession session = request.getSession();
		ArrayList<Place> list = (ArrayList<Place>)session.getAttribute("placeSearchList");
		int index = Integer.parseInt(request.getParameter("index"));
//		System.out.println(list.get(0));
//		System.out.println(index);
		Place p = list.get(index); 
		ArrayList<File> fileList = new PlaceService()
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
