package com.heabom.place.model.service;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.util.ArrayList;

import static com.heabom.common.JDBCTemplate.*;

import com.heabom.common.model.vo.File;
import com.heabom.place.model.dao.PlaceDao;
import com.heabom.place.model.vo.Place;

	public class PlaceService {
		
		
		public ArrayList<Place> selectPlace(String memNo){
			Connection conn = getConnection();
			ArrayList<Place> plist = new PlaceDao().selectPlace(conn, memNo);
			close(conn);
			return plist;
		}
		
		
		
		/**
		 * 조준하
		 * 장소삽입
		 * @param p
		 * @return
		 */
		public int insertPlace(Place p , ArrayList<File> list ) {
			Connection conn = getConnection();
			int result1 = 0 ; 
			result1 = new PlaceDao().insertPlace(conn,p);
			int result2= new PlaceDao().insertFileList(conn, list);
			
			
			if (result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result1*result2 ;
			
		}
		
		/**
		 * 조준하
		 * 장소에 따른 장소리스트 조회
		 * @param lNo
		 * @return
		 */
		public ArrayList<Place> selectPlaceList(int lNo){
			Connection conn = getConnection();
			ArrayList<Place> list = new PlaceDao().selectPlaceList(conn, lNo);
			close(conn);
			return list ;
		}
		
		
		/**
		 * 조준하
		 * 장소 detailview 에 표시할 사진들을 우루루 가져올꺼임
		 * @return
		 */
		public ArrayList<File> selectFileList(String pNo){
			Connection conn = getConnection();
			ArrayList<File> fileList = new PlaceDao().selectFileList(conn , pNo);
			close(conn);
			return fileList ;
			
		}
		
		/**
		 * 좋아요 수 증가
		 * @param pNo
		 * @return
		 */
		public int likeUp(String pNo) {
			Connection conn = getConnection();
			int result = new PlaceDao().likeUp(conn, pNo);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result ;
		}
		
		/**
		 * 좋아요수 가져오기
		 * @return
		 */
		public int likeCount() {
			Connection conn = getConnection();
			int result = new PlaceDao().likeCount();
			close(conn);
			return result ;
		}
	
	
	
	

}
