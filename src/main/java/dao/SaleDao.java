package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mapper.SaleMapper;

@Repository
public class SaleDao {	
		private SaleMapper mapper;
		private Map<String, Object> param = new HashMap<>();	
		private SaleDao (SqlSessionTemplate template) {
			mapper = template.getMapper(SaleMapper.class);
		}
		public Object countSale(String id) {
			return mapper.countSale(id);
		}
		
		
		

}
