package com.guestbook.dao;

import java.util.List;

import com.guestbook.models.Review;
import com.guestbook.models.Users;

public interface ReviewDAO {
	 public void addReview(Review review);
	    public List<Review> getAllReviews();
	    public void deleteReview(int id);
}
