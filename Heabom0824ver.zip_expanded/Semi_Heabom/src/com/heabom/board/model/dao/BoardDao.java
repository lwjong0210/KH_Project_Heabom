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

import javax.naming.spi.DirStateFactory.Result;

import com.heabom.board.model.vo.Board;
import com.heabom.board.model.vo.Reply;
import com.heabom.common.model.vo.File;
import com.heabom.common.model.vo.HashTag;
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
	public int selectKeyWordCount(Connection conn, String keyWord) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeyWordCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + keyWord + '%');
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
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		// 1페이지 일때 0 부터, 2페이지 일때 11 부터
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
		
		// 1 페이지 일때 9까지 2페이지 일때 19 까지
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				Board b = new Board();
//				b.setBoardNo(rset.getString("board_no"));
				list.add(new Board(rset.getString("board_no")
								 , rset.getString("board_title")
								 , rset.getString("mem_id")
								 , rset.getInt("board_count")
								 , rset.getString("create_date")
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
	public ArrayList<Board> selectList(Connection conn, PageInfo pi, String keyWord){
		
		System.out.println(pi.getBoardLimit());
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeyWord");
		
		// 1페이지 일때 0 부터, 2페이지 일때 11 부터
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
		
		// 1 페이지 일때 9까지 2페이지 일때 19 까지
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + keyWord + '%');
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				Board b = new Board();
//				b.setBoardNo(rset.getString("board_no"));
				list.add(new Board(rset.getString("board_no")
						, rset.getString("board_title")
						, rset.getString("mem_id")
						, rset.getInt("board_count")
						, rset.getString("create_date")
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
	
	public int insertBoard(Connection conn, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
//			b.getBoardNo().substring(0, 1);
//			if(b.getBoardCategory().equals("F")) {
			if(b.getBoardNo().equals("F")) {
				pstmt.setString(1, "F");
				
			}else {
				pstmt.setString(1, "N");
				
			}
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getWriter());
			pstmt.setString(4, b.getBoardContent());
//			pstmt.setString(5, b.getBoardCategory());
			pstmt.setString(5, b.getBoardup());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertAttachment(Connection conn, ArrayList<File> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			for(File f:list) {
				System.out.println(f+"제발제발제발");
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, f.getOriginName());
				pstmt.setString(2, f.getChangeName());
				pstmt.setString(3, f.getFilePath());
				
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}
	
	public String returnBoardNo(Connection conn) {
		
		PreparedStatement pstmt = null;
		String boardNo = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("returnBoardNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			System.out.println(rset);
			if(rset.next()) {
				boardNo = rset.getString("board_no");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return boardNo;
		
	}
	
	public int insertHash(Connection conn, HashTag ht) {
		
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql = prop.getProperty("insertHash");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ht.getCategoryNo());
			pstmt.setString(2, ht.getHashTagName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int increaseCount(Connection conn, String bno) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Board selectBoard(Connection conn, String bno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(bno+"Zzzzzzzzzzzzzzzzzzzzzz");
		String sql = prop.getProperty("selectBoard");
		
		Board b = new Board();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b.setBoardNo(rset.getString("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setWriter(rset.getString("mem_id"));
				b.setBoardContent(rset.getString("board_content"));
				b.setBoardCount(rset.getInt("board_count"));
				b.setCreateDate(rset.getString("create_date"));
				b.setHashTagName(rset.getString("hashtag_name"));
				b.setCountReply(rset.getInt("count"));
				
			}
			System.out.println(b + "진짜어이가없네");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	public ArrayList<File> selectFileList(Connection conn, String bno) {
		
		ArrayList<File> list = new ArrayList<File>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				File f = new File();
				f.setChangeName(rset.getString("change_name"));
				f.setFilePath(rset.getString("file_path"));
				list.add(f);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Reply> selectReplyList(Connection conn, String boardNo){
		
		ArrayList<Reply> rlist = new ArrayList<Reply>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				rlist.add(new Reply(
									rset.getString("RE_NO")
								  , rset.getString("RE_WRITER")
								  , rset.getString("RE_REF_NO")
								  , rset.getString("RE_CONTENT")
								  , rset.getInt("RE_LIKE_STAR")
								  , rset.getString("RE_DATE")
								  , rset.getString("RE_STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
		
		
		
		
		
		
		
		
		
		
	}

}
