package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;
import logic.dto.Seller;

@Service
public class SellerService {
	@Autowired
	CustomerDao customerDao;
	
	// 사업자 1명 조회
	public Seller select(String sellerid) {
		return customerDao.selectOneSeller(sellerid);
	}
	// 비밀번호 변경
	public void updatePassword(String sellerid, String newpw) {
		customerDao.updatePassword(sellerid, newpw);		
	}

	public void updateBasic(Seller seller) {
		customerDao.updateSellerBasic(seller);
	}
	public void updateCompany(Seller seller) {
		customerDao.updateCompany(seller);
	}

	public String getPasswordById(String id) {
		return customerDao.getPasswordById(id);
	}
}
