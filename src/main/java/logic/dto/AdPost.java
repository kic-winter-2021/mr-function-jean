package logic.dto;

// 광고 계약 정보
public class AdPost {
	private int num;
	private String sellerid;
	private int rank;
	private String itemid;
	private String contract;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	@Override
	public String toString() {
		return "AdPost [num=" + num + ", sellerid=" + sellerid + ", rank=" + rank + ", itemid=" + itemid + ", contract="
				+ contract + "]";
	}
}
