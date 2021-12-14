package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Notice;
import logic.dto.Question;
import logic.dto.Board;
import logic.dto.Faq;
import mapper.BoardMapper;

@Repository
public class BoardDao {
	private final BoardMapper mapper;
	private Map<String, Object> param = new HashMap<String, Object>();
	
	// 생성자 DI
	private BoardDao(SqlSessionTemplate template) {
		mapper = template.getMapper(BoardMapper.class);
	}
	
	public Object countNotice() {
		return mapper.countNotice();
	}

	public List<Notice> listNotice() {
		return mapper.listNotice();
	}
	public void writeNotice(Notice notice) {
		mapper.writeNotice(notice);
	}
	
	public int countQuestion() {
		return mapper.countQuestion();
	}

	public List<Question> listQuestion() {
		return mapper.listQuestion();
	}

	public void writeQuestion(Question question) {
		mapper.writeQuestion(question);
	}

	public int countFaq() {
		return mapper.countFaq();
	}

	public List<Faq> listFaq() {
		return mapper.listFaq();
	}

	public void writeFaq(Faq faq) {
		mapper.writeFaq(faq);
		
	}

	public int countItemQuestionByCustomerId(String customerid) {
		param.clear();
		param.put("customerid", customerid);
		return mapper.countItemQuestion(param);
	}
	public List<Board> listItemQuestionByCustomerId(String customerid) {
		param.clear();
		param.put("customerid", customerid);
		return mapper.listItemQuestion(param);
	}

}
