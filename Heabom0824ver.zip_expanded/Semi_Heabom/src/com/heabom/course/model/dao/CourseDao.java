package com.heabom.course.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.heabom.search.model.dao.SearchDao;

public class CourseDao {
	private Properties prop = new Properties();
	public CourseDao() {
		String filePath = SearchDao.class.getResource("/db/sql/course-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
