package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Notice;

public interface BoardMapper {
	@Select("select count(*) from board where ariticletype=2")
	public int countNotice();
	
	@Select("select * from board where ariticletype=2")
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
	
	@Insert("insert into board "
			+ "(ariticletype, category, title, customerid, content)"
			+ "values (#{type}, #{category}, #{title}, #{writer}, #{content})")
	public void writeNotice(Notice notice);
}
