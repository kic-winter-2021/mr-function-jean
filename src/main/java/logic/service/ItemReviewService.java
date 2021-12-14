package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemReviewDao;
import logic.dto.Review;

@Service
public class ItemReviewService {

	@Autowired
	ItemReviewDao itemReviewDao;

	public Object count(String id) {
		return itemReviewDao.countitem(id);
	}

	public List<Review> itemreviewlist(String id) {
		List<Review> itemreviewlist = itemReviewDao.itemreviewlist(id);
		return itemreviewlist;
	}
}
