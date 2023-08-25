package com.heabom.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.heabom.common.JDBCTemplate.*;
import com.heabom.member.model.vo.Member;

public class MemberService {

	public ArrayList<Member> selectAdminList() {
		
		Connection conn = /*JDBCTemplate.*/getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAdminList(conn);
		
		close(conn);
		return list;
		
	}
	
}
