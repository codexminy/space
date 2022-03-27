package com.second.space.customerService.service;

import java.util.List;

import com.second.space.customerService.model.CsCategoryDTO;
import com.second.space.customerService.model.CustomerServiceDTO;

public interface CSService {
	
	public List<CsCategoryDTO> getCSCategoryList() throws Exception;
	public List<CustomerServiceDTO> getCSList() throws Exception;
	
}
