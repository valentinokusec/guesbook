package com.guestbook.dao;

import java.util.List;

import com.guestbook.models.Review;
import com.guestbook.models.Reviewque;
import com.guestbook.models.Users;

public interface ReviewqueDAO {
	 public void addReview(Reviewque reviewque);
	    public List<Reviewque> getAllReviews();
	    public void deleteReview(int id);
	    public List<Reviewque> getReview(int id);
}
