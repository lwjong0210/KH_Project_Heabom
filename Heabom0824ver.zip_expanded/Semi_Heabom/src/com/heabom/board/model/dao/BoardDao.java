package com.heabom.board.model.dao;

import static com.heabom.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.heabom.board.model.vo.Board;
import com.heabom.common.model.vo.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi){
		
		System.out.println("여기는??????");
		System.out.println(pi.getBoardLimit());
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(pi.getPageLimit()+"bbbbbbb");
		// 1페이지 일때 0 부터, 2페이지 일때 11 부터
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
		
		// 1 페이지 일때 9까지 2페이지 일때 19 까지
		System.out.println(pi.getBoardLimit()+"!!!!!!!!!!!!!!!!!!!!!");
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			System.out.println(endRow +"마지막 글");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				Board b = new Board();
//				b.setBoardNo(rset.getString("board_no"));
				list.add(new Board(rset.getString("board_no")
								 , rset.getString("board_title")
								 , rset.getString("mem_id")
								 , rset.getInt("board_count")
								 , rset.getString("create_date")
								 , rset.getString("board_category")
								 , rset.getInt("count")
								 ));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
//	public int countReply(Connection conn, String boardNo) {
//		
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int countReply = 0;
//		
//		String sql = prop.getProperty("countReply");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, boardNo);
//			
//			rset=pstmt.executeQuery();
//			
//			if(rset.next()) {
//				countReply = rset.getInt("count");
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return countReply;
//	}

}
