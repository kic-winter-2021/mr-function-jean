package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Review;
import mapper.ItemReviewMapper;

@Repository
public class ItemReviewDao {

	private ItemReviewMapper mapper;
	private Map<String,Object> param = new HashMap<>();
	private ItemReviewDao (SqlSessionTemplate template) {
		mapper = template.getMapper(ItemReviewMapper.class);
	}
	
	public Object countitem(String id) {		
		return mapper.countitem(id);
	}

	public List<Review> itemreviewlist(String id) {		
		return mapper.itemreviewlist(id);
	}
}
