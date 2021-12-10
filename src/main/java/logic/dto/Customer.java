package logic.dto;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Customer {
	@NotNull(message = "아이디를 입력해주세요")
	private String id;
	@NotNull
	private int type;
	@NotNull(message = "비밀번호를 입력해주세요")
	private String password;
	@NotNull(message = "이름을 입력해주세요")
	private String name;
	@NotNull(message = "별명을 입력해주세요")
	private String nickname;
	@NotNull(message = "전화번호를 입력해주세요")
	private String phoneno;
	@NotNull(message = "이메일을 입력해주세요")
	@Email(message = "이메일을 정확하게 입력해주세요")
	private String email;
	@NotNull(message = "성별이 선택되지 않았습니다")
	@Min(value=0, message = "성별이 선택되지 않았습니다")
	private int gender;
	@NotNull(message = "생일을 입력해주세요")
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
	
	public static final int ADMIN = 1;
	public static final int PERSONAL = 2;
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
	@Override
	public String toString() {
		return "Customer [id=" + id + ", type=" + type + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", phoneno=" + phoneno + ", email=" + email + ", gender=" + gender + ", birthday="
				+ birthday + ", companyno=" + companyno + ", personalFilePath=" + personalFilePath
				+ ", companyFilePath=" + companyFilePath + ", personalFile=" + personalFile + ", companyFile="
				+ companyFile + ", location=" + location + ", signupDate=" + signupDate + ", authKey=" + authKey
				+ ", paymentMap=" + paymentMap + ", destinationList=" + destinationList + "]";
	}
}
