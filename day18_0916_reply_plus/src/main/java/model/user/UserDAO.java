package model.user;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class UserDAO {

	public boolean insert(UserVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "insert into mem(uuid,name,passwd,udate) values(?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUuid());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPasswd());
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

	ResultSet rs;

	public boolean login(UserVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		String sql = "select uuid, passwd from mem where uuid = ?";

		boolean result = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUuid());
			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getString("passwd").equals(vo.getPasswd()))
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public ArrayList<UserVO> selectAll() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<UserVO> datas = new ArrayList<UserVO>();
		String sql = "select * from mem where rownum <= 3 order by udate desc";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				UserVO data = new UserVO();
				data.setUdate(rs.getDate("udate"));
				data.setName(rs.getString("name"));
				data.setPasswd(rs.getString("passwd"));
				data.setUuid(rs.getString("uuid"));
				datas.add(data);
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
}
