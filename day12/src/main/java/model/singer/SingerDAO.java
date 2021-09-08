package model.singer;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.jndi.Jndi;

public class SingerDAO {
	public ArrayList<SingerVO> getDBDatas() {
		Connection conn = Jndi.connect();
		PreparedStatement pstmt = null;
		ArrayList<SingerVO> datas = new ArrayList();
		try {
			String sql = "select * from singer order by snum desc"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // executeQuery 반환타입 rs!
			while (rs.next()) {
				SingerVO vo = new SingerVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setSong(rs.getString("song"));
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

	public SingerVO getDBData(SingerVO vo) {
		Connection conn = Jndi.connect();
		PreparedStatement pstmt = null;
		SingerVO sing = null;
		try {
			String sql_SelectOne = "select * from singer where snum = ?";
			pstmt = conn.prepareStatement(sql_SelectOne);
			pstmt.setInt(1, vo.getSnum());
			System.out.println("selectOne 작업 : "+vo.getSnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				sing = new SingerVO();
				sing.setSnum(rs.getInt("snum"));
				sing.setName(rs.getString("name"));
				sing.setAge(rs.getInt("age"));
				sing.setSong(rs.getString("song"));
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		} finally {
			Jndi.disconnect(pstmt, conn);
		}
		return sing;
	}

	public boolean insertDB(SingerVO vo) {
		Connection conn = Jndi.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql_INSERT = "INSERT INTO singer VALUES ((SELECT NVL(MAX(snum),0)+1 FROM singer),?,?,?)";
			pstmt = conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getSong());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("insertDB()에서 출력");
			e.printStackTrace();
		} finally {
			Jndi.disconnect(pstmt, conn);
		}
		return res;
	}
	public boolean deleteDB(SingerVO vo) {
		Connection conn = Jndi.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from singer where snum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getSnum());
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("deleteDB()에서 출력");
			e.printStackTrace();
			// res=false;
		} finally {
			Jndi.disconnect(pstmt, conn);
		}
		return res;
	}
	public boolean updateDB(SingerVO vo) {
		Connection conn = Jndi.connect();
		boolean res = false;
		PreparedStatement pstmt = null;
		try {
			String SQL_UPDATE = "update singer set name=?, age=?, song=? where snum=?";
			pstmt = conn.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getSong());
			pstmt.setInt(4, vo.getSnum());
			
			pstmt.executeUpdate();
			res = true;
		} catch (Exception e) {
			System.out.println("updateDB()에서 출력");
			e.printStackTrace();
			// res=false;
		} finally {
			Jndi.disconnect(pstmt, conn);
		}
		return res;
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
}
