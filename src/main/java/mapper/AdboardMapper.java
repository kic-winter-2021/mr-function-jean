package mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.AdBoard;

public interface AdboardMapper {

	@Select("select count(*) from adboard where num=1")
	public int count();

	@Select("select * from adboard where num=1")
	public List<AdBoard> adblist();

	@Insert("insert into adboard"
			+ " (num, content, itemid)"
			+ " values (#{num}, #{content}, #{itemid})")
	public void adbwrite(AdBoard adBoard);

	@Select("select * from adboard where num=#{value}")
	public AdBoard adbdetail(Integer num);
	
	@Update("update adboard set content=#{content} where num=#{num}")
	void update(AdBoard adboard);	
}