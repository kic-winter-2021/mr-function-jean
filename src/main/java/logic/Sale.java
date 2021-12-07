package logic;

import java.util.Date;

/*
 */
public class Sale {
	private String saleid;
	private String buyerid;
	private String destination;
	private String receiver;
	private String invoice;
	private Date saledate;
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public Date getSaledate() {
		return saledate;
	}
	public void setSaledate(Date saledate) {
		this.saledate = saledate;
	}
	@Override
	public String toString() {
		return "Sale [saleid=" + saleid + ", buyerid=" + buyerid + ", destination=" + destination + ", receiver="
				+ receiver + ", invoice=" + invoice + ", saledate=" + saledate + "]";
	}
}