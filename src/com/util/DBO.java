package com.util;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.activation.DataSource; 
import java.sql.Statement; 

public class DBO {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public DBO()
	{
	}

	/**
		连接驱动
	*/
	public void open() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection("jdbc:mysql://localhost/missystemdb?useUnicode=true&characterEncoding=utf8","root","root"); 
			stmt=conn.createStatement();
			System.out.println("驱动已连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("驱动连接失败" + ex.getMessage());
		}
	}

	/**
		断开驱动
	*/
	public void close() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("驱动已断开");
		} 
		catch (SQLException ex) 
		{
			System.err.println("驱动断开失败" + ex.getMessage());
		}
	}

	/**
		执行语句的结果集
	*/
	public ResultSet executeQuery(String sql) throws SQLException
	{
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		System.out.println ("正在执行SQL语句");
		return rs;
	}

	/**
		更新后受影响的行数
	*/
	public int executeUpdate(String sql) throws SQLException
	{
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("正在执行SQL语句");
		return ret;
	}

	/**
		批量更新SQL操作
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		ִ批量更新的成败情况
	*/
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		
//		conn.commit();
		
//		conn.setAutoCommit(isAuto);
		//conn.setAutoCommit(true);
		return updateCounts;
	}
	// 获取自动提交方法的启闭状态
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	// 设置自动提交方法的启闭状态
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	// 批量提交
	public void commit() throws SQLException 
	{
		conn.commit();
//		this.close();
	}
	// 如果出现问题，回滚到更改前状态
	public void rollBack() throws SQLException 
	{
		conn.rollback();
//		this.close();
	}
	
}
