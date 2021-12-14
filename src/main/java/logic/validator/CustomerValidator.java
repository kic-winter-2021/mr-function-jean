package logic.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import logic.dto.Customer;

public class CustomerValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		if (Customer.class.isAssignableFrom(clazz)) {
			return true;
		}
		return false;
	}
	@Override
	public void validate(Object target, Errors errors) {
		Customer customer = (Customer)target;
		if(customer.getId() == null || customer.getId().length() == 0) {
			errors.rejectValue("id", "required", "아이디를 입력하세요");
		}
	}
}
