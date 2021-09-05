package model.message;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {

//===================================================================================================================
	public ArrayList<MessageVO> searchDBList(String condition, String content) {
		Connection conn = JDBC.connect();
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from message where " + condition + " like '" + content + "%' order by mnum desc";

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setContent(rs.getString("content"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				datas.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("searchDBList()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}

//===================================================================================================================
	public ArrayList<MessageVO> getDBList() {
		Connection conn = JDBC.connect();
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from message order by mnum desc"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setContent(rs.getString("content"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				datas.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBList()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}

//===================================================================================================================
	public MessageVO getDBData(MessageVO vo) {
		Connection conn = JDBC.connect();
		MessageVO data = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from message where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MessageVO();
				data.setContent(rs.getString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWriter(rs.getString("writer"));
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
	}
//===================================================================================================================

	public boolean insertDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_INSERT = "INSERT INTO message VALUES ((SELECT NVL(MAX(mNum),0)+1 FROM message),?,?,?)";
			pstmt = conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

//===================================================================================================================
	public boolean deleteDB(MessageVO vo) {

		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from MESSAGE where mnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("deleteDB()에서 출력");
			e.printStackTrace();
			// res=false;
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

	public boolean updateDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "update message set writer=?, title=?, content=? where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getMnum());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("updateDB()에서 출력");
			e.printStackTrace();
			// res=false;
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

}
