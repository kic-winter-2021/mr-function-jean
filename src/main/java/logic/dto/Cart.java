package logic.dto;

import java.util.List;

public class Cart {
	private String customerid;
	// itemid, quantity
	private List<ItemSet> items;
	// private Map<String, Integer> cartmap;
	
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public List<ItemSet> getItems() {
		return items;
	}
	public void setItems(List<ItemSet> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Cart [customerid=" + customerid + ", items=" + items + "]";
	}
}
