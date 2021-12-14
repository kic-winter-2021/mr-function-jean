package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Customer;
import logic.dto.Review;
import logic.dto.Sale;
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