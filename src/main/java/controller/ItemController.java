package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// /WEB-INF/view/item/detail.jsp
// 요청 ~ 페이지 또는 뷰
// item/detail 이름의 뷰에만 접근
@Controller
@RequestMapping("item")
public class ItemController {
	// localhost:8090/
	// 도메인 + 요청 => URL
	// localhost:8090/a/b -> /WEB-INF/view/item/detail.jsp
	@RequestMapping("detail")
	public String detail() {
		
		return "item/detail";	// 뷰, 페이지 /WEB-INF/view/item/detail.jsp
	}
}

