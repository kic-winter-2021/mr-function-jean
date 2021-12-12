package mapper;

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

}
