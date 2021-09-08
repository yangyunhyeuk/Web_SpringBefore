package model.member;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;
import model.message.MessageVO;

public class MemberDAO {

	public MemberVO getDBData(MemberVO vo) {
		Connection conn = JDBC.connect();
		MemberVO data = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from member where mid=? and mpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setMnum(rs.getInt("mnum"));
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
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

	public ArrayList<MemberVO> getDBDatas() {
		Connection conn = JDBC.connect();
		ArrayList<MemberVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from member order by mnum desc"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMnum(rs.getInt("mnum"));
				vo.setMid(rs.getString("mid"));
				vo.setMpw(rs.getString("mpw"));
				datas.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBDatas()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}

	public boolean insertDB(MemberVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into member (mid,mpw) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("insertDB()에서 출력");
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

	public boolean updateMem(MemberVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set mid=?, mpw=? where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setInt(3, vo.getMnum());
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

	public boolean deleteMem(MemberVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from member where mnum = ?";
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

}