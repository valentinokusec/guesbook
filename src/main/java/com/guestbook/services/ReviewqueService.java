package com.guestbook.services;

import java.util.List;

import com.guestbook.models.Reviewque;

public interface ReviewqueService {
	 public void addReview(Reviewque reviewque);
	    public List<Reviewque> getAllReviews();
	    public void deleteReview(int id);
	    public List<Reviewque> getReview(int id);
}
