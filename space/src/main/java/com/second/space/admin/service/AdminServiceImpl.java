package com.second.space.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.mapper.AdminXMLMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminXMLMapper mapper;
	
	@Override
	public int getAllNotificationCount() throws Exception {
		return mapper.getAllNotificationCount();
	}

}
