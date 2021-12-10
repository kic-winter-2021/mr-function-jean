package logic.dto;

import java.util.Map;

public class Cart {
	private String customerid;
	// itemid, quantity
	private Map<String, Integer> cartmap;
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public Map<String, Integer> getCartmap() {
		return cartmap;
	}
	public void setCartmap(Map<String, Integer> cartmap) {
		this.cartmap = cartmap;
	}
	@Override
	public String toString() {
		return "Cart [customerid=" + customerid + ", cartmap=" + cartmap + "]";
	}
}
