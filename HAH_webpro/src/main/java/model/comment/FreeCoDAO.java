package model.comment;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;

//DAO : FreeCoDAO
//VO : FreeCoVO
//테이블명 : FREECOMMENT


public class FreeCoDAO {
	// ==========================================================================================================
	public ArrayList<FreeCoVO> SelectAll() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<FreeCoVO> datas = new ArrayList();
		try {
			String sql_SelectAll = "SELECT * FROM FREECOMMENT"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql_SelectAll);
			ResultSet rs = pstmt.executeQuery(); // executeQuery 반환타입 rs!
			while (rs.next()) {
				FreeCoVO vo = new FreeCoVO();
				vo.setCnum(rs.getInt("cnum"));
				vo.setComm(rs.getString("comm"));
				vo.setCdate(rs.getString("cdate"));
				vo.setPnum(rs.getInt("pnum"));
				vo.setMname(rs.getString("mname"));
				vo.setMid(rs.getString("mid"));
				datas.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("SelectAll()에서 출력");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}

		return datas;
	}

	// ==========================================================================================================
	public FreeCoVO SelectOne(FreeCoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		FreeCoVO commdata = null;
		try {
			String sql_SelectOne = "select * from FREECOMMENT where cnum = ?"; // 일단 기본키인 cnum으로 조건절 작성
			pstmt = conn.prepareStatement(sql_SelectOne);
			pstmt.setInt(1, vo.getCnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				commdata = new FreeCoVO();
				commdata.setCnum(rs.getInt("cnum"));
				commdata.setComm(rs.getString("comm"));
				commdata.setCdate(rs.getString("cdate"));
				commdata.setPnum(rs.getInt("pnum"));
				commdata.setMname(rs.getString("mname"));
				commdata.setMid(rs.getString("mid"));

			}
			rs.close();
		} catch (Exception e) {
			System.out.println("SelectOne()에서 출력");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return commdata;
	}

	// ==========================================================================================================
	public boolean InsertDB(FreeCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_INSERT = "INSERT INTO FREECOMMENT VALUES ((SELECT NVL(MAX(cnum),0)+1 FROM FREECOMMENT),?,SYSDATE,?,?,?)";
			// 현재 댓글 작성 시 ①댓글 내용 ②해당 게시글 번호 ③회원 닉네임 ④회원 아이디를 입력값으로 받는 상태
			// 추후 수정할 예정

			pstmt = conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getComm()); // 댓글 내용
			pstmt.setInt(2, vo.getPnum()); // 게시글 번호
			pstmt.setString(3, vo.getMname()); // 회원 닉네임
			pstmt.setString(4, vo.getMid()); // 회원 아이디

			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("InsertDB()에서 출력");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}

	// ==========================================================================================================
	public boolean UpdateDB(FreeCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_UPDATE = "UPDATE FREECOMMENT SET COMM=?, PNUM=?, MNAME=?, MID=? where CNUM=?"; // 업데이트 조건, cnum
			pstmt = conn.prepareStatement(sql_UPDATE);
			pstmt.setString(1, vo.getComm());
			pstmt.setInt(2, vo.getPnum());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getMid());
			pstmt.setInt(5, vo.getCnum());

			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("UpdateDB()에서 출력");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}

	// ==========================================================================================================
	public boolean DeleteDB(FreeCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_DeleteDB = "DELETE FROM FREECOMMENT WHERE CNUM=?";
			pstmt = conn.prepareStatement(sql_DeleteDB);
			pstmt.setInt(1, vo.getCnum());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("DeleteDB()에서 출력");
			e.printStackTrace();
			// res=false;
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}
	// ==========================================================================================================
}
