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
	public int count() {
		return mapper.count();
	}
	// 관리자가 전체 페이지를 불러올 경우.
	public List<AdPost> list() {
		param.clear();
		return mapper.select(param);
	}
	// 아이디로 출력하기
	public List<AdPost> selectById(String sellerid) {
		param.clear();
		param.put("sellerid", sellerid);
		return mapper.select(param);
	}
	public void insert(AdPost adpost) {
		mapper.insert(adpost);
	}	
}
