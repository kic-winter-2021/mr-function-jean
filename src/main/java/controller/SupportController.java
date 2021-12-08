package controller;

/* 고객센터, 지원의 요청과 뷰에 대한 컨트롤러
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("support")
public class SupportController {
	// 문의하기
	@GetMapping("q/list")
	public String qeustionlist() {
        System.out.println("support");
		return ("support/q/list");
	}
	@RequestMapping("q/write")
	public String question() {
        return ("support/q/write");
	}
	@RequestMapping("q/writeq")
	public String question2() {
        return ("support/q/writequestion");
	}
	// notice 공지사항
	@RequestMapping("notice/list")
	public String noticelist() {
		return ("support/notice/list");
	}
	@RequestMapping("notice/write")
	public String notice() {
		return ("support/notice/write");
	}
}
