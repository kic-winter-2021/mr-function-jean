package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.SigninException;
import logic.dto.Customer;

@Component
@Aspect
public class AdminAspect {
	// Support - Notice write Admin check
	@Around("execution(* controller.Support*.writeNotice*(..)) && args(.., session)")
	public Object adminCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		Customer signin = (Customer)session.getAttribute("signinCustomer");
		if (signin==null || signin.getType() != Customer.ADMIN) {
			throw new SigninException("비정상적인 접근입니다.", "/main.jsp");
		}
		return joinPoint.proceed();
	}
}
