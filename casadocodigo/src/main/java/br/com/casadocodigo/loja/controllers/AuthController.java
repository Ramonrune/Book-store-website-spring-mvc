package br.com.casadocodigo.loja.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {

	@RequestMapping(value = "/login", name = "login")
	public String loginPage() {
		return "auth/login";
	}

	@RequestMapping(value = "/logout", name = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		return "redirect:/";
	}
}
