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

import com.heabom.common.model.vo.File;
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
		String sql = prop.getProperty("insertPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p.getPlaceTitle());
			pstmt.setInt(2, p.getCategoryNo());
			pstmt.setString(3, p.getWriter());
			pstmt.setInt(4, p.getLocationNo());
			pstmt.setString(5, p.getPhone());
			pstmt.setString(6, p.getAddress());
			pstmt.setString(7, p.getPlaceContent());
			pstmt.setInt(8, p.getStartTime());
			pstmt.setInt(9, p.getEndTime());
			pstmt.setInt(10, p.getStarPoint());
			pstmt.setString(11, p.getPlaceUrl());
			pstmt.setInt(12, p.getUseTime());
			pstmt.setInt(13, p.getUsePrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result ; 
	}
	
	/**
	 * 조준하
	 * 장소 사진 리스트 tb_file 에 저장
	 * @param conn
	 * @param list
	 * @return
	 */
	public int insertFileList(Connection conn , ArrayList<File> list) {
		//insert 문
		int result = 0 ;
		PreparedStatement pstmt = null ;
		String sql = prop.getProperty("insertFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i = 0 ; i< list.size() ; i ++) {
				pstmt.setString(1, list.get(i).getOriginName());
				pstmt.setString(2, list.get(i).getChangeName());
				pstmt.setString(3, list.get(i).getFilePath());
				pstmt.setInt(4, list.get(i).getFileLevel());
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result ; 
		
	}
	
	
}
