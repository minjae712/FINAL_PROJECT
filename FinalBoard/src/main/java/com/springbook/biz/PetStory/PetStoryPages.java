package com.springbook.biz.PetStory;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PetStoryPages<T> {
	
	private int totalPetStory;							
	private int currentPage;					
	private List<T> petStoryList;
	
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public PetStoryPages() {
		currentPage = 0;
	}
	
	public PetStoryPages(int totalPetStory, int currentPage,int sizePerPage, List<T> PetStoryList) {
		this.totalPetStory = totalPetStory;
		this.currentPage = currentPage;
		this.petStoryList = PetStoryList;
		
		if(totalPetStory == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		
		}else {
			
			totalPages = totalPetStory/sizePerPage;
			if(totalPetStory % sizePerPage > 0) {
				totalPages++;
			}
			
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if(modVal ==0) {
				startPage -= 5;
			}
			
			endPage = startPage + 4;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}

	public boolean hasNoArticles() {
		return totalPetStory == 0;
	}
	
	public boolean hasArticles() {
		return totalPetStory > 0;
	}

	
}
