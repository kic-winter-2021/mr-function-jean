package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.dto.Review;

public interface ItemReviewMapper {

	@Select({"<script>",
		"select count(*) from itemreview",
		"<if test='customerid != null'>where customerid = #{customerid}</if>",
		"</script>"})
	int count(Map<String, Object> param);
	
	@Select({"<script>",
		"select count(*) from itemreview",
		"<if test='customerid != null'>where customerid = #{customerid}</if>",
		"</script>"})
	List<Review> list(Map<String, Object> param);
}
