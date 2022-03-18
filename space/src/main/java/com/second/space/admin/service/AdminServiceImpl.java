package com.second.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.mapper.AdminXMLMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminXMLMapper mapper;
	
	@Override
	public int getAllNotificationCount() throws Exception {
		return mapper.getAllNotificationCount();
	}

	@Override
	public List<Notification_adDTO> getNotificationAdList() throws Exception {
		return mapper.getNotificationAdList();
	}

	@Override
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception {
		return mapper.getNoticeAdminList();
	}

	@Override
	public int getNotificationBoardCount() throws Exception {
		return mapper.getNotificationBoardCount();
	}

	@Override
	public int getNotificationCmtCount() throws Exception {
		return mapper.getNotificationCmtCount();
	}

	@Override
	public int getNotificationReviewCount() throws Exception {
		return mapper.getNotificationReviewCount();
	}

	@Override
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps) throws Exception {
		return mapper.getAllNotificationAdList(ps);
	}

	@Override
	public int getNotificationAdTotal() throws Exception {
		return mapper.getNotificationAdTotal();
	}

	@Override
	public Notification_adDTO getNotificationAdDetailList(int na_id) throws Exception {
		return mapper.getNotificationAdDetailList(na_id);
	}

	@Override
	public int insertNotificationAd(String imgPath) throws Exception {
		return mapper.insertNotificationAd(imgPath);
	}

	@Override
	public List<NoticeDTO> getAllNoticeList(PageSet ps) throws Exception {
		return mapper.getAllNoticeList(ps);
	}

	@Override
	public int getNoticeTotal(PageSet ps) {
		return mapper.getNoticeTotal(ps);
	}

	@Override
	public NoticeDTO getNotice(int notice_id) {
		return mapper.getNotice(notice_id);
	}

	@Override
	public int insertNotice(NoticeDTO dto) {
		return mapper.insertNotice(dto);
	}

}
