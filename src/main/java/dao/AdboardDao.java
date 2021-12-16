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
	public List<AdBoard> adblist() {
		return mapper.adblist();
	}

	public void adbwrite(AdBoard adBoard) {
		mapper.adbwrite(adBoard);
		
	}

	public AdBoard adbdedail(Integer num) {
		return mapper.adbdetail(num);
	}

	public void adbupdate(Integer num) {
		param.clear();
		mapper.adbupdate(num);
	}

	

}
