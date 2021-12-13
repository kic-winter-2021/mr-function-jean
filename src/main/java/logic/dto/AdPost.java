package logic.dto;

import java.util.HashMap;
import java.util.Map;

import javax.validation.constraints.NotNull;

// 광고 계약 정보
public class AdPost {
	private int num;
	@NotNull(message = "판매자 정보가 없습니다")
	private String sellerid;
	@NotNull(message = "프로모션을 선택해주세요")
	private int rank;
	@NotNull
	private int status;
	@NotNull(message = "프로모션할 상품을 선택해주세요")
	private String itemid;
	private String contract;
	// 상수값 등록
	public static Map<Integer, String> RANK = new HashMap<>();
	public static Map<Integer, String> STATUS = new HashMap<>();
	static {
		RANK.put(1, "브론즈"); RANK.put(2, "실버");
		RANK.put(3, "골드"); RANK.put(4, "플레티넘");
		STATUS.put(0, ""); STATUS.put(1, "preparing");
		STATUS.put(2, "prepared"); STATUS.put(3, "running");
		STATUS.put(4, "expired");
	}
	
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
		return "AdPost [num=" + num + ", sellerid=" + sellerid + ", rank=" + rank + ", status=" + status + ", itemid="
				+ itemid + ", contract=" + contract + "]";
	}
}
