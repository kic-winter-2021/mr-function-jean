package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Review;
import mapper.ItemMapper;

@Repository
public class ItemDao {
	private ItemMapper mapper;
	private Map<String,Object> param = new HashMap<>();
	private ItemDao (SqlSessionTemplate template) {
		mapper = template.getMapper(ItemMapper.class);
	}
	
	public Object countitem(String id) {		
		return mapper.countitem(id);
	}

	public List<Review> itemreviewlist(String id) {		
		return mapper.itemreviewlist(id);
	}

}
