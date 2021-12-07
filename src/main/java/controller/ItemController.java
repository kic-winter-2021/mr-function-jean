package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 컨트롤러에서 요청 처리 -> RequestMapping, GetMapping, PostMapping, RequestBody..
@Controller
@RequestMapping("item")
public class ItemController {
	
	@GetMapping("detail")
	public String detail() {
		
		return "item/detail";
	}
}
