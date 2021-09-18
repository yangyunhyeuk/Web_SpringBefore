package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.common.DBCP;

public class ReplyDAO {

	public boolean insert(ReplyVO vo) {
		boolean res = false;
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		conn = DBCP.connect();
		String sql1 = "insert into reply(rid,mid,uuid,rmsg,udate) values((SELECT NVL(MAX(rid),0)+1 FROM reply),?,?,?,sysdate)";
		String sql2 = "update message set replycount=replycount+1 where mid=?";
		try {
			conn.setAutoCommit(false); // set autocommit=0;
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getMid());
			pstmt.setString(2, vo.getUuid());
			pstmt.setString(3, vo.getRmsg());
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();

			res = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (res) { // 잔액이 0미만이면,
					conn.commit(); // commit;
				} else {
					conn.rollback();
					return false;
				}
				conn.setAutoCommit(true); // set autocommit=0;
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return true;
	}

	public boolean delete(ReplyVO vo) {
		System.out.println("대댓 삭제하고 vo 객체 확인 : " + vo.toString());
		boolean res = false;
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql1 = "delete from reply where rid = ?";
		String sql2 = "update message set replycount=replycount-1 where mid=?";
		try {
			conn.setAutoCommit(false); // set autocommit=0;
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getRid());
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();

			res = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (res) { // 잔액이 0미만이면,
					conn.commit(); // commit;
				} else {
					conn.rollback();
					return false;
				}
				conn.setAutoCommit(true); // set autocommit=0;
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
