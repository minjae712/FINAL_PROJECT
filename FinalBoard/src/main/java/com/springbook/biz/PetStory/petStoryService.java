package com.springbook.biz.PetStory;

import java.util.List;

public interface petStoryService {

	void insertPetStory(PetStoryVO vo);
	
	void goodOrBad(P_MoodVO vo,P_HistoryDTO dto) throws Exception;

	void updatePetStory(PetStoryVO vo);

	void deletePetStory(PetStoryVO vo);

	PetStoryVO getPetStory(PetStoryVO vo);
	
	P_MoodVO getMood(P_MoodVO mvo);
	
	PetStoryPages<PetStoryVO> getPetStoryPages(int pageNo,PetStoryVO vo);
	
	PetStoryPages<PetStoryVO> getPetStoryUserPages(int pageNo,PetStoryVO vo,String name);
	
	List<PetStoryVO> getBestList(PetStoryVO vo);
	
}
