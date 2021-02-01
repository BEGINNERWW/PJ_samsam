package com.project.samsam.api;

import java.util.ArrayList;

public class AnimalApiVO {
	private int totalCount;
	private ArrayList<AnimalInfo> animalInfo;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public ArrayList<AnimalInfo> getAnimalInfo() {
		return animalInfo;
	}

	public void setAnimalInfo(ArrayList<AnimalInfo> animalInfo) {
		this.animalInfo = animalInfo;
	}
}
