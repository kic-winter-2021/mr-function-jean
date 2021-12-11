package logic.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Seller {
	@NotNull(message = "아이디를 입력해주세요")
	private String id;//0
	@NotNull
	@Min(value=3)
	private int type;//0
	@NotNull(message = "비밀번호를 입력해주세요")
	private String password;//0
	@NotNull(message = "이름을 입력해주세요")
	private String name;//0
	@NotNull(message = "상호를 입력해주세요")
	private String nickname;//0
	@NotNull(message = "전화번호를 입력해주세요")
	private String phoneno;//0
	@NotNull(message = "이메일을 입력해주세요")
	@Email
	private String email;//0
	private int gender;//0
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;//0
	@NotNull(message = "사업자 번호를 입력해주세요")
	private int companyno;//0
	private String personalFilePath;
	private String companyFilePath;//0
	private MultipartFile personalFile;//0
	private MultipartFile companyFile;//0
	@NotNull(message = "주소를 입력해주세요")
	private String location;//0
	private Date signupDate;
	//private Map<String, String> paymentMap;//구매정보들 db에 기록하기 위해 한것
	//판매자는 구매 안하니 뺌
	//private List<String> destinationList;
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
	/*public Map<String, String> getPaymentMap() {
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
	}*/
	@Override
	public String toString() {
		return "Seller [id=" + id + ", type=" + type + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", phoneno=" + phoneno + ", email=" + email + ", gender=" + gender + ", birthday="
				+ birthday + ", companyno=" + companyno + ", personalFilePath=" + personalFilePath
				+ ", companyFilePath=" + companyFilePath + ", personalFile=" + personalFile + ", companyFile="
				+ companyFile + ", location=" + location + ", signupDate=" + signupDate/* + ", paymentMap=" + paymentMap
				+ ", destinationList=" + destinationList*/ + "]";
	}
}
