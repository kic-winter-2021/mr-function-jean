package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		// adpost 테이블을 읽어서 뷰에 전달  (service
		try {
			List<AdPost> list = adminService.postlist();
			mav.addObject("postlist", list);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
}
