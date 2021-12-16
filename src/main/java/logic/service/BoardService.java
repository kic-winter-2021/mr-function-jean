package logic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;

/*
 * 통합게시판(일반, 공지사항, FAQ), Ad 관리
 */
@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;
	
}
