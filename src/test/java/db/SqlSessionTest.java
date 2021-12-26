package db;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import config.DBConfig;

@ContextConfiguration(classes = { DBConfig.class })
@RunWith(SpringRunner.class)
public class SqlSessionTest {
	private static final Logger log = LoggerFactory.getLogger(SqlSessionTest.class);
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void sqlSessionFactoryTest() {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			Connection connection = session.getConnection();
			log.info("'Session 객체: " + session + "'");
			log.info("'Connection 객체: " + connection + "'");
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
}
