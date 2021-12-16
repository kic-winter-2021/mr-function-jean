package controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import exception.UserException;
import exception.ItemException;
import exception.UpdateException;

import logic.dto.Item;
import logic.dto.AdPost;
import logic.dto.Customer;
import logic.service.CustomerService;
import logic.service.ItemService;
import logic.service.SellerService;

@Controller
@RequestMapping("seller")
public class SellerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	SellerService sellerService;
	@Autowired
	ItemService itemService;
	
	@GetMapping("*")	// 
	public ModelAndView info(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("customer", new Customer());
		return mav;
	}
	@GetMapping({"upbasic", "upseller"})
	public ModelAndView updateLoader(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String signinId = ((Customer)session.getAttribute("signinUser")).getId();
			Customer dbCustomer = customerService.selectOne(signinId);
			session.setAttribute("signinUser", dbCustomer);
			mav.addObject("customer", dbCustomer);
		} catch (NullPointerException e) {
			System.out.println("로그인 세션 종료");
			throw new UserException("로그아웃 상태입니다", "/customer/account/signin?t=s");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;		
	}
	// TODO: 사용자 정보 변경
	@PostMapping("upbasic")
	public ModelAndView updateBasic(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1) 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Errors in updateBasic: " + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// 2) 세션 정보로 DB 불러오기
		try {
			customerService.update(customer); // TODO: 업데이트 기능 점검
			Customer dbSeller = customerService.selectOne(customer.getId());
			session.setAttribute("signinUser", dbSeller); // 세션 갱신
			System.out.println("개인정보 업데이트 성공\n"  + dbSeller);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:myinfo");
		return mav;
	}

	@PostMapping("upcompany")
	public ModelAndView updateCompany(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1) 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Errors in updateCompany: " + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			// 업데이트
			sellerService.updateCompany(customer);
			Customer dbSeller = customerService.selectOne(customer.getId());
			session.setAttribute("signinUser", dbSeller); // 세션 갱신
			System.out.println("사업자 업데이트 성공\n"  + dbSeller);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:myinfo");
		return mav;
	}
	
	/* 비밀번호 변경 */
	@GetMapping("updatepassword")
	public ModelAndView updatePassword(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = null;
		try {
			id = ((Customer)session.getAttribute("signinUser")).getId();
			mav.addObject(customerService.getPasswordById(id));
		} catch (NullPointerException e) {
			System.out.println("로그인 세션 종료");
			throw new UserException("로그아웃 상태입니다", "/customer/account/signin");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@PostMapping("updatepw")
	public ModelAndView updatePassword(@RequestParam Map<String, String> req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String newpw = req.get("newpw");
		// 비밀번호 검사
		Customer signin = (Customer)session.getAttribute("signinUser");
		
		try {
			// 이전 비밀번호 비교 -> js로 처리
			//String oldpw = req.get("oldpw");
			customerService.updatePassword(signin.getId(), newpw);
			// 세션 갱신
			session.setAttribute("signinUser", signin);
			System.out.println(signin.getId() + " 비밀번호 변경(" + req.get("oldpw") + " -> " + newpw + ")");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:myinfo");
		return mav;
	}
	/* promotion */
	@GetMapping("applyprom")
	public ModelAndView applypromLoader(Integer rank, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 선택한 광고 상품이 있는 경우 해당 상품을 선택한 상태로 이동.
		AdPost adPost = new AdPost();
		if(rank != null) adPost.setRank(rank);
		mav.addObject("adPost", adPost);
		// rank map(static map) 라디오 버튼 생성
		mav.addObject("RANK", AdPost.RANK);
		
		// 판매자 아이템 리스트를 받아와 모델에 넣기
		try {
			String signinId = ((Customer)session.getAttribute("signinUser")).getId();
			List<Item> itemlist =  sellerService.getItemList(signinId);
			mav.addObject("itemlist", itemlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("applyprom")
	public ModelAndView applyprom(@Valid AdPost adPost, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("프로모션 신청 입력 오류");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// 광고 보드 입력
		try {
			sellerService.apply(adPost);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 판매자 페이지로 이동
		mav.setViewName("redirect:main");
		return mav;
	}

	// TODO: 물품 등록 열기
	@GetMapping("register")
	public ModelAndView register(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("item", new Item()); // 문자열 (키값/벨류값)
		return mav;
	}
	
	@PostMapping("register")// 동일한 요청이 있을시에 POST / GET / 나뉘어서 받음
	public ModelAndView registerForm(@Valid Item item,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(bresult.hasErrors()) {
			System.out.println("상품을 등록해주세요" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			itemService.add(item);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.setViewName("redirect:registl?id=" + "admin");
		return mav;
	}
	//seller/saledetail?itemid=1234
	//리스트 페이지 선택 -> 상세정보
	//
	
	@GetMapping({"saledetail","detailupdate"})
	public ModelAndView saledetail(String itemid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item dbItem = itemService.selectOne(itemid);
		mav.addObject("item", dbItem);
		return mav;
	}
	//등록 상품 내용 수정하기 21.12.13
	
	//유효성 검사
	//update
	@PostMapping("detailupdate")
	public ModelAndView detailupdate(@Valid Item item,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String itemid = item.getItemid();
		//유효성 검사
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		//아이디 검사. 세션에 있는 seller랑 item seller 비교
			
		// Seller signin = (Customer)session.getAttribute("signinUser");
		// hidden으로 받은 seller id
		if(!item.getSellerid().equals("admin")) { //signin.getId()
			throw new UpdateException("수정은 상품을 등록한 사업자만 가능합니다","saledetail");
		}
		//update
		String urlItemid =null;
		try {
			 urlItemid = URLEncoder.encode(itemid, "UTF-8");
			itemService.update(item);
			mav.setViewName("redirect:saledetail?itemid="+urlItemid);
		}catch(Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 수정을 실패 했습니다.","detailupdate?itemid="+urlItemid);
		}
		return mav;
	}
	// delete 구현
	
	@RequestMapping("delete")
	public ModelAndView delete(String itemid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//1. itemid가 있는지 확인한다.
		Item dbItem = itemService.selectOne(itemid);
		if(dbItem == null) {
			throw new ItemException("게시글 삭제를 실패했습니다.","registl?id=admin"); //우선 admin처리
		}
		//2. itemid의 주인과 session의 id랑 같은지
		
		//String signin = ((Customer)session.getAttribute("signinUser"));
		if (!dbItem.getSellerid().equals("admin")) { //signin.getId()
			throw new UpdateException("게시글 삭제를 실패 했습니다.","registl?id=admin"); //우선 admin처리
		}//3. 삭제
	try {
		itemService.delete(itemid);
	}catch(Exception e) {
		e.printStackTrace();
	}
	// 4.목록 이동
	mav.setViewName("redirect:registl?id=admin"); //signin.getId()
	return mav;
	}
	
	//registlist 구현
	/*
	 * 판매자 아이디에 대해서 등록한 상품 보기
	 * 필요한 입력 :sellerid
	 * 그럼 어디서? 1. GET요청의 파라미터
	 * 			2. 어차피 seller로 로그인 되어있으므로 session의 아이디를 받는다.
	 * 컨트롤러의 매개변수로 id를 받아야해 
	 * 컨트롤러에서 세션에 접근해서 사용자의 정보만 불러와
	 * 요청? paramkey=paramvalue 
	 * @RequestPara("paramkey")
	 */
	@GetMapping("registl")
	public ModelAndView registl(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
	
		List<Item> list;
		try{
			mav.addObject("listcount", itemService.count(id));
			list = itemService.list(id);
			mav.addObject("registl",list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}
