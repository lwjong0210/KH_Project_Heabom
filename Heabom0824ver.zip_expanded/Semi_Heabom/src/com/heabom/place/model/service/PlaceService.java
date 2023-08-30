package com.heabom.place.model.service;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.util.ArrayList;

import static com.heabom.common.JDBCTemplate.*;

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
		public int insertPlace(Place p) {
			Connection conn = getConnection();
			int result = 0 ; 
			result = new PlaceDao().insertPlace(conn,p);
			if (result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
	
	
	
	

}
