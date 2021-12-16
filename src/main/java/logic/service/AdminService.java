package logic.service;

import java.util.List;

import javax.validation.Valid;

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
	
	/* AdPost */
	public int countAdPost() {
		return adpostDao.count();
	}
	public List<AdPost> listAdPost() {
		return adpostDao.list();
	}
	
	/* AdBoard */
	public int countAdBoard() {
		return adboardDao.count();
	}
	public List<AdBoard> listAdBoard() {
		return adboardDao.list();
	}
	public AdBoard selectAdBoardByNum(Integer num) {
		return adboardDao.selectOneByNum(num);
	}
	public void insertAdBoard(AdBoard adBoard) {
		adboardDao.insert(adBoard);
		
	}
	public void updateAdBoard(AdBoard adBoard) {
		adboardDao.update(adBoard);
	}
}