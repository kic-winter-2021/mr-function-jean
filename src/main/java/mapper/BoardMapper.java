package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
}
