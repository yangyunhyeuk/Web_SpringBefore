package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
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
			System.out.println("searchDBList()���� ���");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}

	public ArrayList<MessageVO> getDBList() {
		Connection conn = JDBC.connect();
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from message order by mnum desc";
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
			System.out.println("getDBList()���� ���");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}

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
			System.out.println("getDBData()���� ���");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
	}

	public boolean insertDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into message (writer,title,content) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("insertDB()���� ���");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

}