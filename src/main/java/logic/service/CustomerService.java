package logic.service;

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
	
	public Customer select(String id) {
		return customerDao.select(id);
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

}