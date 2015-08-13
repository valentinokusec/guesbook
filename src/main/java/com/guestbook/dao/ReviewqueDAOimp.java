package com.guestbook.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.models.Review;
import com.guestbook.models.Reviewque;
import com.guestbook.models.Users;

public class ReviewqueDAOimp implements ReviewqueDAO {
	
	@Autowired
	 private SessionFactory sessionFactory;

	Session session = null;
	Transaction tx = null;
	@Override
	public void addReview(Reviewque reviewque) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();

		session.save(reviewque);
		tx.commit();
	}

	@Override
	public List<Reviewque> getAllReviews() {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		tx.commit();
		return session.createQuery("from Reviewque").list();
	}

	@Override
	public void deleteReview(int id) {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		Reviewque reviewque=(Reviewque) session.load(Reviewque.class, id);
		 if (null != reviewque) {
	         session.delete(reviewque);
	        }
		 tx.commit();
	}

	@Override
	public List<Reviewque> getReview(int id) {
		session = sessionFactory.openSession();
		tx = session.getTransaction();
		session.beginTransaction();
		
		tx.commit();
		return session.createQuery("from Reviewque where id=:id").setParameter("id", id).list();
	
		
	}

}
