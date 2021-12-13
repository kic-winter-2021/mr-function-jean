package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.dto.Item;
import logic.dto.Regist;

public interface ItemMapper {
	
	@Insert("insert into item"
			+ " (itemid, sellerid, title, price, brandcode, color, fit)"
			+ " values (#{itemid}, #{sellerid}, #{title}, #{price}, #{brandcode}, #{color}, #{fit})")
	
	public void addItem(Item item);

	@Select("select * from item where itemid=#{value}")
	public Item detail(String itemid);
	
	@Select("select count(*) from item where sellerid=#{sellerid}")
	public int countBySellerid(Map<String, Object> param);
	@Select("select * from item" + " where sellerid=#{sellerid}")
	public List<Item> listBysellerid(Map<String, Object> param);
}
