package logic.dto;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

// 광고게시판
public class AdBoard {
	@NotEmpty
	private int num;
	@NotEmpty
	private String content;
	@NotEmpty
	private String itemid;
	private Date regDate;
	private Date expDate;
	private int views;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "AdBaord [num=" + num + ", content=" + content + ", itemid=" + itemid + ", regDate=" + regDate
				+ ", expDate=" + expDate + ", views=" + views + "]";
	}
}
