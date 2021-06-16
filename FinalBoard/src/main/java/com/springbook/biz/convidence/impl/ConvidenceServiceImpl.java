package com.springbook.biz.convidence.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.ConvidenceService;
import com.springbook.biz.convidence.ProductVO;
import com.springbook.biz.convidence.ReservationVO;
import com.springbook.biz.convidence.ReviewVO;
import com.springbook.biz.convidence.Review_HistoryDTO;
import com.springbook.biz.user.UserVO;

@Service
public class ConvidenceServiceImpl implements ConvidenceService {

	@Autowired
	private ConvidenceDAO convidenceDAO;
	
	public void reservation(ReservationVO vo) {
		convidenceDAO.reservation(vo);
	}

	@Override
	public List<ReservationVO> getReservation(UserVO vo) {
		return convidenceDAO.getReservation(vo);
	}
	@Override
	public Integer getReserCount(UserVO vo) {
		return convidenceDAO.getReserCount(vo);
	}

	@Override
	public void deleteReser(ReservationVO vo) {
		convidenceDAO.deleteReser(vo);
	}

	@Override
	public List<ProductVO> getShopList() {
		return convidenceDAO.getShopList();
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return convidenceDAO.getProduct(vo);
	}

	@Override
	public void insertOrder(BillVO vo) {
		convidenceDAO.insertOrder(vo);
		Review_HistoryDTO dto = new Review_HistoryDTO();
		dto.setPro_code(vo.getPro_code());
		dto.setMem_code(vo.getMem_code());
		convidenceDAO.insertReview_history(dto);
	}

	@Override
	public List<BillVO> getOrderList(BillVO vo) {
		return convidenceDAO.getOrderList(vo);
	}

	@Override
	public void deleteOrder(BillVO vo) {
		convidenceDAO.deleteOrder(vo);
	}
	@Override
	public Integer getOrderCount(BillVO vo) {
		return convidenceDAO.getOrderCount(vo);
	}

	@Override
	public void insertReviewList(ReviewVO vo) {
		Review_HistoryDTO dto = convidenceDAO.getHistory(vo);
		convidenceDAO.deleteReview_history(dto);
		convidenceDAO.insertReviewList(vo);
	}
	
	@Override
	public List<ReviewVO> getReview(ReviewVO vo){
		return convidenceDAO.getReview(vo);
	}
	
	@Override
	public Integer getReviewCount(BillVO vo) {
		return convidenceDAO.getReviewCount(vo);
	}
}
