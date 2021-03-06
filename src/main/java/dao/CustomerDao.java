package dao;

import java.util.HashMap;
import java.util.List;
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

	public Customer selectOne(String id) {
		return mapper.selectOne(id);
	}

	public void insert(Customer customer) {
		mapper.insert(customer);
	}
	
	public String getPasswordById(String id) {
		return mapper.getPasswordById(id);
	}
	public String search(Customer customer, String url) {
		param.clear();
		param.put("email", customer.getEmail());
		param.put("phoneno", customer.getPhoneno());
		if(url.equals("id")) { // idsearch
			param.put("column", "id");
		} else if(url.equals("pw")) { // pwsearch
			param.put("id", customer.getId());
			param.put("column", "'**'||substr(password, 3) password");
		}
		return mapper.search(param);
	}
	public void update(Customer customer) {
		mapper.update(customer);
	}
	public void updatePassword(String id, String newpw) {
		param.clear();
		param.put("id", id);
		param.put("password", newpw);
		mapper.updatePassword(param);
	}
	public List<Customer> listUser() {
		return mapper.listUser();
	}
	public void updateSellerBasic(Customer customer) {
		mapper.updateSellerBasic(customer);
	}
	public void updateCompany(Customer customer) {
		mapper.updateCompany(customer);
	}
	public void delete(String id) {
		mapper.delete(id);
		
	}
	public void updateAll(Customer customer) {
		mapper.updateAll(customer);
	}
}
