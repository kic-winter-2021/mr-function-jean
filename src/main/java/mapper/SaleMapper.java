package mapper;

import org.apache.ibatis.annotations.Select;

public interface SaleMapper {

	
		@Select("select count(*) from cart where customerid=#{value}")
		public int countSale(String id);
	

}
