package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import logic.dto.Question;

@Service
public class QuestionService {
	@Autowired
	BoardDao boardDao;
	
	public int count() {
		return boardDao.countQuestion();
	}

	public List<Question> list() {
		return boardDao.listQuestion();
	}

	public void write(Question question) {
		boardDao.writeQuestion(question);
	}

}
