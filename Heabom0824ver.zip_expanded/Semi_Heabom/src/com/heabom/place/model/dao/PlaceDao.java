package com.heabom.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.heabom.common.JDBCTemplate.*;
import com.heabom.place.model.vo.Place;

public class PlaceDao {
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String filePath = PlaceDao.class.getResource("/db/sql/place-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Place> selectPlace(Connection conn,String memNo){
		ArrayList<Place> plist = new ArrayList<Place>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlace");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				plist.add(new Place(rset.getString("PLACE_NO"),
						rset.getString("PLACE_TITLE"),
						rset.getDate("MAKE_DATE"),
						rset.getString("PLACE_CONTENT"),
						rset.getInt("VIEW_COUNT"),
						rset.getInt("STAR_POINT"),
						rset.getString("HASHTAG_NAME")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return plist;
	}
	
	public int insertPlace(Connection conn , Place p ) {
		//insert 문 이니까 result 있어야 함
		int result = 0 ; 
		PreparedStatement pstmt = null ;
		String sql = prop.getProperty("");
	}
	
	
}
