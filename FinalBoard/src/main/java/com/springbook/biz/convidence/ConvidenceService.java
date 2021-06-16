package com.springbook.biz.convidence;

import java.util.List;

import com.springbook.biz.user.UserVO;

public interface ConvidenceService {

	void reservation(ReservationVO vo);
	
	List<ReservationVO> getReservation(UserVO vo);
	
	Integer getReserCount(UserVO vo);
	
	Integer getCartCount(CartVO vo);

	void deleteReser(ReservationVO vo);
	
	List<ProductVO> getShopList();
	
	ProductVO getProduct(ProductVO vo);
	
	void insertOrder(BillVO vo);
	
	List<BillVO> getOrderList(BillVO vo);
	
	void deleteOrder(BillVO vo);
	
	void deleteCart(CartVO vo);

	Integer getOrderCount(BillVO vo);
	
<<<<<<< HEAD
	void insertReviewList(ReviewVO vo);
	
	List<ReviewVO> getReview(ReviewVO vo);
	
	Integer getReviewCount(BillVO vo);
	
=======
	void insertCart(CartVO vo);
	
	List<CartVO> getCartList(CartVO vo);
	
	List<CartVO> getSelectedCartList(CartVO vo);

	void updateCart(CartVO vo);
	
	void checkProduct(CartVO vo);
	
	Integer totalCheck(CartVO vo);
	
	void insertOrderAll(CartVO cvo,BillVO bvo);
	
	void insertOrderSel(CartVO cvo,BillVO bvo);
>>>>>>> branch 'master' of https://github.com/minjae712/FINAL_PROJECT.git
	
}
