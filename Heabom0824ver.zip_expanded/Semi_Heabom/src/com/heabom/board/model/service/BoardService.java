package com.heabom.board.model.service;

import static com.heabom.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.board.model.dao.BoardDao;
import com.heabom.board.model.vo.Board;
import com.heabom.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		
		System.out.println("여기까지오나");
		System.out.println(pi.getBoardLimit());
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		return list;
	}
	
//	public int countReply(String boardNo) {
//		Connection conn = getConnection();
//		
//		int countReply = new BoardDao().countReply(conn, boardNo);
//		close(conn);
//		return countReply;
//		
//	}
}
