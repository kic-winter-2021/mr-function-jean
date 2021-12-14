package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.AdPost;
import mapper.AdpostMapper;

@Repository
public class AdpostDao {
	AdpostMapper mapper;
	Map<String, Object> param = new HashMap<>();
	private AdpostDao(SqlSessionTemplate template) {
		mapper = template.getMapper(AdpostMapper.class);
	}
	public void insert(AdPost adpost) {
		mapper.insert(adpost);
	}
	// 아이디로 출력하기
	public void selectById(String sellerid) {
		param.clear();
		param.put("sellerid", sellerid);
		mapper.select(param);
	}
	// 관리자가 전체 페이지를 불러올 경우.
	public void select() {
		param.clear();
		mapper.select(param);
	}
	public List<AdPost> listAdPost() {
		
		return mapper.listAdPost();
	}
}
