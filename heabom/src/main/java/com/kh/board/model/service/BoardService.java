package main.java.com.kh.board.model.service;

import static main.java.com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import main.java.com.kh.board.model.dao.BoardDao;

public class BoardService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
	}
}
