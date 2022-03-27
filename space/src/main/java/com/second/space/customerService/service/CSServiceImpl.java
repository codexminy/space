package com.second.space.customerService.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.customerService.model.CsCategoryDTO;
import com.second.space.customerService.model.CustomerServiceDTO;
import com.second.space.mapper.CustomerServiceXMLMapper;

@Service
public class CSServiceImpl implements CSService {

	@Autowired
	CustomerServiceXMLMapper CS_mapper;
	
	/* cs_category list 불러오기 */
	@Override
	public List<CsCategoryDTO> getCSCategoryList() throws Exception {
		return CS_mapper.getCustomerServiceCategoryList();
	}
	
	/* CS list 불러오기 */
	@Override
	public List<CustomerServiceDTO> getCSList() throws Exception {
		return CS_mapper.getCustomerServiceList();
	}
}
