package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.dto.ItemSet;

public interface CartMapper {
	
	@Select("select count(*) from cart where customerid=#{value}")
	public int count(String customerid);
	
	@Select("select itemid, quantity from cart where customerid=#{value}")
	public List<ItemSet> select(String customerid);
}
