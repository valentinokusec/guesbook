package com.guestbook.services;

import java.util.List;

import com.guestbook.models.Review;
import com.guestbook.models.Users;

public interface ReviewService {
	 public void addReview(Review review);
	    public List<Review> getAllReviews();
	    public void deleteReview(int id);
}
