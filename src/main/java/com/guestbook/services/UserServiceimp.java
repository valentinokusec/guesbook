package com.guestbook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.dao.UserDAO;
import com.guestbook.models.Users;

public class UserServiceimp implements UserService{
	@Autowired
    private UserDAO userdao;
	@Override
	public void addUser(Users user) {
		// TODO Auto-generated method stub
		userdao.addUser(user);
	}

	@Override
	public List<Users> getAllUsers() {
		// TODO Auto-generated method stub
		return userdao.getAllUsers();
	}

	@Override
	public void deleteUser(String user) {
		// TODO Auto-generated method stub
		userdao.deleteUser(user);
	}
	 public void setUserDAO(UserDAO userDAO) {
	        userdao = userDAO;
	    }

	@Override
	public List<Users> getUser(String user) {
		// TODO Auto-generated method stub
		return userdao.getUser(user);
	}

	

	@Override
	public Users getUserObject(String user) {
		// TODO Auto-generated method stub
		return userdao.getUserObject(user);
	}

	@Override
	public void setUser(String user, String lastname, String adress, String contact, String password, String email) {
		// TODO Auto-generated method stub
		userdao.setUser(user, lastname, adress, contact, password, email);
	}
}
