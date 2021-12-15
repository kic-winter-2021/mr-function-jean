
package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdpostDao;
import logic.dto.AdPost;

@Service
public class AdminService {
	
	@Autowired
	AdpostDao adpostDao;

	public List<AdPost> list() {
		return adpostDao.listAdPost();
	}
	
}

