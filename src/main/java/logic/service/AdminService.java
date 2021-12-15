package logic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdboardDao;
import logic.dto.AdBoard;

@Service
public class AdminService {
	@Autowired
	AdboardDao adboardDao;

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

	public void adbupdate(AdBoard adBoard) {
		adboardDao.adbupdate(adBoard);
	}

}
