package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.AdpostDao;
import logic.dto.AdPost;

public class AdminService {
	
	@Autowired
	AdpostDao adpostDao;

	public List<AdPost> postlist() {
		
		return adpostDao.listAdPost();
	}
	
}
