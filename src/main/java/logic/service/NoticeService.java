package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import logic.dto.Notice;

@Service
public class NoticeService {
	@Autowired
	BoardDao boardDao;

	public Object count() {
		return boardDao.countNotice();
	}

	public List<Notice> list() {
		return boardDao.listNotice();
	}

	public void write(Notice notice) {
		System.out.println(notice);
		boardDao.writeNotice(notice);
	}
}
