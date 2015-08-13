package com.guestbook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guestbook.dao.ReviewDAO;
import com.guestbook.dao.ReviewqueDAO;
import com.guestbook.models.Reviewque;

public class ReviewqueServiceimp implements ReviewqueService{
	@Autowired
    private ReviewqueDAO reviewguedao;
	@Override
	public void addReview(Reviewque reviewque) {
		// TODO Auto-generated method stub
		reviewguedao.addReview(reviewque);
	}

	@Override
	public List<Reviewque> getAllReviews() {
		// TODO Auto-generated method stub
		return reviewguedao.getAllReviews();
	}

	@Override
	public void deleteReview(int id) {
		// TODO Auto-generated method stub
		reviewguedao.deleteReview(id);
	}

	@Override
	public List<Reviewque> getReview(int id) {
		// TODO Auto-generated method stub
		return reviewguedao.getReview(id);
	}

}
