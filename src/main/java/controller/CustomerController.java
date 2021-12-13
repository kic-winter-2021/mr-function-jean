package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Customer;
import logic.dto.Sale;
import logic.service.SaleService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	SaleService saleService;
	
	
	
	
	
}
