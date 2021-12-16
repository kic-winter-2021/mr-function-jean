package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdboardDao;
import dao.AdpostDao;
import logic.dto.AdBoard;
import logic.dto.AdPost;

@Service
public class AdminService {
	@Autowired
	AdpostDao adpostDao;
	@Autowired
	AdboardDao adboardDao;
	
	public List<AdPost> list() {
		return adpostDao.listAdPost();
	}
	public int count() {
		return adboardDao.count();
	}

	public List<AdBoard> adblist() {
		return adboardDao.adblist();
	}

	public void adbwrite(AdBoard adBoard) {
		adboardDao.adbwrite(adBoard);
		
	}

	public AdBoard adbdetail(Integer num) {
		return adboardDao.adbdedail(num);
	}

	public void adbupdate(Integer num) {
		adboardDao.adbupdate(num);
	}
}