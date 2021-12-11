package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.dto.Customer;
import logic.dto.Seller;

public interface CustomerMapper {
	@Select("select * from customer where id=#{id}")
	Customer selectOneCustomer(String id);
	
	@Insert("insert into customer"
			+ " (id, type, password, name, nickname, phoneno, birthday, gender, email)"
			+ " values (#{id}, #{type}, #{password}, #{name}, #{nickname}, #{phoneno}, #{birthday}, #{gender}, #{email})")
	void insert(Customer customer);
	
	@Insert("insert into customer"
			+ " (id, type, password, name, nickname, phoneno, birthday, gender, email,"
			+ " companyno, location)"
			+ " values (#{id}, #{type}, #{password}, #{name}, #{nickname}, #{phoneno}, #{birthday}, #{gender}, #{email},"
			+ " #{companyno}, #{location})")
	void insertSeller(Seller seller);

	

	
}
