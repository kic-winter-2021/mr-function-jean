package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdpostDao;
import dao.CustomerDao;
import dao.ItemDao;
import logic.dto.AdPost;
import logic.dto.Item;
import logic.dto.Seller;

@Service
public class SellerService {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	AdpostDao adpostDao;
	@Autowired
	ItemDao itemDao;
	
	public void signup(Seller seller) {
		customerDao.insertSeller(seller);
	}
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
	public void apply(AdPost adpost) {
		adpostDao.insert(adpost);
	}
	public List<Item> getItemList(String sellerid) {
		return itemDao.listBySellerid(sellerid);
	}
}
