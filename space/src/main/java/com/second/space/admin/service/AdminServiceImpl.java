package com.second.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.mapper.AdminXMLMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminXMLMapper mapper;

	@Override
	public List<Integer> getNotificationCount() throws Exception {
		return mapper.getNotificationCount();
	}

	@Override
	public List<Integer> getStatsCount() throws Exception {
		return mapper.getStatsCount();
	}

	@Override
	public List<Notification_adDTO> getNotificationAdList() throws Exception {
		return mapper.getNotificationAdList();
	}

	@Override
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception {
		return mapper.getNoticeAdminList();
	}
}
