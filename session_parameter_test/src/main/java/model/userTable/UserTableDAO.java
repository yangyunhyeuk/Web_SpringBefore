package model.userTable;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.common.JDBC;
import model.common.JDBCO;
import model.member.MemberVO;

public class UserTableDAO {
	public UserTableVO selectOne(UserTableVO vo) {
		Connection conn=JDBCO.connect();
		PreparedStatement pstmt=null;
		UserTableVO data=null;
		try{
			String sql="select * from userTable where userID=? and userPW=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserID());
			pstmt.setString(2, vo.getUserPW());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new UserTableVO();
				data.setUnum(rs.getInt("unum"));
				data.setUserID(rs.getString("userID"));
				data.setUserPW(rs.getString("userPW"));
			}
			rs.close();
		}
		catch(Exception e){
			System.out.println("UserTableDAO selectOne()에서 출력");
			e.printStackTrace();
		}
		finally {
			JDBCO.disconnect(pstmt,conn);
		}
		return data;
	}
	
	
	create table userTable(
			unum int primary key,
		    userID varchar(15),
		    userPW varchar(15)
		);
	
	public UserTableVO getDBData(UserTableVO vo){
		Connection conn=JDBCO.connect();
		UserTableVO data=null;
		PreparedStatement pstmt=null;
		try{
			String sql="select * from member where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserID());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new MemberVO();
				data.setMemnum(rs.getInt("memnum"));
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
			}
			rs.close();
		}
		catch(Exception e){
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		}
		finally {
			JDBCO.disconnect(pstmt,conn);
		}
		return data;
	}
}
