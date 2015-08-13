package com.guestbook.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.models.Review;
import com.guestbook.models.Users;

public class ReviewDAOimp implements ReviewDAO {
	
	@Autowired
	 private SessionFactory sessionFactory;

	Session session = null;
	Transaction tx = null;
	@Override
	public void addReview(Review review) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();

		session.save(review);
		tx.commit();
	}

	@Override
	public List<Review> getAllReviews() {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		tx.commit();
		return session.createQuery("from Review").list();
	}

	@Override
	public void deleteReview(int id) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		Review review=(Review) session.load(Review.class, id);
		 if (null != review) {
	         session.delete(review);
	        }
		 tx.commit();
	}

}
