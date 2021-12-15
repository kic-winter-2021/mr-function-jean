package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LogoutException;
import exception.UserException;
import logic.dto.Customer;

@Component
@Aspect
public class CustomerAspect {
	// 회원 로그인 체크
	@Around("execution(* controller.Customer*.*(..)) && args(.., session)")
	public Object signinCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		Customer signin = (Customer) session.getAttribute("signinUser");
		if (signin == null) {
			throw new UserException("로그인이 필요한 페이지입니다.", "/customer/account/signin");
		}
		return joinPoint.proceed();
	}
	
	// account 페이지 로그아웃 체크
	@Around("execution(* controller.Account*.*(..)) && args(.., session)")
	public Object outCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		Customer signin = (Customer) session.getAttribute("signinUser");
		if (signin != null) {
			//session.invalidate();
			throw new LogoutException("페이지 접근을 위해서는 로그아웃이 필요합니다.");
		}
		return joinPoint.proceed();
	}
}
