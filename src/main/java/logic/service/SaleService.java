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

	public List<Sale> salelist(String id) {
		List<Sale> salelist = saleDao.salelist(id);
		//salelist
		//saleid...
		
		//transaction 리스트를 추가
		
		//List<Transaction> saleitemlist = null;
		for(Sale s : salelist) {
			
			s.setTranlist(transactionDao.listBySaleid(s.getSaleid()));			
		}
		return salelist;
	}

	public Object count(String id) {		
		return saleDao.countSale(id);
		
	}	


	

	

	

}
