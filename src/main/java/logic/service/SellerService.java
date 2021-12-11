package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;
import logic.dto.Seller;

@Service
public class SellerService {
	@Autowired
	CustomerDao customerDao;

	public void signup(Seller seller) {
		customerDao.insertSeller(seller);
	}
	
	
}
