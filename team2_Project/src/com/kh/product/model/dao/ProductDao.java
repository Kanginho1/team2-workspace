package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> categorySearch(Connection conn, String categoryName){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categorySearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> categorySort(Connection conn,String categoryName,int value){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		switch(value) {
		case 1 : sql = prop.getProperty("categoryViewSearch"); break;
		case 2 : sql = prop.getProperty("categoryRowPrice"); break;
		case 3 : sql = prop.getProperty("categoryHighPrice"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<Product> productSearch(Connection conn,String product){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productSearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product);
			pstmt.setString(2, product);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> productSort(Connection conn,String product, int value){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		switch(value) {
		case 1 : sql = prop.getProperty("productViewSearch"); break;
		case 2 : sql = prop.getProperty("productRowPrice"); break;
		case 3 : sql = prop.getProperty("productHighPrice"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product);
			pstmt.setString(2, product);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
