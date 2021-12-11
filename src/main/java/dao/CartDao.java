package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mapper.CartMapper;

@Repository
public class CartDao {
	private CartMapper mapper;
	private Map<String, Object> param = new HashMap<>();
	private CartDao (SqlSessionTemplate template) {
		mapper = template.getMapper(CartMapper.class);
	}
	
	public Object countCart(String id) {
		return mapper.countCart(id);
	}
	
}
