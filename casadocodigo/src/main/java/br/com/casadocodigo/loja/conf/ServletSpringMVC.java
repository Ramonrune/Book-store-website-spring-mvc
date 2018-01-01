package br.com.casadocodigo.loja.conf;


import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {
				SecurityConfiguration.class,
				AppWebConfiguration.class, 
				JPAConfiguration.class,
				AmazonConfiguration.class,};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration){
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}

	@Override
	protected Filter[] getServletFilters() {
		return new Filter[] {new OpenEntityManagerInViewFilter()};
	}
	
	

}
