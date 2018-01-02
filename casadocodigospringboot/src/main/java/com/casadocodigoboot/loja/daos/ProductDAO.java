package com.casadocodigoboot.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.casadocodigoboot.loja.models.BookType;
import com.casadocodigoboot.loja.models.Product;


@Repository
public interface ProductDAO extends org.springframework.data.repository.Repository<Product, Integer>{
	
	/*CrudRepository<Product, Integer>*/ 
	public Product findOne(Integer id);
	
	@Query("select sum(price.value) from Product p join p.prices price where price.bookType = :book")
	public BigDecimal sumPricesPerType(@Param("book") BookType book);
	
	
	public List<Product> findAll();

	public Product save(Product pruduct);
	
	public List<Product> findByPagesGreaterThan(@Param("pages") int pages);
	

	

}
