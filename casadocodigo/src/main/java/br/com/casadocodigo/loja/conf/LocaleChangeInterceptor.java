package br.com.casadocodigo.loja.conf;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LocaleChangeInterceptor extends HandlerInterceptorAdapter{

	private static final String DEFAULT_PARAM_NAME = "locale";
	private String paramName = DEFAULT_PARAM_NAME;
	
	public void setParamName(String paramName){
		this.paramName = paramName;
	}
	
	public String getParamName(){
		return this.paramName;
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException{
	
		String newLocale = request.getParameter(this.paramName);
		if(newLocale != null){
			LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
			if(localeResolver == null)
				throw new IllegalStateException("No locale resolver found: not in a dispatcher servlet request ?");
			
			localeResolver.setLocale(request,  response, StringUtils.parseLocaleString(newLocale));
		}
		
		return true;
		
	}
}
