package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	@Select("select * from customer where id=#{id}")
	Customer customerSelectOne(String id);

	@Update("update customer set"
			+ " name=#{name}, nickname=#{nickname}, birthday=#{birthday}, gender=#{gender}, email=#{email}, phoneno=#{phoneno}"
			+ " where id=#{id}")
	void userUpdate(Customer customer);

	

	
}
