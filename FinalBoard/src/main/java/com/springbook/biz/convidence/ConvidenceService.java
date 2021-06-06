package com.springbook.biz.convidence;

import java.util.List;

import com.springbook.biz.user.UserVO;

public interface ConvidenceService {

	void reservation(ReservationVO vo);
	
	List<ReservationVO> getReservation(UserVO vo);
	
	Integer getReserCount(UserVO vo);
	
	void deleteReser(ReservationVO vo);
	
}
