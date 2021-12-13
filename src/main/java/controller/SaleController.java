package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Customer;
import logic.dto.Sale;
import logic.dto.Transaction;
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
	
	@RequestMapping("buyInfo")
	public ModelAndView buyInfo(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Sale> list;		
		Transaction quantity = saleService.quantity(id);
		try {
			mav.addObject("salecount", saleService.count(id));
			list = saleService.salelist(id);
			mav.addObject("salelist", list);
			mav.addObject("quantity", quantity);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}