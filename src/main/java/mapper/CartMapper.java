package mapper;

import org.apache.ibatis.annotations.Select;

public interface CartMapper {
	
	@Select("select count(*) from cart where quantity=#{quantity}")
	public int countCart();
}
