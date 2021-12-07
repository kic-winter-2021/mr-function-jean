package controller;

/* 고객센터, 지원의 요청과 뷰에 대한 컨트롤러
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("center")
public class SupportController {
	@GetMapping("question")
	public String detail() {
        System.out.println("center");
		return ("center/question");
	}

}
