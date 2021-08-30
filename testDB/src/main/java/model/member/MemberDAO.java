package model.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
   Connection conn;
   PreparedStatement pstmt;
   public void connect() {
      String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
      String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
      try{
         Class.forName(jdbc_driver);
         conn=DriverManager.getConnection(jdbc_url,"yang","1234");
      }
      catch(Exception e){
         System.out.println("connect()에서 출력");
         e.printStackTrace();
      }
   }
   public void disconnect() {
      try{
         pstmt.close();
         conn.close();
      }
      catch(Exception e){
         System.out.println("disconnect()에서 출력");
         e.printStackTrace();
      }
   }
   public ArrayList<MemberVO> select() {
      ArrayList<MemberVO> datas=new ArrayList();
      try{
         connect();
         String sql="select * from member";
         pstmt=conn.prepareStatement(sql);
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()){
            MemberVO vo=new MemberVO();
            vo.setPk(rs.getInt("pk"));
            vo.setUserName(rs.getString("userName"));
            vo.setUserID(rs.getString("userID"));
            vo.setUserPW(rs.getString("userPW"));
            datas.add(vo);
         }
         rs.close();
      }
      catch(Exception e){
         System.out.println("select()에서 출력");
         e.printStackTrace();
      }
      finally {
         disconnect();
      }
      return datas;
   }
   public void insert(MemberVO vo) {
      try{
         connect();
         String sql="insert into member values((select nvl(max(pk),0)+1 from member),?,?,?)";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, vo.getUserID());
         pstmt.setString(2, vo.getUserPW());
         pstmt.setString(3, vo.getUserName());
         pstmt.executeUpdate();
      }
      catch(Exception e){
         System.out.println("insert()에서 출력");
         e.printStackTrace();
      }
      finally {
         disconnect();
      }
   }
   public MemberVO login(MemberVO vo) { // selectOne()
      MemberVO data=null;
      try{
         connect();
         String sql="select * from member where userID=? and userPW=?"; // ☆
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, vo.getUserID());
         pstmt.setString(2, vo.getUserPW());
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()){
            data=new MemberVO();
            data.setPk(rs.getInt("pk"));
            data.setUserName(rs.getString("userName"));
            data.setUserID(rs.getString("userID"));
            data.setUserPW(rs.getString("userPW"));
         }
         rs.close();
      }
      catch(Exception e){
         System.out.println("login()에서 출력");
         e.printStackTrace();
      }
      finally {
         disconnect();
      }
      return data;
   }
}