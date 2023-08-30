package com.heabom.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.heabom.common.JDBCTemplate.*;

import com.heabom.common.model.vo.PageInfo;
import com.heabom.member.model.dao.MemberDao;
import com.heabom.member.model.vo.Member;
import com.heabom.member.model.vo.MemberAttachment;

public class MemberService {

	public ArrayList<Member> selectAdminList(PageInfo pi) {
		
		Connection conn = /*JDBCTemplate.*/getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAdminList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	
	/**
	 * 조준하
	 *회원가입
	 */
	public int insertMember(MemberAttachment at , Member m) {
		Connection conn = getConnection();
		int result1 = new MemberDao().insertMember(conn , m);
		
	
		int result2 = 1; 
		
		if (at != null) {
			result2 = new MemberDao().insertAttachment(conn, at);
		}
		System.out.println("여긴 service");
		System.out.println(result1 + " "  +result2 );
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("controller 로 가는 리턴값 : " + (result1 * result2));
		return result1*result2 ; 
		
		
	}
	
	/**
	 * 로그인 조준하
	 */
	public Member loginMember(String memId , String memPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, memId, memPwd);
		close(conn);
		return m; 
	}
}
