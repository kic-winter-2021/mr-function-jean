package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Customer;
import mapper.CustomerMapper;

@Repository
public class CustomerDao {
	private CustomerMapper mapper;
	private Map<String, Object> param = new HashMap<>();
	
	private CustomerDao(SqlSessionTemplate template) {
		mapper = template.getMapper(CustomerMapper.class);
	}

	public Customer select(String id) {
		return mapper.selectOneCustomer(id);
	}

}
