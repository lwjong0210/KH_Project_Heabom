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

}
