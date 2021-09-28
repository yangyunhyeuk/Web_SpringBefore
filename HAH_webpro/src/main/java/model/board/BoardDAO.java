package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class BoardDAO {

//=====================================================================================
	public ArrayList<BoardVO> getList(int startRow, int endRow, String table) { // ���� ������ ���� DB�κ��� SELECT
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			// ����Ʈ ���̺� �����Խ���
			String sql = "select * from (select rownum as pnum, ptitle, pcontent, pdate, mname, mid, cnt, category from "
					+ table + " order by pnum) where pnum between " + startRow + " and " + endRow;

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO m = new BoardVO(); // ��� ��ü ����

				// ���� ��� ��ü�� �ش� �����͸� ��´�.
				m.setPnum(rs.getInt("pnum"));
				m.setPtitle(rs.getString("ptitle"));
				m.setPcontent(rs.getString("pcontent"));
				m.setPdate(rs.getDate("pdate"));
				m.setMname(rs.getString("mname"));
				m.setMid(rs.getString("mid"));
				m.setCnt(rs.getInt("cnt"));
				m.setCategory(rs.getString("category"));
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
	public int getTotalCount(String table) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		int total = 0;
		String sql = null;
		try {
			conn = DBCP.connect();
			sql = "select count(*) from " + table;
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
		} catch (

		Exception e) {
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
