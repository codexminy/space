package com.second.space.mapper;

import java.util.List;

import com.second.space.customerService.model.CsCategoryDTO;
import com.second.space.customerService.model.CustomerServiceDTO;

public interface CustomerServiceXMLMapper {
	public List<CsCategoryDTO> getCustomerServiceCategoryList();
	public List<CustomerServiceDTO> getCustomerServiceList();
}
