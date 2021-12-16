package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.dto.Board;
import logic.dto.Faq;
import logic.dto.Notice;
import logic.dto.Question;

public interface BoardMapper {
	@Select("select count(*) from board where articletype=2")
	public int countNotice();
	
	@Select("select * from board where articletype=2")
	public List<Notice> listNotice();

	/*
	 * 	/*
	 * 	private int type;
	private String category;
	private String title;
	@NotNull
	private String writer;
	@NotNull(message = "내용을 입력하세요")
	private String content;
	 */
	
	@Insert("insert into board"
			+ " (articletype, category, title, customerid, content)"
			+ " values (#{type}, #{category}, #{title}, #{writer}, #{content})")
	public void writeNotice(Notice notice);
	
	@Select("select count(*) from board where articletype=3")
	public int countQuestion();
	
	@Select("select * from board where articletype=3")
	public List<Question> listQuestion();

	@Insert("insert into board"
			+ " (articletype, category, title, customerid, content)"
			+ " values (#{type}, #{category}, #{title}, #{writer}, #{content})")
	public void writeQuestion(Question question);
	/*
	 * @Select("select * from") public int countFaq();
	 * 
	 * public void writeFaq();
	 */
	@Select("select count(*) from board where articletype=1")
	public int countFaq();
	@Select("select * from board where articletype=1")
	public List<Faq> listFaq();

	@Insert("insert into board "
			+ "(articletype, category, title, customerid, content)"
			+ "values (#{type}, #{category}, #{title}, #{writer}, #{content})")
	public void writeFaq(Faq faq);

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
}
