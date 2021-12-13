package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import logic.dto.Customer;
import logic.dto.Seller;
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

	public void insert(Customer customer) {
		mapper.insert(customer);
	}
	
	public String getPasswordById(String id) {
		return mapper.getPasswordById(id);
	}

	public void insertSeller(Seller seller) {
		mapper.insertSeller(seller);		
	}
	public void search(Customer customer, String url) {
		String sql = null;
		if(url.equals("id")) {
			
		}else if(url.equals("pw")) {
			
		}
		SqlParameterSource param = new BeanPropertySqlParameterSource(customer);
		return template.queryForObject(sql, param,String.class);
	}
	public Seller selectOneSeller(String sellerid) {
		return mapper.selectOneSeller(sellerid);
	}
	public void updateSellerBasic(Seller seller) {
		mapper.updateSellerBasic(seller);
	}
	public void updateCompany(Seller seller) {
		mapper.updateCompany(seller);
	}

	public void updatePassword(String id, String newpw) {
		param.clear();
		param.put("id", id);
		param.put("password", newpw);
		mapper.updatePassword(param);
	}
}
