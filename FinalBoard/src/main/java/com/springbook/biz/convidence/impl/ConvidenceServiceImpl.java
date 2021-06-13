package com.springbook.biz.convidence.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.CartVO;
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
	public Integer getCartCount(CartVO vo) {
		return convidenceDAO.getCartCount(vo);
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
	public void deleteCart(CartVO vo) {
		convidenceDAO.deleteCart(vo);
	}
	@Override
	public Integer getOrderCount(BillVO vo) {
		return convidenceDAO.getOrderCount(vo);
	}

	@Override
	public void insertCart(CartVO vo) {
		convidenceDAO.insertCart(vo);
	}
	@Override
	public List<CartVO> getCartList(CartVO vo) {
		return convidenceDAO.getCartList(vo);
	}
	@Override
	public void updateCart(CartVO vo) {
		convidenceDAO.updateCart(vo);
	}
	@Override
	public void checkProduct(CartVO vo) {
		convidenceDAO.checkProduct(vo);
	}

	@Override
	public Integer totalCheck(CartVO vo) {
		return convidenceDAO.totalCheck(vo);
	}

	@Override
	public List<CartVO> getSelectedCartList(CartVO vo) {
		return convidenceDAO.getSelectedCartList(vo);
	}

	@Override
	public void insertOrderAll(CartVO cvo,BillVO bvo) {
		List<CartVO> result = convidenceDAO.getCartList(cvo);
		List<BillVO> result2 = new ArrayList<BillVO>();
		for (int i = 0; i < result.size(); i++) {
			result2.add(i,new BillVO(
					0,
					result.get(i).getPro_code(), 
					result.get(i).getPro_name(), 
					result.get(i).getMem_code(), 
					(result.get(i).getPrice()*result.get(i).getCount()), 
					result.get(i).getCount(), 
					null, 
					bvo.getAddress(), 
					bvo.getPhone(), 
					bvo.getName(), 
					bvo.getReq()));
		}
		convidenceDAO.insertOrderAll(result2);
	}

	@Override
	public void insertOrderSel(CartVO cvo,BillVO bvo) {
		List<CartVO> result = convidenceDAO.getSelectedCartList(cvo);
		List<BillVO> result2 = new ArrayList<BillVO>();
		for (int i = 0; i < result.size(); i++) {
			result2.add(i,new BillVO(
					0,
					result.get(i).getPro_code(), 
					result.get(i).getPro_name(), 
					result.get(i).getMem_code(), 
					(result.get(i).getPrice()*result.get(i).getCount()), 
					result.get(i).getCount(), 
					null, 
					bvo.getAddress(), 
					bvo.getPhone(), 
					bvo.getName(), 
					bvo.getReq()));
		}
		convidenceDAO.insertOrderAll(result2);
	}

}
