package mapper;

import org.apache.ibatis.annotations.Update;

import logic.dto.AdBoard;

public interface AdboardMapper {
	
	@Update("update adboard set content=#{content} where num=#{num}")
	void update(AdBoard adboard);	
}
