package logic.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

public class Regist {
	@NotNull(message="아이디를 입력하세요")
	private String id;
	@NotNull
	private int type;
	@NotNull(message="가격을 입력하세요")
	private int price;
	@NotNull(message="제목을 입력하세요")
	private String title;
	@NotNull(message="내용을 입력하세요")
	private String content;
	@NotNull(message="전화번호를 입력하세요")
	private String phoneno;
	@NotNull(message="이메일 입력하세요")
	@Email
	private String email;
	@NotNull(message="파일을 첨부하세요")
	private String file;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "Register [id=" + id + ", type=" + type + ", price=" + price + ", title=" + title + ", content="
				+ content + ", phoneno=" + phoneno + ", email=" + email + ", file=" + file + "]";
	}
	
}
