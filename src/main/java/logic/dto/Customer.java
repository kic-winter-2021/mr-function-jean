package logic.dto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Customer {
	@Size(min = 4, max = 30, message = "4~30자의 아이디를 입력해주세요")
	private String id;
	@Min(value=1, message = "사업 유형을 선택하셔야 합니다")
	private int type;
	@Size(min = 4, max = 20, message = "비밀번호는 4 ~ 20자로 입력하여야 합니다")
	private String password;
	@NotEmpty(message = "이름을 입력해주세요")
	private String name;
	@NotEmpty(message = "별명을 입력해주세요")
	private String nickname;
	@NotEmpty(message = "전화번호를 입력해주세요")
	private String phoneno;
	@NotEmpty(message = "이메일을 입력해주세요")
	@Email(message = "이메일을 정확하게 입력해주세요")
	private String email;
	@Min(value=0, message = "성별이 선택되지 않았습니다")
	private int gender;
	@Past
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private int companyno;
	private String personalFilePath;
	private String companyFilePath;
	private MultipartFile personalFile;
	private MultipartFile companyFile;
	private String location;
	private Date signupDate;
	private String authKey; // 관리자용
	private Map<String, String> paymentMap;
	private List<String> destinationList;
	private Cart cart;
	
	public static final int ADMIN = 1;
	public static final int PERSONAL = 2;
	public static final int ONLINE = 3;
	public static final int OFFLINE = 4;
	
	// 라디오 버튼을 위한 seller map
	public static Map<Integer, String> SELLERTYPE;
	
	static {
		SELLERTYPE = new HashMap<>();
		SELLERTYPE.put(3, "온라인"); SELLERTYPE.put(4, "오프라인");
	}
	
	public boolean isAdmin() { return this.type==ADMIN ? true : false; }
	public boolean isPersonal() { return this.type==PERSONAL ? true : false; }
	public boolean isSeller() { return (this.type==ONLINE || this.type == OFFLINE) ? true : false; }
	// TODO: type validator 구현 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getCompanyno() {
		return companyno;
	}
	public void setCompanyno(int companyno) {
		this.companyno = companyno;
	}
	public String getPersonalFilePath() {
		return personalFilePath;
	}
	public void setPersonalFilePath(String personalFilePath) {
		this.personalFilePath = personalFilePath;
	}
	public String getCompanyFilePath() {
		return companyFilePath;
	}
	public void setCompanyFilePath(String companyFilePath) {
		this.companyFilePath = companyFilePath;
	}
	public MultipartFile getPersonalFile() {
		return personalFile;
	}
	public void setPersonalFile(MultipartFile personalFile) {
		this.personalFile = personalFile;
	}
	public MultipartFile getCompanyFile() {
		return companyFile;
	}
	public void setCompanyFile(MultipartFile companyFile) {
		this.companyFile = companyFile;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(Date signupDate) {
		this.signupDate = signupDate;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public Map<String, String> getPaymentMap() {
		return paymentMap;
	}
	public void setPaymentMap(Map<String, String> paymentMap) {
		this.paymentMap = paymentMap;
	}
	public List<String> getDestinationList() {
		return destinationList;
	}
	public void setDestinationList(List<String> destinationList) {
		this.destinationList = destinationList;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", type=" + type + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", phoneno=" + phoneno + ", email=" + email + ", gender=" + gender + ", birthday="
				+ birthday + ", companyno=" + companyno + ", personalFilePath=" + personalFilePath
				+ ", companyFilePath=" + companyFilePath + ", personalFile=" + personalFile + ", companyFile="
				+ companyFile + ", location=" + location + ", signupDate=" + signupDate + ", authKey=" + authKey
				+ ", paymentMap=" + paymentMap + ", destinationList=" + destinationList + ", cart=" + cart + "]";
	}
}
