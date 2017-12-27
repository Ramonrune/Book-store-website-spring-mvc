package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.ShoppingItem;

@Controller
@RequestMapping("/shopping")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ShoppingCartController {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	@RequestMapping(method = RequestMethod.POST, name = "saveCart")
	public ModelAndView add(Integer productId, BookType bookType){
		ShoppingItem item = createItem(productId, bookType);
		shoppingCart.add(item);
		System.out.println(shoppingCart.getList().size());
		return new ModelAndView("redirect:/produtos");
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String items(){
		
		return "shoppingCart/items";
	}
	
	private ShoppingItem createItem(Integer productId, BookType bookType){
		Product product = productDAO.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}
	
	

}
