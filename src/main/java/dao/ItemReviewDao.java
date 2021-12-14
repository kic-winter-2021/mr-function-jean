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
	
	public int countByCustomerId(String customerid) {
		param.clear();
		param.put("customerid", customerid);
		return mapper.count(param);
	}
	public List<Review> listByCustomerId(String customerid) {
		param.clear();
		param.put("customerid", customerid);
		return mapper.list(param);
	}
}
