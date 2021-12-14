package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Sale;
import logic.dto.Transaction;
import mapper.SaleMapper;

@Repository
public class SaleDao {	
		private SaleMapper mapper;
		private Map<String, Object> param = new HashMap<>();	
		private SaleDao (SqlSessionTemplate template) {
			mapper = template.getMapper(SaleMapper.class);
		}
		public int countByCustomerId(String customerid) {
			param.clear();
			param.put("customerid", customerid);
			return mapper.count(param);
		}
		public List<Sale> listByCustomerId(String customerid) {
			param.clear();
			param.put("customerid", customerid);
			return mapper.list(param);
		}
		
		
		
		
		

}
