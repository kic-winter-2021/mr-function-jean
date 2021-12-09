package logic.dto;

import java.util.Date;

public class Transaction {
	private int num;
	private int type;       // 입고 출고 구분.
	private String saleid;
	private String itemid;
	private Date date;
	private int quantity;
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
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Transaction [num=" + num + ", type=" + type + ", saleid=" + saleid + ", itemid=" + itemid + ", date="
				+ date + ", quantity=" + quantity + "]";
	}
}
