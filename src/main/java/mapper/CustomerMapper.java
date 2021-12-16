package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.dto.Customer;
import logic.dto.Seller;

public interface CustomerMapper {
	/* Select */
	@Select("select * from customer where id=#{id}")
	Customer selectOne(String id);
	
	@Select("select "
			+ " id, type, password, name, nickname, phoneno, email,"
			+ " companyno, personalfile as personalFilePath, companyfile as companyFilePath, location, created_at as signupDate"
			+ " from customer where id = #{id}")
	Seller selectOneSeller(String sellerid);
	
	@Select("select password from customer where id = #{id}")
	String getPasswordById(String id);
	
	@Select({"<script>",
		"select ${column}",
		"from customer",
		"where email=#{email} and phoneno=#{phoneno}",
		"<if test='id != null'>",
		"and id=#{id} </if>",
	 	"</script>"})
	String search(Map<String, Object> param);
	
	/* Insert */
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
	
	/* Update */
	@Update("update customer set"
			+ " name=#{name}, nickname=#{nickname}, birthday=#{birthday}, gender=#{gender}, email=#{email}, phoneno=#{phoneno}"
			+ " where id=#{id}")
	void update(Customer customer);
	
	@Update("update customer set password=#{password} where id=#{id}")
	void updatePassword(Map <String, Object> param);
	
	@Update("update customer set"
			+ " name=#{name}, phoneno=#{phoneno}, email=#{email}"
			+ " where id=#{id}")
	void updateSellerBasic(Seller seller);
	
	@Select("select " 
			+ "id, type, phoneno, email, birthday, gender, password, name, nickname, companyno"
			+ " from customer")
	public List<Customer> listUser();

	@Update("update customer set"
			+ " companyno=#{companyno}, type=#{type}, nickname=#{nickname}, location=#{location}, companyfile=#{companyFilePath}, personalfile=#{personalFilePath}"
			+ " where id=#{id}")
	void updateCompany(Seller seller);
	@Update("update customer set"
			+ " id=#{id}, password=#{password}, name=#{name}, nickname=#{nickname}, phoneno=#{phoneno}, email=#{email}, gender=#{gender}, birthday=#{birthday}, companyno=#{companyno}, type=#{type}"
			+ " where id=#{id}")
	public void userupdate();
	@Delete("set foreign_key_checks = 0"
			+ " delete from customer where id=#{value}"
			+ " set foreign_key_checks = 1")
	public void delete(String id);
	
}
