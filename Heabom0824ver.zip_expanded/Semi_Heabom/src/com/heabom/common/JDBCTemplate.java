package com.heabom.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	
	public static Connection getConnection() {
		
		Connection conn = null;
		Properties prop = new Properties();
		
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		try {
			prop.load(new FileInputStream(filePath));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		try {
			Class.forName(prop.getProperty("driver")); // ����
			
			conn = DriverManager.getConnection(prop.getProperty("url"),      // ����
											   prop.getProperty("username"), // ����
											   prop.getProperty("password"));// ����
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// 2-1. Connection ��ü ���޹޾Ƽ� commit �����ִ� commit �޼ҵ�
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 2-2. 	"	   ��ü�� ���޹޾Ƽ� rollback �����ִ� rollback �޼ҵ�
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3-1.     "      ��ü�� ���޹޾Ƽ� �ݳ������ִ� close �޼ҵ�
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3-2. Statement  ��ü�� ���޹޾Ƽ� �ݳ������ִ� close �޼ҵ�
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3-3. ResultSet  ��ü�� ���޹޾Ƽ� �ݳ������ִ� close �޼ҵ�
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}

























