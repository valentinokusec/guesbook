package com.guestbook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.dao.ReviewDAO;
import com.guestbook.dao.UserDAO;
import com.guestbook.models.Review;
import com.guestbook.models.Users;

public class ReviewServiceimp implements ReviewService{
	@Autowired
    private ReviewDAO reviewdao;
	@Override
	public void addReview(Review review) {
		// TODO Auto-generated method stub
		reviewdao.addReview(review);
	}

	@Override
	public List<Review> getAllReviews() {
		// TODO Auto-generated method stub
		return reviewdao.getAllReviews();
	}

	@Override
	public void deleteReview(int id) {
		// TODO Auto-generated method stub
		reviewdao.deleteReview(id);
	}

}
