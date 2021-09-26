package model.board;

import java.beans.Statement;
import java.sql.Connection;

import model.common.DBCP;
import model.msg.MessageVO;
import model.msg.MsgSet;
import model.msg.ReplyVO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

//=====================================================================================
	public ArrayList<MessageVO> getList(int startRow, int endRow) { // ���� ������ ���� DB�κ��� SELECT
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<MessageVO> list = new ArrayList<MessageVO>();
		try {
			String sql = "select * from (select rownum as mid, uuid, msg, favcount, replycount, udate from message order by mid) where mid between "
					+ startRow + " and " + endRow;

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageVO m = new MessageVO(); // ��� ��ü ����

				// ���� ��� ��ü�� �ش� �����͸� ��´�.
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setUuid(rs.getString("uuid"));
				m.setUdate(rs.getDate("udate"));
				list.add(m);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("getList ���� �߻�");
				e.printStackTrace();
			}
			System.out.println("getList ����");

		}
		return list;
	}

	// =====================================================================================
	// �޽��� ���̺� ��ü �Խñ� ����
	public int getTotalCount() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		int total = 0;
		try {
			conn = DBCP.connect();

			String sql = "select count(*) from message";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("getTotalCount ���� �߻�");
				e.printStackTrace();
			}
			System.out.println("getTotalCount ����");

		}
		return total;
	}
}
