package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.AdPost;
import logic.dto.Customer;
import logic.service.AdminService;
import logic.service.CustomerService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("postlist")
	public ModelAndView postlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<AdPost> list;
		// adpost 테이블을 읽어서 뷰에 전달  (service
		try {
			list = adminService.list();
			mav.addObject("postlist", list);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	//회원정보 리스트 출력하기
	@RequestMapping("user")
	public ModelAndView userlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Customer> list;
			list = customerService.list();
			mav.addObject("userlist",list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//관리자용 회원 정보 수정
	//1. DB회원정보불러오기
	@GetMapping("userupdate")
	public ModelAndView userupdate(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer dbcustomer = customerService.selectOne(id);
		mav.addObject("customer",dbcustomer);
		return mav;
		
	}
	//2. update
	@PostMapping("userupdate")
	public ModelAndView userupdate(Customer customer,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			customerService.update(customer);
			mav.setViewName("redirect:user");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
}
