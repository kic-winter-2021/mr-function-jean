package db;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import config.DBConfig;
import mapper.TestMapper;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { DBConfig.class })
public class MapperTest {
	private static final Logger log = LoggerFactory.getLogger(MapperTest.class);
	
	@Autowired
	private TestMapper testMapper;
	
	@Test
	public void getTime() {
		log.info("'getTime(): " + testMapper.getTime() + "'");
	}
}
