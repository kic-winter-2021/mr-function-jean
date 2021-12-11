package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Regist;
import mapper.CustomerMapper;
import mapper.ItemMapper;

@Repository
public class ItemDao {
	private ItemMapper mapper;
	private Map<String, Object> param = new HashMap<>();

	private ItemDao(SqlSessionTemplate template) {
		mapper = template.getMapper(ItemMapper.class);
	}

	public void addRegist(Regist register) {
		mapper.addRegister(register);
		
	}
}