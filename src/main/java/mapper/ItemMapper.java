package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.Item;

public interface ItemMapper {
	
	@Insert("insert into item"
			+ " (itemid, sellerid, title, price, brandcode, color, fit, content)"
			+ " values (#{itemid}, #{sellerid}, #{title}, #{price}, #{brandcode}, #{color}, #{fit}, #{content})")
	
	public void addItem(Item item);

	@Select("select * from item where itemid=#{value}")
	public Item detail(String itemid);
	
	@Select("select count(*) from item where sellerid=#{sellerid}")
	public int countBySellerid(Map<String, Object> param);
	@Select("select * from item where sellerid=#{sellerid}")
	public List<Item> listBysellerid(Map<String, Object> param);
	@Update("update item set title=#{title}, price=#{price}, brandcode=#{brandcode}, color=#{color}, fit=#{fit}, content=#{content}"
			+ "where itemid=#{itemid}")
	public void update(Item itemid);
	@Delete("delete from item where itemid=#{value}")
	public void delete(String itemid);
}
