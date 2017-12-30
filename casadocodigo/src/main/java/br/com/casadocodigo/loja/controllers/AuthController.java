package br.com.casadocodigo.loja.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		return "redirect:/";
	}

}
