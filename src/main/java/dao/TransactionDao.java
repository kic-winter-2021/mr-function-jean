package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import logic.dto.Transaction;
import mapper.TransactionMapper;

@Repository
public class TransactionDao {
	private TransactionMapper mapper;
	private Map<String,Object> param = new HashMap<>();
	private TransactionDao(SqlSessionTemplate template) {
		mapper = template.getMapper(TransactionMapper.class);
	}
	
	public List<Transaction> listBySaleid(String saleid) {
		return mapper.listBySaleid(saleid);
	}
	
	
}
