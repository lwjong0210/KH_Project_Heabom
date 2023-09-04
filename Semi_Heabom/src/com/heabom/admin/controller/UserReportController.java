package com.heabom.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heabom.admin.model.vo.Report;

/**
 * Servlet implementation class UserReportController
 */
@WebServlet("/insert1.rp")
public class UserReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reporter = request.getParameter("reporter");
		String reported = request.getParameter("reporter");
		String reportType = request.getParameter("reportType");
		String reportContent = request.getParameter("reportContent");
		
		Report re = new Report();
		re.setReporter(reporter);
		re.setReported(reported);
		re.setReCategory(reportType);
		re.setReContent(reportContent);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
