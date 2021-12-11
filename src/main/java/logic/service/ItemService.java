package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemDao;
import logic.dto.Regist;

/*
 * Item, Review
 */
@Service
public class ItemService {
	@Autowired
	ItemDao itemDao;
	
	public void add(Regist regist) {
		itemDao.addRegist(regist);
	}
}
