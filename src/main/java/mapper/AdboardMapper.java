package mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.AdBoard;

public interface AdboardMapper {

	@Select("select count(*) from adboard")
	public int count();
	@Select({"<script>",
		"select * from adboard",
		"<if test='num != null'>where num = #{num}</if>",
		"</script>"})
	public List<AdBoard> select(Map<String, Object> param);

	@Insert("insert into adboard"
			+ " (num, content, itemid)"
			+ " values (#{num}, #{content}, #{itemid})")
	public void insert(AdBoard adBoard);

	@Update("update adboard set content=#{content} where num=#{num}")
	public void update(AdBoard adboard);	
}