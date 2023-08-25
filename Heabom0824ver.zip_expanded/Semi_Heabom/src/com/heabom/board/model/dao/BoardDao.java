package com.heabom.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		// 기본생성자이기 때문에 무조건 호출이 된다.
		// 호출이 되고 /db/sql/member-mapper.xml를 계속 불러온다.
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
