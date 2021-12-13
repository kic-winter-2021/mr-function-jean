package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.dto.Sale;
import logic.dto.Transaction;

public interface SaleMapper {

	
		@Select("select count(*) from cart where customerid=#{value}")
		public int countSale(String id);

		@Select("select * from sale where buyerid=#{value}")
		public List<Sale> salelist(String id);

		@Select("select * from transaction where quantity=#{quantity}")
		public Transaction quantity(String id);

		

}
