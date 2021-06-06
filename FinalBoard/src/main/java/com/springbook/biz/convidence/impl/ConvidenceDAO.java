package com.springbook.biz.convidence.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.convidence.ReservationVO;
import com.springbook.biz.user.UserVO;

@Repository
public class ConvidenceDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void reservation(ReservationVO vo) {
		mybatis.insert("ConvidenceDAO.reservation",vo);
	}

	public List<ReservationVO> getReservation(UserVO vo) {
		return mybatis.selectList("ConvidenceDAO.getReservation",vo);
	}
	
	public Integer getReserCount(UserVO vo) {
		return mybatis.selectOne("ConvidenceDAO.getReserCount",vo);
	}
	public void deleteReser(ReservationVO vo) {
		mybatis.delete("ConvidenceDAO.deleteReser",vo);
	}

}