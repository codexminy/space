package com.second.space.customerService.service;

import java.util.List;

import com.second.space.customerService.model.ContactUsCommentsDTO;
import com.second.space.customerService.model.ContactUsCountDTO;
import com.second.space.customerService.model.ContactUsDTO;
import com.second.space.customerService.model.CsCategoryDTO;
import com.second.space.customerService.model.CustomerServiceDTO;

public interface CSService {
	
	public List<CsCategoryDTO> getCSCategoryList() throws Exception;
	public List<CustomerServiceDTO> getCSList() throws Exception;
	public int newContactUs(ContactUsDTO list) throws Exception;
	public List<ContactUsDTO> getContactUsList() throws Exception;
	public List<ContactUsCountDTO> getContactUsCount() throws Exception;
	public List<ContactUsCommentsDTO> getContactUsCommentsList() throws Exception;
}
