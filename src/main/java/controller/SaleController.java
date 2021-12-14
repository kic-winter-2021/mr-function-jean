package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.SigninException;
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
	
	@RequestMapping("buyInfo")
	public ModelAndView buyInfo(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//본인 또는 admin만 이페이지를 열 수 있게 검사
		String sessionid = ((Customer)session.getAttribute("signinCustomer")).getId();
		if(!id.equals(sessionid) && id.equals("admin")) {
			throw new SigninException("본인의 주문목록만 열람가능합니다.","usermypage");			
		}
		List<Sale> list;		
		try {
			mav.addObject("salecount", saleService.count(id));
			list = saleService.salelist(id);
			mav.addObject("salelist", list);
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return mav;
	}
	
}