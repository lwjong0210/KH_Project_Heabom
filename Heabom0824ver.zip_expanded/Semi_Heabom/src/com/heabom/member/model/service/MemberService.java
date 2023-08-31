package com.heabom.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.heabom.common.JDBCTemplate.*;

import com.heabom.common.model.vo.PageInfo;
import com.heabom.member.model.dao.MemberDao;
import com.heabom.member.model.vo.Member;
import com.heabom.member.model.vo.MemberAttachment;

public class MemberService {

	public ArrayList<Member> selectAdminList() {
		
		Connection conn = /*JDBCTemplate.*/getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAdminList(conn);
		
		close(conn);
		return list;
		
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
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
	
	public Member updatePwd(String userId,String userPwd,String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, userId, userPwd, updatePwd);
		
		Member updateMem = null;
		
		if(result >0) {
			commit(conn);
			
			// 커밋으로 변경된 비밀번호를 확정해 주고 조회를 해와야 한다.
			updateMem = new MemberDao().selectMember(conn, userId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}
	
	public int myDetailUpdate(MemberAttachment at , Member m) {
		System.out.println("여기는 서비스");
		System.out.println(at.getFileNo());
		Connection conn = getConnection();
		int result1 = new MemberDao().myDetailUpdate(conn, m);
		int result2 = 1;
		
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = new MemberDao().updateAttachment(conn, at, m);
			}else {
				result2 = new MemberDao().insertMemberDetailAttachment(conn, at, m);
			}
		}
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
}
