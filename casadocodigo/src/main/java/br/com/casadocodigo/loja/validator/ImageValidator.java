package br.com.casadocodigo.loja.validator;

import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

public class ImageValidator {

	
	public boolean checksIfIsImage(MultipartFile multipartFile, BindingResult bindingResult){
		if(multipartFile.getContentType().toLowerCase().equals("image/jpeg") || multipartFile.getContentType().toLowerCase().equals("image/png")){
			return true;
		}
		
		bindingResult.rejectValue("summaryPath", "typeMismatch.product.summaryPath");
		
		return false;
		
	}
}
