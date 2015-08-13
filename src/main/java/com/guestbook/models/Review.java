package com.guestbook.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="review",catalog="guestbook")
public class Review {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@Column(name = "id")
private int id;
@Column(name = "content")
private String content;
@Column(name = "date")
private Date date;
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
@Column(name = "user")
private String user;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}

}
