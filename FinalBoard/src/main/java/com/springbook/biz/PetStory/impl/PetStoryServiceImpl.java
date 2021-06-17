package com.springbook.biz.PetStory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.PetStory.P_HistoryDTO;
import com.springbook.biz.PetStory.P_MoodVO;
import com.springbook.biz.PetStory.PetStoryPages;
import com.springbook.biz.PetStory.PetStoryVO;
import com.springbook.biz.PetStory.petStoryService;

@Service("PetStoryService")
public class PetStoryServiceImpl implements petStoryService  {
	
	@Autowired
	private PetStoryDAOMybatis PetStoryDAO;

	public void insertPetStory(PetStoryVO vo) {
		PetStoryDAO.insertPetStory(vo);
		PetStoryDAO.insertP_Mood();
	}
	
	public void goodOrBad(P_MoodVO vo,P_HistoryDTO dto) throws Exception {
		List<P_HistoryDTO> result = PetStoryDAO.P_historyCheck();
		dto.setNo(vo.getNo());
		if(result.isEmpty()) {
			PetStoryDAO.goodOrBad(vo);
			PetStoryDAO.insertP_History(dto);
		}else if(!result.isEmpty()) {
			
			for (int j = 0; j < result.size(); j++) {
				if(result.get(j).getMem_code().equals(dto.getMem_code()) && result.get(j).getNo() == vo.getNo()) {
					throw new IllegalAccessError();
				}else {
					PetStoryDAO.goodOrBad(vo);
					PetStoryDAO.insertP_History(dto);
					break;
					
				}
			}
		}
	}
	
	public void updatePetStory(PetStoryVO vo) {
		PetStoryDAO.updatePetStory(vo);
	}

	public void deletePetStory(PetStoryVO vo) {
		PetStoryDAO.deleteP_History(vo);
		PetStoryDAO.deleteAllP_C_History(vo);
		PetStoryDAO.deleteAllP_C_Mood(vo);
		PetStoryDAO.deleteAllComment(vo);
		PetStoryDAO.deleteP_Mood(vo);
		PetStoryDAO.deletePetStory(vo);
	}

	public PetStoryVO getPetStory(PetStoryVO vo) {
		PetStoryDAO.increaseCount(vo);
		return PetStoryDAO.getPetStory(vo);
	}
	
	public P_MoodVO getMood(P_MoodVO mvo) {
		return PetStoryDAO.getMood(mvo);
	}
	
	public PetStoryPages<PetStoryVO> getPetStoryPages(int pageNo,PetStoryVO vo) {
		int totalPetStoryCount = PetStoryDAO.getPetStoryCount();
		vo.setStartRow(((pageNo-1) * 10)+1);
		vo.setEndRow((pageNo * 10));
		List<PetStoryVO> PetStoryList = PetStoryDAO.getPetStoryPages(vo);
		return new PetStoryPages<PetStoryVO>(totalPetStoryCount, pageNo, 10, PetStoryList);
	}
	
	public List<PetStoryVO> getBestList(PetStoryVO vo){
		return PetStoryDAO.getBestList(vo);
	}

	public PetStoryPages<PetStoryVO> getPetStoryUserPages(int pageNo, PetStoryVO vo, String name) {
		int totalPetStoryCount = PetStoryDAO.getPetStoryCount();
		vo.setStartRow(((pageNo-1) * 10)+1);
		vo.setEndRow((pageNo * 10));
		vo.setName(name);
		List<PetStoryVO> PetStoryList = PetStoryDAO.getPetStoryUserPages(vo);
		return new PetStoryPages<PetStoryVO>(totalPetStoryCount, pageNo, 10, PetStoryList);
	}

}