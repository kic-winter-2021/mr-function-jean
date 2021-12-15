package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface CartMapper {
	
	@Select("select count(*) from cart where customerid=#{value}")
	public int count(String customerid);
	
	@Select("select itemid, quantity from cart where customerid=#{value}")
	public Map<String, Integer> select(String customerid);
}
