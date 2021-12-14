package logic.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;
import dao.CustomerDao;
import dao.SaleDao;
import logic.dto.Customer;

/*
 * 
 */
@Service
public class CustomerService {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	SaleDao saleDao;
	
	public Customer selectOne(String id) {
		return customerDao.selectOne(id);
	}

	public void signup(Customer customer) {
		customerDao.insert(customer);
	}
	public Object cartcount(String id) {
		return cartDao.countCart(id);
	}

	public Object salecount(String id) {
		return saleDao.countSale(id);
	}
	public String getSearch(Customer customer, String url) {
		// TODO: 아이디의 경우, 가리고 보여주기?
		// TODO: 비밀번호의 경우, 임시비밀번호로 변경 후 이메일 발송? 재설정
		return customerDao.search(customer, url);
	}
	public void userUpdate(Customer customer) {
		customerDao.userUpdate(customer);
		
	}
}