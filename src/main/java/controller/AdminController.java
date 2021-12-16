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
import logic.dto.AdPost;
import logic.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
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

	//광고등록
	@RequestMapping("adblist")
	public ModelAndView adblist() {
		ModelAndView mav = new ModelAndView();		
		List<AdBoard> adblist;
		try {
			mav.addObject("listcount", adminService.count());
			adblist = adminService.adblist();
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
			adminService.adbwrite(adBoard);
		}catch(Exception e) {
			e.printStackTrace();
		}		
		mav.setViewName("redirect:adblist");
		return mav;
	}
	@GetMapping({"adbdetail","adbupdate"})
	public ModelAndView adbdetail(Integer num) {
		ModelAndView mav = new ModelAndView();
		AdBoard dbadboard = adminService.adbdetail(num);
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
			adminService.adbupdate(num);	
			mav.setViewName("redirect:adbdetail?num="+num);
		}catch(Exception e) {
			e.printStackTrace();
			//throw new UpdateException("광고 수정에 실패 했습니다.","adbupdate");
		}
		return mav;
	}
}
