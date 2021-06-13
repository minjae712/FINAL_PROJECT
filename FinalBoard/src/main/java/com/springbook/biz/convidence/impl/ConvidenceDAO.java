package com.springbook.biz.convidence.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.CartVO;
import com.springbook.biz.convidence.ProductVO;
import com.springbook.biz.convidence.ReservationVO;
import com.springbook.biz.user.UserVO;

@Repository
public class ConvidenceDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void reservation(ReservationVO vo) {
		mybatis.insert("ConvidenceDAO.reservation",vo);
	}

	public void insertOrderAll(List<BillVO> vo) {
		mybatis.insert("ConvidenceDAO.insertOrderAll",vo);
	}	
	public List<ReservationVO> getReservation(UserVO vo) {
		return mybatis.selectList("ConvidenceDAO.getReservation",vo);
	}
	
	public Integer getReserCount(UserVO vo) {
		return mybatis.selectOne("ConvidenceDAO.getReserCount",vo);
	}

	public Integer getCartCount(CartVO vo) {
		return mybatis.selectOne("ConvidenceDAO.getCartCount",vo);
	}

	public void deleteReser(ReservationVO vo) {
		mybatis.delete("ConvidenceDAO.deleteReser",vo);
	}
	
	public List<ProductVO> getShopList() {
		return mybatis.selectList("ConvidenceDAO.getShopList");
	}
	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("ConvidenceDAO.getProduct",vo);
	}

	public List<BillVO> getOrderList(BillVO vo) {
		return mybatis.selectList("ConvidenceDAO.getOrderList",vo);
	}
	public void insertOrder(BillVO vo) {
		mybatis.insert("ConvidenceDAO.insertOrder",vo);
	}
	
	public void deleteOrder(BillVO vo) {
		mybatis.delete("ConvidenceDAO.deleteOrder",vo);
	}
	public void deleteCart(CartVO vo) {
		mybatis.delete("ConvidenceDAO.deleteCart",vo);
	}
	public Integer getOrderCount(BillVO vo) {
		return mybatis.selectOne("ConvidenceDAO.getOrderCount",vo);
	}

	public void insertCart(CartVO vo) {
		mybatis.insert("ConvidenceDAO.insertCart",vo);
	}
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("ConvidenceDAO.getCartList",vo);
	}
	public List<CartVO> getSelectedCartList(CartVO vo) {
		return mybatis.selectList("ConvidenceDAO.getSelectedCartList",vo);
	}
	public void updateCart(CartVO vo) {
		mybatis.selectList("ConvidenceDAO.updateCart",vo);
	}
	public void checkProduct(CartVO vo) {
		mybatis.update("ConvidenceDAO.checkProduct",vo);
	}
	public Integer totalCheck(CartVO vo) {
		return mybatis.selectOne("ConvidenceDAO.totalCheck",vo);
	}

}