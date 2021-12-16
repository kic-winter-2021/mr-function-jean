package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdpostDao;
import dao.CustomerDao;
import dao.ItemDao;
import logic.dto.AdPost;
import logic.dto.Customer;
import logic.dto.Item;

@Service
public class SellerService {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	AdpostDao adpostDao;
	@Autowired
	ItemDao itemDao;
	
	// 사업자 정보 갱신
	public void updateBasic(Customer customer) {
		customerDao.updateSellerBasic(customer);
	}
	public void updateCompany(Customer customer) {
		customerDao.updateCompany(customer);
	}
	public void apply(AdPost adpost) {
		adpostDao.insert(adpost);
	}
	public List<Item> getItemList(String sellerid) {
		return itemDao.listBySellerid(sellerid);
	}
}
