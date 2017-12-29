package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProductDAO;

@Controller
public class HomeController {


	@Autowired
	private ProductDAO productDAO = new ProductDAO();
	
	
	@RequestMapping(value = "/", name = "home")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("products", productDAO.list());	
		return modelAndView;
	}
}
