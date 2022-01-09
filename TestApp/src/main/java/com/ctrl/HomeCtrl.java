package com.ctrl;


import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeCtrl {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	TodoDao todoDao;
	
	@RequestMapping("/home")
	public String home(Model m) {
		String str="home";
		m.addAttribute("page", str);
		
		List<Todo> list=this.todoDao.getAll();
		m.addAttribute("todos", list);
		return "home";
	}
	
	
	
	
	@RequestMapping("/add")
	public String addTodo(Model m) {
		Todo t=new Todo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);
		return "home";
	}
	
	@RequestMapping(value="/saveTodo", method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model m) {
		
		System.out.println(t);
		t.setTodoDate(new Date());
		
		this.todoDao.save(t);
		
		m.addAttribute("msg", "Successfully Added");
		return "home";
	}
	//Newly added
	
	@RequestMapping("/update")
	
		public String getIdByValue(@RequestParam("id") int id, Model m) {
			System.out.println("ID is "+id);
		
				m.addAttribute("page", "update");
				Todo theTodo=this.todoDao.getForUpdate(id);
				m.addAttribute("todoss", theTodo);
			    return "home";
		}
		
	@RequestMapping(value="/updateTodo", method=RequestMethod.POST)
	public String updateTodo(@ModelAttribute("todoss") Todo t, Model m) {
		
		System.out.println(t);
		t.setTodoDate(new Date());
		this.todoDao.updateT(t);
		m.addAttribute("msg", "Successfully Updated");
		return "home";
	}
	
	@RequestMapping("/delete")
	
	public String deleteTheTodo(@RequestParam("id") int id, Model m) {
		
			this.todoDao.deleteTodo(id);
			m.addAttribute("msg", "Successfully Deleted");
		    return "home";
	}
	
}
