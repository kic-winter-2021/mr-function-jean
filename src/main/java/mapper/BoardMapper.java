package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.Board;

public interface BoardMapper {
	
	@Insert("insert into board "
			+ "(articletype, category, title, customerid, content)"
			+ "values (#{type}, #{category}, #{title}, #{customerid}, #{content})")
	public void insert(Board board);
	
	@Select("select * from board where num = #{value}")
	public Board selectOne(int boardnum);
	@Select({"<script>",
		"select count(*) from board",
		"<if test='articletype != null'>",
		"where articletype = #{articletype}",
		"</if>",
		"<if test='category != null'>",
		"and category like '%${category}%'",
		"</if>",
		"<if test='searchtype != null and searchcontent !=null'>",
		"and ${searchtype} like '%${searchcontent}%'",
		"</if>",
		"</script>"})
	public int count(Map<String, Object> param);
	
	@Select({"<script>",
			"select * from board",
			"<if test='articletype != null'>",
			"where articletype = #{articletype}",
			"</if>",
			"<if test='category != null'>",
			"and category like '%${category}%'",
			"</if>",
			"<if test='searchtype != null and searchcontent !=null'>",
			"and ${searchtype} like '%${searchcontent}%'",
			"</if>",
			"order by num desc",
			"<if test='startrow != null'>",
			"limit #{startrow}, #{limit}",
			"</if>",
			"</script>"})
	List<Board> list(Map<String, Object> param);
	
	@Update("update board set ")
	public void update(Board board);
	
	@Update("update board set views = views + 1 where num = #{value}")
	public void raiseViews(int boardnum);
	
	@Delete("delete from board where num = #{value}")
	public void delete(int boardnum);
	
	/* item Question & Answer */
	@Select({"<script>",
		"select count(*) from board where articletype = 4",
		"<if test='customerid != null'>and customerid = #{customerid}</if>",
		"</script>"})
	public int countItemQuestion(Map<String, Object> param);
	@Select({"<script>",
		"select count(*) from board where articletype = 4",
		"<if test='customerid != null'>and customerid = #{customerid}</if>",
		"</script>"})
	public List<Board> listItemQuestion(Map<String, Object> param);

	@Insert("insert into board "
			+ "(articletype, category, title, customerid, itemid, content)"
			+ "values (#{type}, #{category}, #{title}, #{customerid}, #{content})")
	public void insertItemQuestion(Board board);

	
}
