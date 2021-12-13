package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.dto.Item;

public interface ItemMapper {

	@Select({"select * from item",
			"<if test='sellerid != null'> where sellerid=#{sellerid}</if>"
			})
	List<Item> select(Map<String, Object> param); 

}
