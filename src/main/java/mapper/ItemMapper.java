package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.Item;

public interface ItemMapper {
	
	@Select({"<script>",
		"select * from item",
		"<if test='sellerid != null'> where sellerid=#{sellerid}</if>",
		"<if test='itemid != null'> where itemid=#{itemid}</if>",
		"</script>"})
	List<Item> select(Map<String, Object> param); 
	
	@Insert("insert into item"
			+ " (itemid, sellerid, title, price, brandcode, color, fit, content)"
			+ " values (#{itemid}, #{sellerid}, #{title}, #{price}, #{brandcode}, #{color}, #{fit}, #{content})")
	
	void addItem(Item item);
	
	@Select("select count(*) from item where sellerid=#{sellerid}")
	int countBySellerid(Map<String, Object> param);
	
	@Select("select * from item where sellerid=#{sellerid}")
	List<Item> listBySellerid(Map<String, Object> param);
	
	@Update("update item set title=#{title}, price=#{price}, brandcode=#{brandcode}, color=#{color}, fit=#{fit}, content=#{content}"
			+ "where itemid=#{itemid}")
	void update(Item itemid);
	
	@Delete("delete from item where itemid=#{value}")
	void delete(String itemid);
}
