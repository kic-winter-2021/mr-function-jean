package logic.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

public class Faq {
	private int num;
	@NotNull
	private int type;
	private String category;
	private String title;
	@NotNull
	private String customerid;
	private String itemid;
	@NotNull(message="메시지를 입력하세요")
	private String content;
	private int ref;
	private int qa;
	private Date refDate;
	private Date update;
	private int views;
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
	public Date getRefDate() {
		return refDate;
	}
	public void setRefDate(Date refDate) {
		this.refDate = refDate;
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
		return "Faq [num=" + num + ", type=" + type + ", category=" + category + ", title=" + title + ", customerid="
				+ customerid + ", itemid=" + itemid + ", content=" + content + ", ref=" + ref + ", qa=" + qa
				+ ", refDate=" + refDate + ", update=" + update + ", views=" + views + "]";
	}
	
	
}
