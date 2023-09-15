package testPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBTest {

	public static void main(String[] args) {
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		final String driver = "oracle.jdbc.OracleDriver";
		final String url = "jdbc:oracle:thin:@localhost:1521/xe";
		final String user = "jungbo";
		final String pw = "1234";
		try {
			Class.forName(driver);
			try {
				conn = DriverManager.getConnection(url, user, pw);
				pstmt = conn.prepareStatement("select * from ~");
				// 캐치전에 클로즈
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
