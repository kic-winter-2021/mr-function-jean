package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.dto.Faq;


public interface FaqMapper {
	@Select("select count(*) from board where articletype=?")
	public int countNotice();
	
	@Select("select * from board where articletype=?")
	public List<Faq> listNotice();
}
