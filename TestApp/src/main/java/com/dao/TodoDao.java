package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;


import com.entities.Todo;

@Component
@Repository
public class TodoDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Transactional
	public int save(Todo t) {
		Integer i=(Integer) this.hibernateTemplate.save(t);
		return i;
	}
	
	public List<Todo> getAll(){
		List<Todo> todos = this.hibernateTemplate.loadAll(Todo.class);
		return todos;
	}
	
	
	@Transactional
	public Todo getForUpdate(int theId) {
		 Session currentSession = sessionFactory.getCurrentSession();
	     Todo theTodo = currentSession.get(Todo.class, theId);
	     return theTodo;
	}
	
	
	@Transactional
	public void updateT(Todo t) {
		Session currentSession = this.sessionFactory.getCurrentSession();
	    currentSession.update(t);
		 
	}
	
	@Transactional
	 public void deleteTodo(int id) {
        Session session = sessionFactory.getCurrentSession();
        Todo t = session.byId(Todo.class).load(id);
        session.delete(t);
    }
	
	
}
