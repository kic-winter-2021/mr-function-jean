package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Item;
import mapper.ItemMapper;

@Repository
public class ItemDao {
	ItemMapper mapper;
	Map<String, Object> param = new HashMap<>();
	private ItemDao(SqlSessionTemplate template) {
		mapper = template.getMapper(ItemMapper.class);
	}
	public List<Item> listBySellerid(String sellerid) {
		param.clear();
		param.put("sellerid", sellerid);
		return mapper.select(param);
	}
	
	
}
