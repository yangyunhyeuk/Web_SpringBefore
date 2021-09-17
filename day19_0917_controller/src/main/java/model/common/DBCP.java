package model.common;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCP {
	public static Connection connect() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext(); // �� ����ϱ� ���� javax.sql.*�� ����Ʈ�ؾ��Ѵ�.
			Context envContext = (Context) initContext.lookup("java:/comp/env"); // �ǹ����� 21,22��°�ٿ� �������� ������ ���յ��� �����Ѵٴ�
																					// �ǹ�
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			conn = ds.getConnection();
			// ���� ������ �� �̸��� ������ �ҽ��� �޾ƿ´�. initContext.lookup()�� ��ȯ�� ������ƮŸ���̶� ������ ĳ�����ؾ��Ѵ�.
			// ���α׷��Ӱ� �����ϴ� ���� ���յ� ��

		} catch (Exception e) {
			System.out.println("connect()���� ���");
			e.printStackTrace();
		}
		return conn;
	}

	public static void disconnect(PreparedStatement pstmt, Connection conn) {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("disconnect()���� ���");
			e.printStackTrace();
		}
	}
}
