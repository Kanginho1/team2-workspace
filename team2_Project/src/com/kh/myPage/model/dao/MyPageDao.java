package com.kh.myPage.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Instagram;
import com.kh.community.model.vo.Instagram2;
import com.kh.community.model.vo.Like;
import com.kh.member.model.dao.MemberDao;
import com.kh.myPage.model.vo.Follow;
import com.kh.myPage.model.vo.MileageHistory;
import com.kh.payment.model.vo.OrderDtlA;

public class MyPageDao {

	private Properties prop = new Properties();

	public MyPageDao() {
		String filePath = MemberDao.class.getResource("/db/sql/myPage-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectFollowerCount(Connection conn, int memNo) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowerCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public int selectFollowingCount(Connection conn, int memNo) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowingCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<Follow> selectFollowerList(Connection conn, PageInfo pi, int memNo) {

		ArrayList<Follow> list = new ArrayList<Follow>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowerList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Follow(rset.getInt("mem_no"), rset.getString("login_id"), rset.getString("followers")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public ArrayList<Follow> selectFollowingList(Connection conn, PageInfo pi, int memNo) {
		// System.out.println("selectFollowingList dao 탐");

		ArrayList<Follow> list = new ArrayList<Follow>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowingList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Follow(rset.getInt("mem_no"), rset.getString("login_id"), rset.getString("following")));
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

	public int deleteFollower(Connection conn, int memNo, String followerId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteFollower");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followerId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteFollowing(Connection conn, int memNo, String followingId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFollowing");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followingId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int cancelDeleteFollowing(Connection conn, int memNo, String followingId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("cancelDeleteFollowing");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followingId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectMileageCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMileageCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<MileageHistory> selectMileageHistory(Connection conn, PageInfo pi, int memNo) {
		ArrayList<MileageHistory> list = new ArrayList<MileageHistory>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMileageHistory");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new MileageHistory(rset.getInt("mileage_no"), rset.getString("mileage_history"),
						rset.getInt("mileage"), rset.getString("product_name"), rset.getInt("mem_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	

	public int selectLikeCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectLikeCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}
	

	public ArrayList<Instagram2> selectLikeList(Connection conn, PageInfo pi, int memNo) {
		ArrayList<Instagram2> list = new ArrayList<Instagram2>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectLikeList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Instagram2(rset.getInt("com_no"), rset.getString("insta_id"),
						rset.getString("insta_img_src")));
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

	public int deleteLike(Connection conn, int memNo, int comNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, comNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int insertLike(Connection conn, int memNo, int comNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, comNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int selectOrderHistoryCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOrderHistoryCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<OrderDtlA> selectOrderHistoryList(Connection conn, PageInfo pi, int memNo) {
		ArrayList<OrderDtlA> list = new ArrayList<OrderDtlA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOrderHistoryList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new OrderDtlA(rset.getString("file_path")
						, rset.getString("change_name")
						, rset.getInt("order_no")
						, rset.getInt("dtl_order_no")
						, rset.getString("product_name")
						, rset.getString("dtl_size")
						, rset.getInt("dtl_qnt")
						, rset.getString("order_status")));
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

	public int cancelOrder(Connection conn, int orderNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("cancelOrder");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectOrderHistoryCancelCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOrderHistoryCancelCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<OrderDtlA> selectOrderHistoryCancelList(Connection conn, PageInfo pi, int memNo) {
		ArrayList<OrderDtlA> list = new ArrayList<OrderDtlA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOrderHistoryCancelList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new OrderDtlA(rset.getString("file_path")
						, rset.getString("change_name")
						, rset.getInt("order_no")
						, rset.getInt("dtl_order_no")
						, rset.getString("product_name")
						, rset.getString("dtl_size")
						, rset.getInt("dtl_qnt")
						, rset.getString("order_status")));
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

	public ArrayList<OrderDtlA> selectOrderHistoryDetail(Connection conn, int orderNo) {
		ArrayList<OrderDtlA> list = new ArrayList<OrderDtlA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOrderHistoryDetail");

		try {
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new OrderDtlA(rset.getString("file_path")
						, rset.getString("change_name")
						, rset.getInt("order_no")
						, rset.getInt("dtl_order_no")
						, rset.getDate("order_date")
						, rset.getString("rcp_name")
						, rset.getString("rcp_phone")
						, rset.getString("rcp_address")
						, rset.getString("rcp_address_dtl")
						, rset.getString("rcp_post_code")
						, rset.getString("product_name")
						, rset.getString("dtl_size")
						, rset.getInt("dtl_qnt")
						, rset.getString("order_status")));
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

	public int insertReturn(Connection conn, String returnStatus, String returnReason, int memNo, int dtlOrderNo) {
			System.out.println(returnStatus);
			System.out.println(returnReason);
			System.out.println(memNo);
			System.out.println(dtlOrderNo);
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReturn");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, returnStatus);
			pstmt.setString(2, returnReason);
			pstmt.setInt(3, memNo);
			pstmt.setInt(4, dtlOrderNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int returnOrder(Connection conn, int dtlOrderNo) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("returnOrder");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dtlOrderNo);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int exchangeOrder(Connection conn, int dtlOrderNo) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("exchangeOrder");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dtlOrderNo);
		
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
