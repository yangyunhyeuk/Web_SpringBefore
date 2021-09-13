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
			//=======================================================================================
			// ÀüÃ¼
			if ((uuid == null) || (uuid.equals(""))) {
				sql = "select * from message where rownum <= ? order by udate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			//=======================================================================================
			// Æ¯Á¤ È¸¿ø
			else {
				sql = "select * from message where uuid=? and rownum <= ? order by udate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uuid);
				pstmt.setInt(2, cnt);
			}
			//=======================================================================================
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MsgSet ms = new MsgSet(); // ´ñ±Û°ú ´ë´ñ±ÛÀ» ´ãÀ» °ø°£
				MessageVO m = new MessageVO(); // ´ñ±Û °´Ã¼
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // ´ë´ñ±Û °´Ã¼

				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setUuid(rs.getString("uuid"));
				m.setUdate(rs.getDate("udate"));

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

				ms.setM(m);
				ms.setRlist(rlist);
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
		String sql = "insert into message(uuid, msg, udate) values(?,?,sysdate)";
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

	public void update(MessageVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "update message set favcount=favcount+1 where mid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();
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
	}
}
