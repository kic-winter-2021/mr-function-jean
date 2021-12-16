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
public class AdminAspect {
	// Support - Notice write Admin check
	@Around("(execution(* controller.Support*.writeNotice*(..))"
			+ " || execution(* controller.Support*.writeFaq*(..)))"
			+ " && args(.., session))")
	public Object adminCheckSupport(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		Customer signin = (Customer)session.getAttribute("signinCustomer");
		if (signin == null || !signin.isAdmin()) {
			throw new UserException("비정상적인 접근입니다.", "/support/faq/list");
		}
		return joinPoint.proceed();
	}
}
