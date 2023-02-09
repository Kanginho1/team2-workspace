package com.kh.manager.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.dao.ManagerDao;
import com.kh.manager.model.vo.Manager;

public class ManagerService {
	
	public Manager loginManager(String userId, String userPwd) {
	
		Connection conn = JDBCTemplate.getConnection();
		Manager m = new ManagerDao().loginManager(conn, userId, userPwd);
		JDBCTemplate.close(conn);
		return m;
	} 
}
