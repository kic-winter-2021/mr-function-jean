package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import logic.dto.Board;

@Service
public class ItemQuestionService {

	@Autowired
	BoardDao boardDao;

	public Object questioncount(String id) {		
		return boardDao.questioncount(id);
	}

	public List<Board> listquestion(String id) {
		List<Board> listquestion = boardDao.listquestion(id);
		return listquestion;
	}
	

}
