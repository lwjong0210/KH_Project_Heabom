package com.heabom.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PlaceDao {
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String filePath = PlaceDao.class.getResource("/db/sql/place-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
