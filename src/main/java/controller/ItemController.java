package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("item")
public class ItemController {
	
	@RequestMapping("detail")
	public String detail() {
		return "item/detail";
	}
}
