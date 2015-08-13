package com.guestbook.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.models.Users;

public class UserDAOimp implements UserDAO{

	 @Autowired
	 private SessionFactory sessionFactory;
	 

		Session session = null;
		Transaction tx = null;
	@Override
	public void addUser(Users user) {
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();

		session.save(user);
		tx.commit();
	}

	@Override
	public List<Users> getAllUsers() {
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		tx.commit();
		return session.createQuery("from Users").list();
	}

	@Override
	public void deleteUser(String user) {
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		Users userr=(Users) session.load(Users.class, user);
		 if (null != userr) {
	         session.delete(userr);
	        }
		 tx.commit();
	}

	@Override
	public List<Users> getUser(String user) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		tx.commit();
		return session.createQuery("from Users where username=:user").setParameter("user", user).list();
	
		
	}

	

	@Override
	public Users getUserObject(String user) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		Users userr=(Users) session.load(Users.class, user);
		tx.commit();
		return userr;
	
		
	}

	@Override
	public void setUser(String user, String lastname, String adress, String contact, String password, String email) {
		// TODO Auto-generated method stub
		tx = session.getTransaction();
		session.beginTransaction();
		
		Users userr=(Users) session.load(Users.class,  user);
		userr.setAdress(adress);
		userr.setContact(contact);
		userr.setEmail(email);
		userr.setLastname(lastname);
		userr.setPassword(password);
		userr.getUsername();
		 if (null != userr) {
	         session.update(userr);
	        }
		 tx.commit();
	}

}
