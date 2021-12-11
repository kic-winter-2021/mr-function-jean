package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;

@Service
public class SellerService {
	@Autowired
	CustomerDao customerDao;
	
	
}
