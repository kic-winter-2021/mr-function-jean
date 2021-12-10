package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;
import logic.dto.Customer;

/*
 * 
 */
@Service
public class CustomerService {
	@Autowired
	CustomerDao customerDao;
	
	public Customer select(String id) {
		return customerDao.select(id);
	}

	public void signup(Customer customer) {
		customerDao.insert(customer);
	}

}