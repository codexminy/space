package com.second.space.customerService.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.customerService.model.ContactUsCommentsDTO;
import com.second.space.customerService.model.ContactUsCountDTO;
import com.second.space.customerService.model.ContactUsDTO;
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
	
	/* 문의하기 DB등록 */
	@Override
	public int newContactUs(ContactUsDTO list) throws Exception {
		return CS_mapper.addContactUs(list);
	}
	
	/* 문의내역 */
	@Override
	public List<ContactUsDTO> getContactUsList() throws Exception {
		return CS_mapper.getContactUs();
	}
	
	/* 문의내역 개수 체크 */
	@Override
	public List<ContactUsCountDTO> getContactUsCount() throws Exception {
		return CS_mapper.getContactUsCount();
	}
	
	/* 문의하기 답변 불러오기 */
	@Override
	public List<ContactUsCommentsDTO> getContactUsCommentsList() throws Exception {
		return CS_mapper.getContactUsComments();
	}
}
