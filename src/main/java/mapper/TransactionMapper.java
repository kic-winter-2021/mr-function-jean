package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.dto.Transaction;

public interface TransactionMapper {
	
	@Select("select * from transaction where saleid=#{value}")
	public List<Transaction> listBySaleid(String saleid);		
		
	

	
	
}
