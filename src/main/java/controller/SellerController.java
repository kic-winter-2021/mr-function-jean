package controller;

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
import logic.dto.AdPost;
import logic.dto.Item;
import logic.dto.Seller;
import logic.service.SellerService;

@Controller
@RequestMapping("seller")
public class SellerController {
	@Autowired
	SellerService sellerService;
	
	@GetMapping("*")	// 
	public ModelAndView info(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Seller());
		return mav;
	}
	@GetMapping({"upbasic", "upseller"})
	public ModelAndView updateLoader(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String id = ((Seller)session.getAttribute("signinSeller")).getId();
			session.setAttribute("signinSeller", sellerService.select(id));
			mav.addObject("seller", sellerService.select(id));
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
	public ModelAndView updateBasic(@Valid Seller seller, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1) 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Errors in updateBasic: " + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// 2) 세션 정보로 DB 불러오기
		try {
			sellerService.updateBasic(seller);
			Seller dbSeller = sellerService.select(seller.getId());
			session.setAttribute("signinSeller", dbSeller); // 세션 갱신
			System.out.println("개인정보 업데이트 성공\n"  + dbSeller);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:myinfo");
		return mav;
	}
	@PostMapping("upcompany")
	public ModelAndView updateCompany(@Valid Seller seller, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1) 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Errors in updateCompany: " + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			// 업데이트
			sellerService.updateCompany(seller);
			Seller dbSeller = sellerService.select(seller.getId());
			session.setAttribute("signinSeller", dbSeller); // 세션 갱신
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
			id = ((Seller)session.getAttribute("signinSeller")).getId();
			mav.addObject(sellerService.getPasswordById(id));
		} catch (NullPointerException e) {
			System.out.println("로그인 세션 종료");
			throw new UserException("로그아웃 상태입니다", "/customer/account/csignin");
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
		Seller signin = (Seller)session.getAttribute("inseller");
		
		try {
			// 이전 비밀번호 비교 -> js로 처리
			//String oldpw = req.get("oldpw");
			sellerService.updatePassword(signin.getId(), newpw);
			// 세션 갱신
			session.setAttribute("inseller", signin);
			System.out.println(signin.getId() + " 비밀번호 변경(" + req.get("oldpw") + " -> " + newpw + ")");
		} catch (Exception e) {
			System.out.println("Exception while DB selection: seller");
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
		adPost.setRank(rank);
		mav.addObject("adPost", adPost);
		// rank map(static map) 라디오 버튼 생성
		mav.addObject("RANK", AdPost.RANK);
		
		// 판매자 아이템 리스트를 모델에 넣기
		try {
			String id = ((Seller)session.getAttribute("signinSeller")).getId();
			List<Item> itemlist =  sellerService.getItemList(id);
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
}
