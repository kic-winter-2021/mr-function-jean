package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Notice;

public interface BoardMapper {
	@Select("select count(*) from board where ariticletype=2")
	public int countNotice();
	
	@Select("select * from board where ariticletype=2")
	public List<Notice> listNotice();
}
