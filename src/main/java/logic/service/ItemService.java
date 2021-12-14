package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemDao;
import logic.dto.Review;
import logic.dto.Sale;

/*
 * Item, Review
 */
@Service
public class ItemService {

	@Autowired
	ItemDao itemDao;

	public Object count(String id) {
		return itemDao.countitem(id);
	}

	public List<Review> itemreviewlist(String id) {
		List<Review> itemreviewlist = itemDao.itemreviewlist(id);
		return itemreviewlist;
	}
}
