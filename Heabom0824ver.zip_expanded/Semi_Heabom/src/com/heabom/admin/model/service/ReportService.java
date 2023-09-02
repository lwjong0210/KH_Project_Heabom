package com.heabom.admin.model.service;

import static com.heabom.common.JDBCTemplate.close;
import static com.heabom.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.admin.model.dao.ReportDao;
import com.heabom.admin.model.vo.Report;
import com.heabom.common.model.vo.PageInfo;


public class ReportService {

	public int selectReportListCount() {
	      
	      Connection conn = getConnection();
	      
	      int listCount = new ReportDao().selectReportListCount(conn);
	      
	      close(conn);
	      return listCount;
	   }
 
 
	public ArrayList<Report> selectReportList(PageInfo pi) {
	   
	      System.out.println(pi.getBoardLimit());
	      Connection conn = /*JDBCTemplate.*/getConnection();
	      
	      ArrayList<Report> list = new ReportDao().selectReportList(conn, pi);
	      
	      close(conn);
	      return list;
	      
	   }
	
}
