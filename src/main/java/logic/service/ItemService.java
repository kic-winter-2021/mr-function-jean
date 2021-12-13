package logic.service;

import java.util.List;

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

	public Object count() {
		return itemDao.countItem();
	}

	public List<Item> list(List<Item> sellerid){ 
		return itemDao.listitem(sellerid);
	}

}
