package com.second.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;
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

	@Override
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps) throws Exception {
		return mapper.getAllNotificationAdList(ps);
	}

	@Override
	public int getNotificationAdTotal() throws Exception {
		return mapper.getNotificationAdTotal();
	}

	@Override
	public int createNotificationAd(Notification_adDTO dto) throws Exception {
		return mapper.createNotificationAd(dto);
	}

	@Override
	public Notification_adDTO getNotificationAdDetail(int na_id) throws Exception {
		return mapper.getNotificationAdDetail(na_id);
	}

	@Override
	public List<NoticeDTO> getAllNoticeList(PageSet ps) throws Exception {
		return mapper.getAllNoticeList(ps);
	}

	@Override
	public int getNoticeTotal() throws Exception {
		return mapper.getNoticeTotal();
	}

	@Override
	public NoticeDTO getNoticeDetail(int notice_id) throws Exception {
		return mapper.getNoticeDetail(notice_id);
	}

	@Override
	public List<Notice_categoryDTO> getNoticeCategory() throws Exception {
		return mapper.getNoticeCategory();
	}

	@Override
	public List<UserDTO> getAllUserList(PageSet ps) throws Exception {
		return mapper.getAllUserList(ps);
	}

	@Override
	public int getUserTotal() throws Exception {
		return mapper.getUserTotal();
	}

	@Override
	public List<UserDTO> getAllWithdrawalList(PageSet ps) throws Exception {
		return mapper.getAllWithdrawalList(ps);
	}

	@Override
	public int getWithdrawalTotal() throws Exception {
		return mapper.getWithdrawalTotal();
	}

	@Override
	public List<UserDTO> getAllSaleList(PageSet ps) throws Exception {
		return mapper.getAllSaleList(ps);
	}

	@Override
	public int getSaleTotal() throws Exception {
		return mapper.getSaleTotal();
	}

	@Override
	public List<UserDTO> getAllCommunityList(PageSet ps) throws Exception {
		return mapper.getAllCommunityList(ps);
	}

	@Override
	public int getCommunityTotal() throws Exception {
		return mapper.getCommunityTotal();
	}

	@Override
	public List<UserDTO> getAllNoticeAdminList(PageSet ps) throws Exception {
		return mapper.getAllNoticeAdminList(ps);
	}

	@Override
	public int getNoticeAdminTotal() throws Exception {
		return mapper.getNoticeAdminTotal();
	}

	@Override
	public List<UserDTO> getAllContactUsList(PageSet ps) throws Exception {
		return mapper.getAllContactUsList(ps);
	}

	@Override
	public int getContactUsTotal() throws Exception {
		return mapper.getContactUsTotal();
	}

	@Override
	public int insertNotice(NoticeDTO dto) throws Exception {
		return mapper.insertNotice(dto);
	}

	@Override
	public List<Integer> getMonthlyNewUser() throws Exception {
		return mapper.getMonthlyNewUser();
	}

	@Override
	public List<Integer> getMonthlyWithdrawalUser() throws Exception {
		return mapper.getMonthlyWithdrawalUser();
	}

	@Override
	public List<Integer> getDailyVisit() throws Exception {
		return mapper.getDailyVisit();
	}
}












