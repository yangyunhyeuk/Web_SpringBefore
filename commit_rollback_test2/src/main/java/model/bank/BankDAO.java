package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.jndi.Jndi;
import model.bank.BankVO;

public class BankDAO {

//=========================================================================

	public ArrayList<BankVO> getDBDatas() {
		Connection conn = Jndi.connect();
		PreparedStatement pstmt = null;
		ArrayList<BankVO> datas = new ArrayList();
		try {
			String sql = "select * from bank order by bnum desc"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // executeQuery 반환타입 rs!
			while (rs.next()) {
				BankVO vo = new BankVO();
				vo.setBnum(rs.getInt("bnum"));
				vo.setBname(rs.getString("bname"));
				vo.setMoney(rs.getInt("money"));
				datas.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBDatas()에서 출력");
			e.printStackTrace();
		} finally {
			Jndi.disconnect(pstmt, conn);
		}

		return datas;
	}

//=========================================================================

	public BankVO getDBData(BankVO vo) {
		Connection conn = Jndi.connect();
		PreparedStatement pstmt = null;
		BankVO info = null;
		try {
			String sql_SelectOne = "select * from bank where bnum = ?";
			pstmt = conn.prepareStatement(sql_SelectOne);
			pstmt.setInt(1, vo.getBnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				info = new BankVO();
				info.setBnum(rs.getInt("bnum"));
				info.setBname(rs.getString("bname"));
				info.setMoney(rs.getInt("money"));
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		} finally {
			Jndi.disconnect(pstmt, conn);
		}
		return info;
	}

	public boolean update(BankVO vo) {
		Connection conn = Jndi.connect();
		PreparedStatement pstmt = null;
		System.out.println("업데이트 DAO 진입");
		System.out.print(vo.toString());
		System.out.print(vo.getChange());

		try {
			conn.setAutoCommit(false); // set autocommit=0;
			String sql1 = "update bank set money=money-? where bnum=?";
			String sql2 = "update bank set money=money+? where bnum=?";

			if (vo.getBnum() == 1) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, vo.getChange());
				pstmt.setInt(2, vo.getBnum());
				pstmt.executeUpdate();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, vo.getChange());
				pstmt.setInt(2, 2);
				pstmt.executeUpdate();

				String sql = "select money from bank where bnum=1";
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				if (rs.getInt(1) < 0) { // 잔액이 0미만이면,
					conn.rollback();
					return false;
				} else {
					conn.commit(); // commit;
				}
				conn.setAutoCommit(true); // set autocommit=0;
			}

			else if (vo.getBnum() == 2) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, vo.getChange());
				pstmt.setInt(2, vo.getBnum());
				pstmt.executeUpdate();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, vo.getChange());
				pstmt.setInt(2, 1);
				pstmt.executeUpdate();

				String sql = "select money from bank where bnum=2";
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();

				if (rs.getInt(1) < 0) { // 잔액이 0미만이면,
					conn.rollback();
					return false;
				} else {
					conn.commit(); // commit;
				}
				conn.setAutoCommit(true); // set autocommit=0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Jndi.disconnect(pstmt, conn);
		}

		return true;
	}

}
