package com.springbook.biz.convidence.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.ConvidenceService;
import com.springbook.biz.convidence.ProductVO;
import com.springbook.biz.convidence.ReservationVO;
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
}
