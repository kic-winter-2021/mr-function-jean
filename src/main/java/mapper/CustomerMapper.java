package mapper;

import java.util.Map;

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

	@Update("update customer set"
			+ " name=#{name}, phoneno=#{phoneno}, email=#{email}"
			+ " where id=#{id}")
	void updateSellerBasic(Seller seller);
	@Update("update customer set"
			+ " companyno=#{companyno}, type=#{type}, nickname=#{nickname}, location=#{location}, companyfile=#{companyFilePath}, personalfile=#{personalFilePath}"
			+ " where id=#{id}")
	void updateCompany(Seller seller);
	
	@Update("update customer set password=#{password} where id=#{id}")
	void updatePassword(Map <String, Object> param);
	
	@Select("select password from customer where id = #{id}")
	String getPasswordById(String id);
	
	@Select("select "
			+ " id, type, password, name, nickname, phoneno, email,"
			+ " companyno, personalfile as personalFilePath, companyfile as companyFilePath, location, created_at as signupDate"
			+ " from customer where id = #{id}")
	Seller selectOneSeller(String sellerid);
}
