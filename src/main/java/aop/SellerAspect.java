package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.UserException;
import logic.dto.Customer;

@Component
@Aspect
public class SellerAspect {
	// Seller
	@Around("execution(* controller.Seller*.*(..)) && args(.., session)")
	public Object sellerCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		Customer signin = (Customer) session.getAttribute("signinUser");
		if (signin == null) {
			throw new UserException("로그인이 필요한 페이지입니다.", "/customer/account/signin");
		} else if (!signin.isSeller()) {
			throw new UserException("사업자 회원만 이용가능한 페이지입니다.", "/customer/account/signin?type=s");
		}
		return joinPoint.proceed();
	}
}
