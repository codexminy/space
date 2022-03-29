package com.second.space.mapper;

import java.util.List;

import com.second.space.customerService.model.ContactUsCommentsDTO;
import com.second.space.customerService.model.ContactUsCountDTO;
import com.second.space.customerService.model.ContactUsDTO;
import com.second.space.customerService.model.CsCategoryDTO;
import com.second.space.customerService.model.CustomerServiceDTO;

public interface CustomerServiceXMLMapper {
	public List<CsCategoryDTO> getCustomerServiceCategoryList();
	public List<CustomerServiceDTO> getCustomerServiceList();
	public int addContactUs(ContactUsDTO list);
	public List<ContactUsDTO> getContactUs();
	public List<ContactUsCountDTO> getContactUsCount();
	public List<ContactUsCommentsDTO> getContactUsComments();
}
