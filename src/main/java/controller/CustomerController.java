package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import logic.service.SaleService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@RequestMapping("usermypage")
	public String mypage (HttpSession session) {
		return null;
	}
	@Autowired
	SaleService saleService;
}
