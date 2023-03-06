package com.kh.community.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.community.model.vo.AnswerInstagram;
import com.kh.community.model.vo.InstaImage;
import com.kh.community.model.vo.Instagram;

public class CommunityDao {

	private Properties prop = new Properties();
	
	public CommunityDao() {
		try {
			prop.loadFromXML(new FileInputStream(CommunityDao.class.getResource("/db/sql/community-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Instagram> selectInstaList(Connection conn) {
		ArrayList<Instagram> list = new ArrayList<Instagram>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInstaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Instagram(rset.getString("insta_img_origin"),
									   rset.getString("insta_img_src")
									   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertAnswer(Connection conn, AnswerInstagram answer) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, answer.getAnsContent());
			pstmt.setInt(2, answer.getComNo());
			pstmt.setInt(3, Integer.parseInt(answer.getMemNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<AnswerInstagram> selectAnswerList(Connection conn, int comNo) {
		ArrayList<AnswerInstagram> list = new ArrayList<AnswerInstagram>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnswerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new AnswerInstagram(rset.getInt("ans_no"),
										     rset.getString("ans_content"),
										     rset.getString("mem_id"),
										     rset.getString("ans_date")
										     ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertInsta(Connection conn, Instagram insta) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInsta");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, insta.getComContent());
			pstmt.setString(2, insta.getInstaId());
			pstmt.setString(3, insta.getComTag());
			pstmt.setInt(4, Integer.parseInt(insta.getMemNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertInstaimg(Connection conn, InstaImage img) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInstaimg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getInstaImgOrigin());
			pstmt.setString(2, img.getInstaImgChange());
			pstmt.setString(3, img.getInstaImgSrc());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
