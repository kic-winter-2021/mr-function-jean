package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface CartMapper {
	
	@Select("select count(*) from cart where customerid=#{value}")
	public int countCart(String id);
}
