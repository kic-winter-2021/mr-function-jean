package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.AdBoard;
import mapper.AdboardMapper;

@Repository
public class AdboardDao {
	private AdboardMapper mapper;
	private Map<String,Object> param = new HashMap<String, Object>();
	private AdboardDao(SqlSessionTemplate template) {
		mapper = template.getMapper(AdboardMapper.class);
	}
	
	public int count() {		
		return mapper.count();
	}
	public List<AdBoard> list() {
		param.clear();
		return mapper.select(param);
	}
	public void insert(AdBoard adBoard) {
		mapper.insert(adBoard);	
	}
	public AdBoard selectOneByNum(Integer num) {
		param.clear();
		param.put("num", num);
		List<AdBoard> list = mapper.select(param);
		if (list.size() > 0) return list.get(0);
		return null;
	}
	public void update(AdBoard adBoard) {		
		mapper.update(adBoard);
	}
}
