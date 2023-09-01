package com.heabom.course.model.service;

import static com.heabom.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.course.model.dao.CourseDao;
import com.heabom.place.model.vo.Place;

public class CourseService {
	
	/**
	 * 코스 장소검색 과 그 조건 검색
	 * 조준하
	 * @param lNo
	 * @param cNo
	 * @return
	 */
	public ArrayList<Place> selectCourse(int lNo , int cNo){
		Connection conn = getConnection();
		ArrayList<Place> list = new CourseDao().selectCourse(conn , lNo , cNo);
		close(conn);
		return list ; 
	}
	
	
	
	/**
	 * 코스리스트 조회를 위한 장소선택함수
	 * @return
	 */
	public ArrayList<Place> selectCoursePlaceList(ArrayList<String> courseList){
		Connection conn = getConnection();
		ArrayList<Place> coursePlaceList = new CourseDao().selectCoursePlaceList(conn, courseList);
		close(conn);
		return coursePlaceList;
	}
	
}
