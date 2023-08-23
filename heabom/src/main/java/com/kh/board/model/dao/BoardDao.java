package main.java.com.kh.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		prop.loadFromXML(null);
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty(null)
	}

}
