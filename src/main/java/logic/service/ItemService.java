package logic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

	public int count(String sellerid) {
		return itemDao.countBySellerid(sellerid);
	}

	public List<Item> list(String sellerid){ 
		return itemDao.listBySellerid(sellerid);
	}
	public void update(Item item) {
		itemDao.update(item);
	}

}
