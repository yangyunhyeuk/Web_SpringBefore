package model.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;

//DAO : StudyCoDAO
//VO : StudyCoVO
//���̺�� : STUDYCOMMENT

public class StudyCoDAO {
	// ==========================================================================================================
	public ArrayList<StudyCoVO> SelectAll() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<StudyCoVO> datas = new ArrayList();
		try {
			String sql_SelectAll = "SELECT * FROM STUDYCOMMENT"; // �ֱ� �Խñ� ��� ��ġ
			pstmt = conn.prepareStatement(sql_SelectAll);
			ResultSet rs = pstmt.executeQuery(); // executeQuery ��ȯŸ�� rs!
			while (rs.next()) {
				StudyCoVO vo = new StudyCoVO();
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
			System.out.println("SelectAll()���� ���");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}

		return datas;
	}

	// ==========================================================================================================
	public StudyCoVO SelectOne(StudyCoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		StudyCoVO commdata = null;
		try {
			String sql_SelectOne = "select * from STUDYCOMMENT where cnum = ?"; // �ϴ� �⺻Ű�� cnum���� ������ �ۼ�
			pstmt = conn.prepareStatement(sql_SelectOne);
			pstmt.setInt(1, vo.getCnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				commdata = new StudyCoVO();
				commdata.setCnum(rs.getInt("cnum"));
				commdata.setComm(rs.getString("comm"));
				commdata.setCdate(rs.getString("cdate"));
				commdata.setPnum(rs.getInt("pnum"));
				commdata.setMname(rs.getString("mname"));
				commdata.setMid(rs.getString("mid"));

			}
			rs.close();
		} catch (Exception e) {
			System.out.println("SelectOne()���� ���");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return commdata;
	}

	// ==========================================================================================================
	public boolean InsertDB(StudyCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_INSERT = "INSERT INTO STUDYCOMMENT VALUES ((SELECT NVL(MAX(cnum),0)+1 FROM STUDYCOMMENT),?,SYSDATE,?,?,?)";
			// ���� ��� �ۼ� �� ���� ���� ���ش� �Խñ� ��ȣ ��ȸ�� �г��� ��ȸ�� ���̵� �Է°����� �޴� ����
			// ���� ������ ����

			pstmt = conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getComm()); // ��� ����
			pstmt.setInt(2, vo.getPnum()); // �Խñ� ��ȣ
			pstmt.setString(3, vo.getMname()); // ȸ�� �г���
			pstmt.setString(4, vo.getMid()); // ȸ�� ���̵�

			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("InsertDB()���� ���");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}

	// ==========================================================================================================
	public boolean UpdateDB(StudyCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_UPDATE = "UPDATE STUDYCOMMENT SET COMM=?, PNUM=?, MNAME=?, MID=? where CNUM=?"; // ������Ʈ ����, cnum
			pstmt = conn.prepareStatement(sql_UPDATE);
			pstmt.setString(1, vo.getComm());
			pstmt.setInt(2, vo.getPnum());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getMid());
			pstmt.setInt(5, vo.getCnum());

			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("UpdateDB()���� ���");
			e.printStackTrace();
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}

	// ==========================================================================================================
	public boolean DeleteDB(StudyCoVO vo) {
		Connection conn = DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_DeleteDB = "DELETE FROM STUDYCOMMENT WHERE CNUM=?";
			pstmt = conn.prepareStatement(sql_DeleteDB);
			pstmt.setInt(1, vo.getCnum());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("DeleteDB()���� ���");
			e.printStackTrace();
			// res=false;
		} finally {
			DBCP.disconnect(pstmt, conn);
		}
		return res;
	}
	// ==========================================================================================================
}
