package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import logic.service.SaleService;

@Controller
@RequestMapping("sale")
public class SaleController {
	@Autowired
	SaleService saleService;
	
	@RequestMapping("userCart")
	public String userCart() {
		return "sale/userCart";
	}
	
	@RequestMapping("nonUserCart")
	public String nonUserCart() {
		return "sale/nonUserCart";
	}
}