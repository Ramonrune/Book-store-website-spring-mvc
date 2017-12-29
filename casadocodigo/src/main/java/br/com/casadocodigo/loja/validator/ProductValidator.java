package br.com.casadocodigo.loja.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.models.Product;

public class ProductValidator implements Validator {

	
	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.required");

		Product product = (Product) target;

		if (product.getPages() == 0) {
			errors.rejectValue("pages", "field.required");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "releaseDate", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "summaryPath", "field.required");
		

	
	}

	@Override
	public boolean supports(Class<?> classz) {
		return Product.class.isAssignableFrom(classz);
	}

}
