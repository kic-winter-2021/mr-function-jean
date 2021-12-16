package logic.dto;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class Board {
	private int num;
	@NotNull// input type="hidden"으로 넣어주기
	@Min(value = 0)
	private int type;
	private String category;
	private String title;
	@NotEmpty
	private String customerid;
	private String itemid;
	@NotEmpty(message = "내용을 입력하세요")
	private String content;
	private int ref;
	private int qa;
	private Date created_at;
	private Date updated_at;
	private int views;	// 조회수
	// 한 페이지에 보여질 게시물의 건수
	public static final int PAGESIZE_SMALL = 5; 
	public static final int PAGESIZE = 10;
	
	public static final int FAQ = 1;
	public static final int NOTICE = 2;
	public static final int QUESTION = 3;
	public static final int ITEMQ = 4;
	public static final int ITEMA = 5;
	// 타입 체크 함수
	public boolean isFaq() { return this.type == FAQ ? true : false; }
	public boolean isNotice() { return this.type == NOTICE ? true : false; }
	public boolean isQuestion() { return this.type == QUESTION ? true : false; }
	public boolean isItemQuestion() { return this.type == ITEMQ ? true : false; }
	public boolean isItemAnswer() { return this.type == ITEMA ? true : false; }
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
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
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
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", type=" + type + ", category=" + category + ", title=" + title + ", customerid="
				+ customerid + ", itemid=" + itemid + ", content=" + content + ", ref=" + ref + ", qa=" + qa
				+ ", created_at=" + created_at + ", updated_at=" + updated_at + ", views=" + views + "]";
	}
}