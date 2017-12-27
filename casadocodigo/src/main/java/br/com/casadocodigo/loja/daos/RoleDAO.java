package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Role;

@Repository
public class RoleDAO {

	
	@PersistenceContext
	private EntityManager manager;
	
	
	
	public void save(Role role){
		manager.persist(role);
	}
}
