package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Item;
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

	public void addItem(Item item) {
		mapper.addItem(item);
		
	}

	public Item detail(String itemid) {
		return mapper.detail(itemid);
	}
}