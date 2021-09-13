package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.common.DBCP;

public class ReplyDAO {

	public boolean insert(ReplyVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		conn = DBCP.connect();
		String sql = "insert into reply(mid,uuid,rmsg,udate) values(?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.setString(2, vo.getUuid());
			pstmt.setString(3, vo.getRmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public boolean delete(ReplyVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "delete from reply where rid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
