package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;


	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "wjdghks0!";
			Class.forName("com.mysql.jdbc.Driver");
			//mYsql드라이버를 찾을 수 있도록 (Driver는 mYsql로 접속할 수 있도록 하는 매개체 역할을 하는 하나의 라이브러리라고 할 수 있음)
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 실제로 mYsql에 접속을 하게 해주는 부분


	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL); // 정해진 SQL의 문장을 데이터베이스에 삽입하는 형식으로 인스턴스를 가져옴.
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; //  로그인 성공
				}
				else
					return 0; //  비밀번호 불일치
			}
			return -1; // 아이디가 없으면
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}

	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
