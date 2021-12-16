package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Board;
import mapper.BoardMapper;

@Repository
public class BoardDao {
	private final BoardMapper mapper;
	private Map<String, Object> param = new HashMap<String, Object>();
	
	// 생성자 DI
	private BoardDao(SqlSessionTemplate template) {
		mapper = template.getMapper(BoardMapper.class);
	}
	public Board selectOne(int boardnum) {
		return mapper.selectOne(boardnum);
	}
	public int count(int articletype) {
		param.clear();
		param.put("articletype", articletype);
		return mapper.count(param);
	}	
	public int count(int articletype, String category, String searchtype, String searchcontent) {
		param.clear();
		param.put("articletype", articletype);
		param.put("category", category);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return mapper.count(param);
	}	
	public List<Board> list(int articletype) {
		param.clear();
		param.put("articletype", articletype);
		return mapper.list(param);
	}
	// FAQ
	public List<Board> list(int articletype, String category) {
		param.clear();
		param.put("articletype", articletype);
		param.put("category", category);
		return mapper.list(param);
	}
	public List<Board> list(int articletype, int pageNum, int limit, String category, String searchtype, String searchcontent) {
		param.clear();
		param.put("articletype", articletype);
		param.put("category", category);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		
		int startrow = (pageNum - 1) * limit;
		param.put("startrow", startrow);
		param.put("limit", limit);
		return mapper.list(param);
	}
	public void insert(Board board) {
		mapper.insert(board);		
	}
	public void update(Board board) {
		mapper.update(board);
	}
	public void delete(int boardnum) {
		mapper.delete(boardnum);
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
