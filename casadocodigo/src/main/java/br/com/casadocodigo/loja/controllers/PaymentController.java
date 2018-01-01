package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.async.DeferredResult;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.User;
import br.com.casadocodigo.loja.service.IntegrandoComPagamento;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private ShoppingCart shoppingCart;
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private MailSender mailer;
	
	@RequestMapping(value = "checkout", method = RequestMethod.POST, name = "checkout")
	public DeferredResult<String> checkout(@AuthenticationPrincipal User user) {

		BigDecimal total = shoppingCart.getTotal();
		DeferredResult<String> result = new DeferredResult<>();
		
		IntegrandoComPagamento integrandoComPagamento = new IntegrandoComPagamento(result, total, restTemplate);
		
		Thread thread = new Thread(integrandoComPagamento);
		thread.start();
		sendNewPurchaseMail(user);
		return result;
	}
	
	private void sendNewPurchaseMail(User user){
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("noreplyprogramacsharp@gmail.com");
		email.setTo(user.getLogin());
		email.setSubject("Nova compra");
		email.setText("Nova compra realizada");
		mailer.send(email);

	}
}
