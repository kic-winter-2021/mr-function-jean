package mapper;

import java.util.List;
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

	@Insert("insert into customer"
			+ " (id, type, password, name, nickname, phoneno, birthday, gender, email,"
			+ " companyno, location)"
			+ " values (#{id}, #{type}, #{password}, #{name}, #{nickname}, #{phoneno}, #{birthday}, #{gender}, #{email},"
			+ " #{companyno}, #{location})")
	void insertSeller(Seller seller);

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
	
	@Select({"<script>",
			"select ${column}",
			"from customer",
			"where email=#{email} and phoneno=#{phoneno}",
			"<if test='id != null'>",
			"and id=#{id} </if>",
		 	"</script>"})
	String search(Map<String, Object> param);

	@Select("select * from customer")
	public List<Customer>listUser();

}
