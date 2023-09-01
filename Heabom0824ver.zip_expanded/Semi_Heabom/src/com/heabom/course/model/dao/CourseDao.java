package com.heabom.course.model.dao;

import static com.heabom.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.heabom.place.model.vo.Place;
import com.heabom.search.model.dao.SearchDao;

public class CourseDao {
	private Properties prop = new Properties();
	public CourseDao() {
		String filePath = SearchDao.class.getResource("/db/sql/course-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 조준하
	 * 코스짜는곳에서 보여줄 place list 조회
	 * @param conn
	 * @param lNo
	 * @param cNo
	 * @return
	 */
	public ArrayList<Place> selectCourse(Connection conn , int lNo , int cNo){
		ArrayList<Place> list = new ArrayList<Place>();
		
		ResultSet rset = null ;
		PreparedStatement pstmt = null ;
		
		String sql = prop.getProperty("selectCourse");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lNo);
			pstmt.setInt(2, cNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Place p = new Place();
				p.setPlaceNo(rset.getString("PLACE_NO"));
				p.setPlaceTitle(rset.getString("PLACE_TITLE"));
				p.setCategoryNo(rset.getInt("CATEGORY_NO"));
				p.setWriter(rset.getString("WRITER"));
				p.setLocationNo(rset.getInt("LOCATION_NO"));
				p.setMakeDate(rset.getDate("MAKE_DATE"));
				p.setStatus(rset.getString("STATUS"));
				p.setPhone(rset.getString("PHONE"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setPlaceContent(rset.getString("PLACE_CONTENT"));
				p.setStartTime(rset.getInt("START_TIME"));
				p.setEndTime(rset.getInt("END_TIME"));
				p.setStarPoint(rset.getInt("STAR_POINT"));
				p.setPlaceUrl(rset.getString("PLACE_URL"));
				p.setViewCount(rset.getInt("VIEW_COUNT"));
				p.setUseTime(rset.getInt("USE_TIME"));
				p.setUsePrice(rset.getInt("USE_PRICE"));
				p.setBestStatus(rset.getString("BEST_STATUS"));
				p.setTitleImg(rset.getString("TITLEIMG"));
				p.setLikeCount(rset.getInt("LIKECOUNT"));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list ;
	}

}
