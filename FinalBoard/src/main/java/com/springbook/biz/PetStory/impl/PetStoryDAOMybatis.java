package com.springbook.biz.PetStory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.PetStory.P_HistoryDTO;
import com.springbook.biz.PetStory.P_MoodVO;
import com.springbook.biz.PetStory.PetStoryVO;

@Repository
public class PetStoryDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertPetStory(PetStoryVO vo) {
		System.out.println(vo.toString());
		mybatis.insert("PetStoryDAO.insertPetStory", vo);
	}

	public void insertP_Mood() {
		mybatis.insert("PetStoryDAO.insertP_Mood");
	}
	public void insertP_History(P_HistoryDTO dto) {
		mybatis.insert("PetStoryDAO.insertP_History",dto);
	}
	
	public void goodOrBad(P_MoodVO vo) {
		mybatis.insert("PetStoryDAO.goodOrBad",vo);
	}
	
	public void updatePetStory(PetStoryVO vo) {
		mybatis.update("PetStoryDAO.updatePetStory", vo);
	}
	public void increaseCount(PetStoryVO vo) {
		mybatis.update("PetStoryDAO.increaseCount",vo);
	}

	public void deletePetStory(PetStoryVO vo) {
		mybatis.delete("PetStoryDAO.deletePetStory", vo);
	}

	public void deleteP_Mood(PetStoryVO vo) {
		mybatis.delete("PetStoryDAO.deleteP_Mood", vo);
	}

	public PetStoryVO getPetStory(PetStoryVO vo) {
		return (PetStoryVO) mybatis.selectOne("PetStoryDAO.getPetStory", vo);
	}

	public List<P_HistoryDTO> P_historyCheck() {
		return mybatis.selectList("PetStoryDAO.P_historyCheck");
	}
	
	public P_MoodVO getMood(P_MoodVO mvo) {
		return mybatis.selectOne("PetStoryDAO.getMood", mvo);
	}
	
	public int getPetStoryCount() {
		return mybatis.selectOne("PetStoryDAO.getPetStoryCount");
	}

	public List<PetStoryVO> getPetStoryPages(PetStoryVO vo) {
		return mybatis.selectList("PetStoryDAO.getPetStoryPages",vo);
	}

	public List<PetStoryVO> getPetStoryUserPages(PetStoryVO vo) {
		return mybatis.selectList("PetStoryDAO.getPetStoryUserPages",vo);
	}
	
	public List<PetStoryVO> getBestList(PetStoryVO vo){
		return mybatis.selectList("PetStoryDAO.getBestList",vo);
	}
	
	public void deleteAllComment(PetStoryVO vo){
		mybatis.delete("P_CommentDAO.deleteAllP_Comment",vo);
	}

	public void deleteP_History(PetStoryVO vo){
		mybatis.delete("PetStoryDAO.deleteP_History",vo);
	}
	public void deleteAllP_C_History(PetStoryVO vo){
		mybatis.delete("P_CommentDAO.deleteAllP_C_History",vo);
	}

	public void deleteAllP_C_Mood(PetStoryVO vo){
		mybatis.delete("P_CommentDAO.deleteAllP_C_Mood",vo);
	}
}