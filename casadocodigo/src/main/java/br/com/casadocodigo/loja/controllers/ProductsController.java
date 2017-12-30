package br.com.casadocodigo.loja.controllers;


import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.validator.ImageValidator;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO = new ProductDAO();

	@Autowired
	private FileSaver fileSaver;

	@RequestMapping(path = "/form", name = "formProduct")
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST, name="saveProduct")
	@CacheEvict(value = "books", allEntries = true)
	public ModelAndView save(MultipartFile summary, @Valid Product product,BindingResult bindingResult, RedirectAttributes redirectAttributes){
		
		if(!new ImageValidator().checksIfIsImage(summary, bindingResult)){
			return form(product);
		}
		
		if(bindingResult.hasErrors()){
			return form(product);
		}
		
		
		
		
		String webPath = fileSaver.write("/WEB-INF/uploaded-images", summary);
		product.setSummaryPath(webPath);
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
		
		return new ModelAndView("redirect:/produtos");
	}

	@RequestMapping(method = RequestMethod.GET, name = "listProduct")
	@Cacheable(value = "books")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", name = "showProduct")
	public ModelAndView show(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("products/show");
		Product product = productDAO.find(id);
		modelAndView.addObject("product", product);
		return modelAndView;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// binder.setValidator(new ProductValidator());
	}

}
