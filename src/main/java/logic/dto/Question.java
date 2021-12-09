package logic.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

public class Question {
	public static int TYPE = 3; // 문의하기 타입
	private int num;
	@NotNull // input type="hidden"으로 넣어주기
	private int type;
	private String category;
	private String title;
	@NotNull
	private String writer;
	@NotNull(message = "내용을 입력하세요")
	private String content;
	private int ref;
	private int qa;
	private Date regDate;
	private Date update;
	private int views;	// 조회수
	
	{ type=TYPE; qa=0; } // qa = 0 답변이 달리지 않은 질문
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getQa() {
		return qa;
	}
	public void setQa(int qa) {
		this.qa = qa;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Question [num=" + num + ", type=" + type + ", category=" + category + ", title=" + title + ", writer="
				+ writer + ", content=" + content + ", ref=" + ref + ", qa=" + qa + ", regDate=" + regDate + ", update="
				+ update + ", views=" + views + "]";
	}
}
