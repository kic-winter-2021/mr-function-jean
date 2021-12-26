package db;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import config.DBConfig;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { DBConfig.class })
public class HikariDataSourceTest {
	private static final Logger log = LoggerFactory.getLogger(HikariDataSourceTest.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void hikariDataSourceTest() {
		try { 
//			assertNull(dataSource);
			Connection con = dataSource.getConnection();
			log.info("'Connection 객체: " + con + "'");
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
}
