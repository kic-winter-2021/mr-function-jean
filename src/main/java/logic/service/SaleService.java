package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SaleDao;
import dao.TransactionDao;
import logic.dto.Sale;
import logic.dto.Transaction;

/*
 * Sale, Transaction 관리
 */
@Service
public class SaleService {
	@Autowired
	SaleDao saleDao;
	@Autowired
	TransactionDao transactionDao;

	public List<Sale> listByCustomerId(String customerid) {
		List<Sale> salelist = saleDao.listByCustomerId(customerid);
		//salelist
		//saleid...
		
		//transaction 리스트를 추가
		
		//List<Transaction> saleitemlist = null;
		for(Sale s : salelist) {
			
			s.setTranlist(transactionDao.listBySaleid(s.getSaleid()));			
		}
		return salelist;
	}

	public int count(String customerid) {		
		return saleDao.countByCustomerId(customerid);
	}	


	

	

	

}
