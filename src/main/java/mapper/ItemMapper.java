package mapper;

import org.apache.ibatis.annotations.Insert;

import logic.dto.Regist;

public interface ItemMapper {
	
	@Insert("insert into board"
			+ " (id, type, price, title, content, phoneno, email, file)"
			+ " values (#{id}, #{type}, #{price}, #{title}, #{content}, #{phoneno}, #{email}, #{file})")
	public void addRegister(Regist register);

}
