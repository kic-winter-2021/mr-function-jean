package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.dto.Review;

public interface ItemMapper {

	@Select("select count(*) from itemreview where customerid=#{value}")
	Object countitem(String id);

	@Select("select * from itemreview where customerid=#{value}")
	List<Review> itemreviewlist(String id);

}
