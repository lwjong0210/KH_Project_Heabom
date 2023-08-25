package com.heabom.search.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class SearchDao {
	private Properties prop = new Properties();
	
	public SearchDao() {
		String filePath = SearchDao.class.getResource("/db/sql/search-mapper.xml").getPath();
		// 기본생성자이기 때문에 무조건 호출이 된다.
		// 호출이 되고 /db/sql/member-mapper.xml를 계속 불러온다.
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
