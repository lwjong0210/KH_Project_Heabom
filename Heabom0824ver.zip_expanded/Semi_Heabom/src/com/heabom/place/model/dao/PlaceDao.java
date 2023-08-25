package com.heabom.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PlaceDao {
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String filePath = PlaceDao.class.getResource("/db/sql/place-mapper.xml").getPath();
		// 기본생성자이기 때문에 무조건 호출이 된다.
		// 호출이 되고 /db/sql/member-mapper.xml를 계속 불러온다.
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
