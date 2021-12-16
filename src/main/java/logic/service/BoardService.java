package logic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import logic.dto.Board;

/*
 * 통합게시판(일반, 공지사항, FAQ), Ad 관리
 */
@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;
	
	public void insert(Board board) {
		boardDao.insert(board);
	}
	// count & list
	public int count(int articletype) {
		return boardDao.count(articletype);
	}
	public int count(int articletype, String category) { // FAQ without paging
		return boardDao.count(articletype, category, null, null);
	}
	public int count(int articletype, String category, String searchtype, String searchcontent) {
		return boardDao.count(articletype, category, searchtype, searchcontent);
	}	
	public List<Board> list(int articletype) {
		return boardDao.list(articletype);
	}
	public List<Board> list(int articletype, String category) { // FAQ without paging
		return boardDao.list(articletype, category);
	}
	public List<Board> list(int articletype, int pageNum, int limit, String category, String searchtype, String searchcontent) {
		return boardDao.list(articletype, pageNum, limit, category, searchtype, searchcontent);
	}
	public Board selectOne(int boardnum) {
		return boardDao.selectOne(boardnum);
	}

	public void update(Board board) {
		boardDao.update(board);
	}
	public void delete(int boardnum) {
		boardDao.delete(boardnum);
	}
}
