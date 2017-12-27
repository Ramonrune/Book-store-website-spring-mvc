package br.com.casadocodigo.loja.service;

import java.math.BigDecimal;

import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.async.DeferredResult;

import br.com.casadocodigo.loja.models.PaymentData;

public class IntegrandoComPagamento implements Runnable {

	
	private DeferredResult<String> result;
	private BigDecimal value;
	private RestTemplate restTemplate;
	
	
	public IntegrandoComPagamento(DeferredResult<String> result,
			BigDecimal value, RestTemplate restTemplate) {
		this.result = result;
		this.value = value;
		this.restTemplate = restTemplate;
	}
	
	@Override
	public void run() {

		String uriToPay = "http://book-payment.herokuapp.com/payment";
		try {
			String response = restTemplate.postForObject(uriToPay, new PaymentData(value), String.class);
			result.setResult("redirect:/payment/success");
		} catch (HttpClientErrorException exception) {
			result.setResult("redirect:/payment/error");
		}
	}

	
}
