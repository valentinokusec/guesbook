package com.guestbook.dao.login;

import com.guestbook.models.Users;



public interface LoginDao {
	Users findByUserName(String username);
}
