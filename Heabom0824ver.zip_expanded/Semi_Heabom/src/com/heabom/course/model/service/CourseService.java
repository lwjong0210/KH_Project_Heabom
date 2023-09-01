package com.heabom.course.model.service;

import static com.heabom.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.course.model.dao.CourseDao;
import com.heabom.place.model.vo.Place;

public class CourseService {
	public ArrayList<Place> selectCourse(int lNo , int cNo){
		Connection conn = getConnection();
		ArrayList<Place> list = new CourseDao().selectCourse(conn , lNo , cNo);
		close(conn);
		return list ; 
	}
	
}
