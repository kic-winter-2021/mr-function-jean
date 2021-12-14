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
	
	public void addItem(Item item) {
		mapper.addItem(item);
		
	}
	public Item detail(String itemid) {
		return mapper.detail(itemid);
	}

	public int countBySellerid(String sellerid) {
		param.clear();
		param.put("sellerid",sellerid);
		return mapper.countBySellerid(param);
	}

	public List<Item> listBySellerid(String sellerid) {
		param.clear();
		param.put("sellerid",sellerid);
		return mapper.listBySellerid(param);
	}

	public void update(Item item) {
		mapper.update(item);
	}

	public void delete(String itemid) {
		mapper.delete(itemid);
	}
}

