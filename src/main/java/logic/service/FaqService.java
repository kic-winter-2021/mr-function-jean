package logic.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import logic.dto.Faq;

@Service
public class FaqService {
	@Autowired
	BoardDao boardDao;

	public int count() {
		return boardDao.countFaq();
	}

	public List<Faq> list() {
		return boardDao.listFaq();
	}

	public void write(Faq faq) {
		boardDao.writeFaq(faq);
	}

}
