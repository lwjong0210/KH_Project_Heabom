package com.heabom.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
