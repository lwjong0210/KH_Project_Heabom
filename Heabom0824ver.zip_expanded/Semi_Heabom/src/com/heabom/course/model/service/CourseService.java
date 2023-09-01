package com.heabom.course.model.service;

import static com.heabom.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.course.model.dao.CourseDao;
import com.heabom.course.model.vo.Course;
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
	 * 조준하
	 * 코스리스트 조회를 위한 장소선택함수
	 * @return
	 */
	public ArrayList<Place> selectCoursePlaceList(ArrayList<String> courseList){
		Connection conn = getConnection();
		ArrayList<Place> coursePlaceList = new CourseDao().selectCoursePlaceList(conn, courseList);
		close(conn);
		return coursePlaceList;
	}
	

	public ArrayList<Course> selectCourse(String memNo){
		Connection conn = getConnection();
		ArrayList<Course> clist = new CourseDao().selectCourse(conn, memNo);
		close(conn);
		return clist;
	}

	
	/**
	 * 조준하
	 * 코스값 1개 저장
	 * @return
	 */
	public int saveCourse1(String writer , String pl1 , int time , int money ) {
		Connection conn = getConnection();
		int result = new CourseDao().saveCourse1(writer , conn, pl1 ,time,money);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result; 
	}
	
	/**
	 * 조준하
	 * 코스값2개저장
	 * @return
	 */
	public int saveCourse2(String writer ,String pl1 , String pl2 , int time , int money) {
		Connection conn = getConnection();
		int result = new CourseDao().saveCourse2(writer ,conn, pl1 ,pl2,time,money );
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result; 
		
	}
	
	
	/**
	 * 조준하
	 * 코스값3개 저장
	 * @return
	 */
	public int saveCourse3(String writer ,String pl1 , String pl2 , String pl3 , int time , int money) {
		Connection conn = getConnection();
		int result = new CourseDao().saveCourse3(writer,conn,pl1,pl2,pl3,time,money);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result; 
>>>>>>> 96ead0874fcad7aa9055566bfbf8de9b287499c1
		
	}
	
}
