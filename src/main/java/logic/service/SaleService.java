package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SaleDao;
import logic.dto.Customer;
import logic.dto.Sale;

/*
 * Sale, Transaction 관리
 */
@Service
public class SaleService {
	@Autowired
	SaleDao saleDao;

	public List<Sale> salelist(String id) {
		return saleDao.salelist(id);
	}
	

	

	

	

}
