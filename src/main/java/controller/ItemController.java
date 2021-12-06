package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("item")
public class ItemController {
	
	@RequestMapping("detail")
	public String detail() {//ModelAndView를 사용해도 된다
		return "item/detail";
	}
}
