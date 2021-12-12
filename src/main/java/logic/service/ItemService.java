package logic.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemDao;
import logic.dto.Item;
import logic.dto.Regist;

/*
 * Item, Review
 */
@Service
public class ItemService {
	@Autowired
	ItemDao itemDao;
	
	public void add(Item item) {
		itemDao.addItem(item);
		
	}

	public Item detail(String itemid) {
		return itemDao.detail(itemid);
	}
}
