package com.heabom.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
