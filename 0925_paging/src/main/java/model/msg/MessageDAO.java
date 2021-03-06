package model.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;
import model.user.UserVO;

public class MessageDAO {

	public ArrayList<MsgSet> selectAll(String uuid, int cnt) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<MsgSet> datas = new ArrayList<MsgSet>();
		// "java.sql.ResultSet.close()" because "this.rs" is null

		String sql;
		try {
			// =======================================================================================
			// 전체
			if ((uuid == null) || (uuid.equals(""))) {
				sql = "select * from (select * from message ORDER BY udate desc) where rownum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			// =======================================================================================
			// 특정 회원
			else {
				sql = "select * from (select * from message ORDER BY udate desc) where uuid=? and rownum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uuid);
				pstmt.setInt(2, cnt);
			}
			// =======================================================================================
			ResultSet rs = pstmt.executeQuery();
			// 로그인한 경우, 로그인하지 않은 경우에 따라 다른 sql문이 실행됨을 위에서 확인할 수 있다.
			while (rs.next()) {
				MsgSet ms = new MsgSet(); // 댓글과 대댓글을 담을 공간
				MessageVO m = new MessageVO(); // 댓글 객체 생성
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // 대댓글 객체 생성

				// 먼저 댓글 객체에 해당 데이터를 담는다.
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setUuid(rs.getString("uuid"));
				m.setUdate(rs.getDate("udate"));

				// mid : 대댓글의 고유num, PK
				// 댓글의 고유번호 PK에 맞는 대댓글의 모든 컬럼을 날짜 순서로 SELECT한다.
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

				// MessageVO 타입의 공간에 댓글을 세팅시켜준다.
				ms.setM(m);

				// ArrayList<ReplyVO>의 공간에 다음의 대댓글을 세팅시켜준다.
				ms.setRlist(rlist);
				System.out.println(ms);

				// 댓글과 해당하는 대댓글을 담은 객체 MsgSet을 ArrayList<MsgSet>타입의
				// datas에 차곡 차곡 담아준다.
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

	public int Mcount(String uuid) {
		System.out.println("MessageDAO 진입 Mcount 실행 mid 값 : "+uuid);
		int viewcnt = 0;
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;

		try {
			if ((uuid == null) || (uuid.equals(""))) {
				String sql1 = "select count(*) from message";
				pstmt = conn.prepareStatement(sql1);
			}
			// =======================================================================================
			// 특정 회원
			else {
				String sql2 = "select count(*) from message where uuid = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, uuid);
			}
			ResultSet rs = pstmt.executeQuery();
			System.out.println("안녕 ");
			while (rs.next()) {
				viewcnt = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("mDAO_Mcount에서 출력");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		System.out.println("메시지 DAO Mcount viewcnt 출력 결과 :");
		System.out.println(viewcnt);
		return viewcnt;

	}

	public ArrayList<MsgSet> mPaging(int page) {
		System.out.println("mPaging 입장");

		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<MsgSet> datas = new ArrayList<MsgSet>();

		int offset = 5;
		page--;
		System.out.println("여기는 오프셋, 페이지값 구역 : ");
		System.out.println(offset);
		System.out.println(page);

		// 초기 페이지 값을 0으로 두고 처리
		/*
		 * page = 0 offset = 5
		 * 
		 * 0 5-1 5 10-1 10 15-1 15 20-1 20 25-1
		 * 
		 * ++page page * offset + 1, (page + 1) * offset
		 * 
		 * 0 * 5 + 1, (0 + 1) * 5 1 * 5 + 1, (1 + 1) * 5 2 * 5 + 1, (2 + 1) * 5 3 * 5 +
		 * 1, (3 + 1) * 5
		 */
		String sql;
		try {

			sql = "select * from (select rownum as mid, uuid, msg, favcount, replycount, udate from message order by mid) where mid between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page * offset + 1);
			pstmt.setInt(2, (page + 1) * offset);
			System.out.println("오프셋 계산 결과값 : ");
			System.out.println(page * offset + 1);
			System.out.println((page + 1) * offset);

			// =======================================================================================
			ResultSet rs = pstmt.executeQuery();
			// 로그인한 경우, 로그인하지 않은 경우에 따라 다른 sql문이 실행됨을 위에서 확인할 수 있다.
			while (rs.next()) {
				MsgSet ms = new MsgSet(); // 댓글과 대댓글을 담을 공간
				MessageVO m = new MessageVO(); // 댓글 객체 생성
				ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>(); // 대댓글 객체 생성

				// 먼저 댓글 객체에 해당 데이터를 담는다.
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setUuid(rs.getString("uuid"));
				m.setUdate(rs.getDate("udate"));

				// mid : 대댓글의 고유num, PK
				// 댓글의 고유번호 PK에 맞는 대댓글의 모든 컬럼을 날짜 순서로 SELECT한다.
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

				// MessageVO 타입의 공간에 댓글을 세팅시켜준다.
				ms.setM(m);

				// ArrayList<ReplyVO>의 공간에 다음의 대댓글을 세팅시켜준다.
				ms.setRlist(rlist);
				System.out.println(ms);

				// 댓글과 해당하는 대댓글을 담은 객체 MsgSet을 ArrayList<MsgSet>타입의
				// datas에 차곡 차곡 담아준다.
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
			System.out.println("mPaging 퇴장");
		}
		return datas;

	}

}
