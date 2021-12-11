package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.Board;
import logic.Notice;
import logic.dto.Faq;
import mapper.BoardMapper;

@Repository
public class BoardDao {
	private final BoardMapper mapper;
	private Map<String, Object> param = new HashMap<String, Object>();
	// 생성자
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

	public int countFaq() {
		return mapper.countFaq();
	}

	public List<Faq> listFaq() {
		mapper.writeFaq();
	}

}
