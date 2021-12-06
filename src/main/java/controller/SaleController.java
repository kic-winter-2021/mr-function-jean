package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sale")
public class SaleController {
	
	@RequestMapping("userCart")
	public String userCart() {
		return "sale/userCart";
	}
}
