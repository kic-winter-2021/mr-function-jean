package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;

@Service
public class CartService {
	@Autowired
	CartDao cartDao;
	
	
	
}
