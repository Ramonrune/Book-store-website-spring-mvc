package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import br.com.casadocodigo.loja.daos.UserDAO;

@Controller
@Transactional
@RequestMapping("/usuarios")
public class UserController {


	@Autowired
	private UserDAO userDAO = new UserDAO();
	
	
	@RequestMapping(method= RequestMethod.GET)
	@Cacheable(value = "users")
	public ModelAndView list(){
		
		ModelAndView modelAndView = new ModelAndView("users/list");
		modelAndView.addObject("users", userDAO.list());
		return modelAndView;
		
	}
	
	
}
