package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.dto.AdPost;

public interface AdpostMapper {

	@Insert("insert into adpost"
			+ " (sellerid, adrank, status, itemid, contract)"
			+ " values (#{sellerid}, #{adrank}, #{status}, #{itemid}, #{contract})")
	void insert(AdPost adpost);
	
	@Select({"<script>",
			"select count(*) from adpost",
			"<if test='sellerid != null'> where sellerid = #{sellerid} </if>",
			"</script>"})
	int count(Map<String, Object> param);
	
	@Select({"<script>",
			"select * from adpost",
			"<if test='sellerid != null'> where sellerid = #{sellerid} </if>",
			"</script>"})
	List<AdPost> select(Map<String, Object> param);
	
	
}
