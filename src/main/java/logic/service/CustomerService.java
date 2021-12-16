package logic.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dao.CartDao;
import dao.CustomerDao;
import dao.ItemDao;
import dao.ItemReviewDao;
import dao.SaleDao;
import logic.dto.Board;
import logic.dto.Cart;
import logic.dto.Customer;
import logic.dto.ItemSet;
import logic.dto.Review;

/*
 * 
 */
@Service
public class CustomerService {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	SaleDao saleDao;
	@Autowired
	ItemDao itemDao;
	@Autowired
	ItemReviewDao itemReviewDao;
	
	public Customer selectOne(String id) {
		return customerDao.selectOne(id);
	}
	public String getPasswordById(String id) {
		return customerDao.getPasswordById(id);
	}
	public void signup(Customer customer) {
		customerDao.insert(customer);
	}
	public int countCart(String id) {
		return cartDao.count(id);
	}
	public int countSale(String id) {
		return saleDao.countByCustomerId(id);
	}
	public String getSearch(Customer customer, String url) {
		// TODO: 아이디의 경우, 가리고 보여주기?
		// TODO: 비밀번호의 경우, 임시비밀번호로 변경 후 이메일 발송? 재설정
		return customerDao.search(customer, url);
	}
	public List<Customer> list() {
		return customerDao.listUser();
	}
	/* update */
	public void update(Customer customer) {
		customerDao.update(customer);
	}
	// 비밀번호 변경
	public void updatePassword(String customerid, String newpw) {
		customerDao.updatePassword(customerid, newpw);		
	}
	/* 상품 리뷰 itemReview */
	public int countItemReview(String customerid) {
		return itemReviewDao.countByCustomerId(customerid);
	}
	public List<Review> listItemReview(String customerid) {
		return itemReviewDao.listByCustomerId(customerid);
	}
	/* 상품 문의 item question */
	public int countItemQuestion(String customerid) {		
		return boardDao.countItemQuestionByCustomerId(customerid);
	}
	public List<Board> listItemQuestion(String id) {
		return boardDao.listItemQuestionByCustomerId(id);
	}

	public void delete(String id) {
		customerDao.delete(id);
		
	}
	public void updateAll(Customer customer) {
		customerDao.updateAll(customer);
	}
	// cart 읽기
	public Cart getCart(String customerid) {
		Cart cart = new Cart();
		List<ItemSet> isetList = cartDao.select(customerid);
		
		for (ItemSet iset: isetList) {
			iset.setItem(itemDao.selectOne(iset.getItemid()));
		}
		cart.setItems(isetList);
		return cart;
	}
}