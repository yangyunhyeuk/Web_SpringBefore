package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class MessageDAO {

	public ArrayList<MsgSet> selectAll(String uuid, int cnt) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<MsgSet> datas = new ArrayList<MsgSet>();
		// "java.sql.ResultSet.close()" because "this.rs" is null

		String sql;
		try {
			// =======================================================================================
			// ��ü
			if ((uuid == null) || (uuid.equals(""))) {
				sql = "select * from (select * from message ORDER BY udate desc) where rownum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			// =======================================================================================
			// Ư�� ȸ��
			else {
				sql = "select * from (select * from message ORDER BY udate desc) where uuid=? and rownum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uuid);
				pstmt.setInt(2, cnt);
			}
			// =======================================================================================
			ResultSet rs = pstmt.executeQuery();
			// �α����� ���, �α������� ���� ��쿡 ���� �ٸ� sql���� ������� ������ Ȯ���� �� �ִ�.
			while (rs.next()) {
				MsgSet ms = new MsgSet(); // ��۰� ������ ���� ����
				MessageVO m = new MessageVO(); // ��� ��ü ����
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // ���� ��ü ����

				// ���� ��� ��ü�� �ش� �����͸� ��´�.
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setUuid(rs.getString("uuid"));
				m.setUdate(rs.getDate("udate"));

				// mid : ������ ����num, PK
				// ����� ������ȣ PK�� �´� ������ ��� �÷��� ��¥ ������ SELECT�Ѵ�.
				String rsql = "select * from reply where mid=? order by udate desc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				int rcnt = 0;
				while (rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setUdate(rrs.getDate("udate"));
					r.setMid(rrs.getInt("mid"));
					r.setRid(rrs.getInt("rid"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setUuid(rrs.getString("uuid"));
					rlist.add(r);
					rcnt++;
				}
				m.setReplycount(rcnt);

				// MessageVO Ÿ���� ������ ����� ���ý����ش�.
				ms.setM(m);

				// ArrayList<ReplyVO>�� ������ ������ ������ ���ý����ش�.
				ms.setRlist(rlist);
				System.out.println(ms);

				// ��۰� �ش��ϴ� ������ ���� ��ü MsgSet�� ArrayList<MsgSet>Ÿ����
				// datas�� ���� ���� ����ش�.
				datas.add(ms);

				rrs.close();
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return datas;
	}

	public boolean insert(MessageVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		conn = DBCP.connect();
		String sql = "insert into message(mid, uuid, msg, udate) values((SELECT NVL(MAX(mid),0)+1 FROM message),?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUuid());
			pstmt.setString(2, vo.getMsg());
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

	public boolean delete(MessageVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "delete from message where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
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

	public boolean update(MessageVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "update message set favcount=favcount+1 where mid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
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
