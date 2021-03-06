package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.AdBoard;
import exception.UserException;
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
	
	@RequestMapping("main")
	public String main(HttpSession session) {
		return null;
	}
	@RequestMapping("postlist")
	public ModelAndView postlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<AdPost> list;
		// adpost 테이블을 읽어서 뷰에 전달  (service
		try {
			mav.addObject("listcount", adminService.countAdPost());
			list = adminService.listAdPost();
			mav.addObject("postlist", list);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	//광고등록
	@RequestMapping("adblist")
	public ModelAndView adblist() {
		ModelAndView mav = new ModelAndView();		
		List<AdBoard> adblist;
		try {
			mav.addObject("listcount", adminService.countAdBoard());
			adblist = adminService.listAdBoard();
			mav.addObject("adblist", adblist);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("adbwrite")
	public ModelAndView getAdBoard() {
		ModelAndView mav = new ModelAndView();
		AdBoard adBoard = new AdBoard();
		mav.addObject("adBoard",adBoard);
		return mav;		
	}
	
	@PostMapping("adbwrite")
	public ModelAndView adbwrite(@Valid AdBoard adBoard, BindingResult bresult) {
		System.out.println(adBoard);
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			adminService.insertAdBoard(adBoard);
		}catch(Exception e) {
			e.printStackTrace();
		}		
		mav.setViewName("redirect:adblist");
		return mav;
	}
	@GetMapping({"adbdetail","adbupdate"})
	public ModelAndView adbdetail(Integer num) {
		ModelAndView mav = new ModelAndView();
		AdBoard dbadboard = adminService.selectAdBoardByNum(num);
		mav.addObject("adBoard", dbadboard);
		return mav;
	}
	
	@PostMapping("adbupdate")
	public ModelAndView adbupdate(@Valid AdBoard adBoard, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();	
		Integer num = adBoard.getNum();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			adminService.updateAdBoard(adBoard);	
			mav.setViewName("redirect:adbdetail?num="+adBoard.getNum());
		} catch (Exception e) {
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
	@GetMapping({"userupdate","userdetail"})
	public ModelAndView userupdate(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer dbcustomer = customerService.selectOne(id);
		mav.addObject("customer",dbcustomer);
		return mav;
		
	}
	//2. update
	@PostMapping("userupdate")
	public ModelAndView userupdate(@Valid Customer customer,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			customerService.updateAll(customer);
			mav.setViewName("redirect:user");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	// 회원 강제 탈퇴 
	@RequestMapping("delete")
	public ModelAndView delete(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		//1. 관리자 인지 확인
		Customer dbcustomer = customerService.selectOne(id);
		System.out.println("삭제요청");
		if(!dbcustomer.getId().equals("admin") ) {
			throw new UserException("관리자만 접근 가능합니다","user?id=admin");
		}
		try {
			customerService.delete(id);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:user?id=admin");
		return mav;
	}
	@RequestMapping("stats")
	public String stats(HttpSession session) {
		return null;
	}
}