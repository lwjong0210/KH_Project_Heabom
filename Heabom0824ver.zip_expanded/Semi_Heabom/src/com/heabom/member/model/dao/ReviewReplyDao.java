package com.heabom.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.heabom.common.JDBCTemplate.*;
import com.heabom.member.model.vo.ReviewReply;

public class ReviewReplyDao {
	private Properties prop = new Properties();
	
	public ReviewReplyDao() {
		String filePath = ReviewReplyDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReviewReply> selectReviewReply(Connection conn,String memNo) {
		ArrayList<ReviewReply> relist = new ArrayList<ReviewReply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				relist.add(new ReviewReply(rset.getString("RE_NO")
						                  ,rset.getString("RE_REF_NO")
						                  ,rset.getString("RE_WRITER")
						                  ,rset.getString("RE_CONTENT")
						                  ,rset.getInt("RE_LIKE_STAR")
						                  ,rset.getDate("RE_DATE")
						                  ,rset.getString("RE_LEVEL")
						                  ,rset.getString("NICKNAME")
						                  ));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return relist;
	}
}
