package logic.dto;

import java.util.Date;

// 광고게시판
public class AdBaord {
	private int num;
	private String content;
	private String itemid;
	private Date regDate;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "AdBaord [num=" + num + ", content=" + content + ", itemid=" + itemid + ", regDate=" + regDate
				+ ", views=" + views + "]";
	}
}
