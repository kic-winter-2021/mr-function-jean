package mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Select;
import logic.dto.Sale;

public interface SaleMapper {

	@Select({"<script>",
		"select count(*) from sale",
		"<if test='customerid != null'> where buyerid=#{customerid} </if>",
		"</script>"})
	public int count(Map<String, Object> param);

	@Select({"<script>",
		"select * from sale",
		"<if test='customerid != null'> where buyerid=#{customerid} </if>",
		"</script>"})
	public List<Sale> list(Map<String, Object> param);		

}
