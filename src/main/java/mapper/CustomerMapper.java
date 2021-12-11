package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.dto.Customer;

public interface CustomerMapper {
	@Select("select * from customer where id=#{id}")
	Customer selectOneCustomer(String id);
	
	@Insert("insert into customer"
			+ " (id, type, password, name, nickname, phoneno, birthday, gender, email)"
			+ " values (#{id}, #{type}, #{password}, #{name}, #{nickname}, #{phoneno}, #{birthday}, #{gender}, #{email})")
	void insert(Customer customer);

	

	
}
