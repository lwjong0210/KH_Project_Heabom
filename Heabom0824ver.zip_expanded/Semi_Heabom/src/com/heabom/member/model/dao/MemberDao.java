package com.heabom.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.heabom.common.JDBCTemplate.*;

import com.heabom.common.model.vo.PageInfo;
import com.heabom.member.model.vo.Member;
import com.heabom.member.model.vo.MemberAttachment;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Member> selectAdminList(Connection conn) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminList");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("mem_no"),
									rset.getString("mem_id"),
									rset.getString("mem_name"),
									rset.getString("nickname"),
									rset.getString("grade"),
									rset.getInt("mem_point"),
									rset.getDate("mem_visit"),
									rset.getString("email")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMemPoint());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	public int insertMember(Connection conn , Member m) {
		int result =0; 
		PreparedStatement pstmt = null ; 
		String sql = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getMbit());
			pstmt.setString(7, m.getMemPhone());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result ; 
		
	}
	
	public Member loginMember(Connection conn , String memId , String memPwd) {
		ResultSet rset = null ;
		PreparedStatement pstmt = null;
		Member m = null ;
		
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				 m  = new Member(rset.getString("MEM_NO")
						  ,rset.getString("GRADE")
						  ,rset.getString("MEM_ID")
						  ,rset.getString("MEM_PWD")
						  ,rset.getString("MEM_NAME")
						  ,rset.getString("NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("MBTI")
						  ,rset.getString("MEM_PHONE")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getString("MEM_STATUS")
						  ,rset.getDate("MEM_VISIT")
						  ,rset.getString("MEM_BIRTHDAY")
						  ,rset.getInt("MEM_POINT"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return m ;
	}
	
	
	/**
	 * 프사 첨부 
	 * 조준하
	 * @return
	 */
	public int insertAttachment(Connection conn , MemberAttachment at) {
		int result = 0 ; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result ; 
	}
	
	public int insertMemberDetailAttachment(Connection conn , MemberAttachment at, Member m) {
		int result = 0 ; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, m.getMemNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result ; 
	}
	
	public int updatePwd(Connection conn,String userId,String userPwd,String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				 m  = new Member(rset.getString("MEM_NO")
						  ,rset.getString("GRADE")
						  ,rset.getString("MEM_ID")
						  ,rset.getString("MEM_PWD")
						  ,rset.getString("MEM_NAME")
						  ,rset.getString("NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("MBTI")
						  ,rset.getString("MEM_PHONE")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getString("MEM_STATUS")
						  ,rset.getDate("MEM_VISIT")
						  ,rset.getString("MEM_BIRTHDAY")
						  ,rset.getInt("MEM_POINT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int myDetailUpdate(Connection conn,Member m) {
		System.out.println("여기는Dao");
		System.out.println(m.getNickname());
		System.out.println(m.getEmail());
		System.out.println(m.getMbit());
		System.out.println(m.getMemPhone());
		System.out.println(m.getMemBirthday());
		System.out.println(m.getMemId());
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myDetailUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getMbit());
			pstmt.setString(4, m.getMemPhone());
			pstmt.setString(5, m.getMemBirthday());
			pstmt.setString(6, m.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateAttachment(Connection conn,MemberAttachment at, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, m.getMemNo());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}










