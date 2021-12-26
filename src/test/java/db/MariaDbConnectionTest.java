package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.jboss.logging.Logger;
import org.junit.jupiter.api.Test;

public class MariaDbConnectionTest {
	private static final Logger log = Logger.getLogger(MariaDbConnectionTest.class);
	String url = "jdbc:mariadb://localhost:3333/fundb?user=root&password=1234";
	
	@Test
	public void connectionTest() {
		try {
//			Class.forName("org.mariadb.jdbc.Driver");	// 자동 호출되므로 명시하지 않아도 연결 가능
			Connection connection = DriverManager.getConnection(url);
			log.info("### connection: " + connection + " - 연결 성공 ####");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
}
