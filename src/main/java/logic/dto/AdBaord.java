package logic.dto;

import java.util.Date;

// 광고게시판
public class AdBaord {
	private int num;
	private String content;
	private String itemid;
	private Date registration;
	private Date expiration;
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
	public Date getRegistration() {
		return registration;
	}
	public void setRegistration(Date registration) {
		this.registration = registration;
	}
	public Date getExpiration() {
		return expiration;
	}
	public void setExpiration(Date expiration) {
		this.expiration = expiration;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "AdBaord [num=" + num + ", content=" + content + ", itemid=" + itemid + ", registration=" + registration
				+ ", expiration=" + expiration + ", views=" + views + "]";
	}
}
