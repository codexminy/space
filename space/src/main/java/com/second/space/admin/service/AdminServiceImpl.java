package com.second.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.exception.FailToCreateException;
import com.second.space.admin.model.A_Community_boardDTO;
import com.second.space.admin.model.A_boardDTO;
import com.second.space.admin.model.Admin_categoryDTO;
import com.second.space.admin.model.Contact_usDTO;
import com.second.space.admin.model.DeleteCheckDTO;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.NotifyDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;
import com.second.space.mapper.AdminXMLMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminXMLMapper mapper;

	@Override
	public List<Integer> getNotificationCount() throws Exception { // 홈 - 신고 관리 접수 갯수
		return mapper.getNotificationCount();
	}

	@Override
	public List<Integer> getStatsCount() throws Exception { // 홈 - 통계 갯수
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
	public int getNotificationAdTotal(PageSet ps) throws Exception {
		return mapper.getNotificationAdTotal(ps);
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
	public int updateBanner(Notification_adDTO dto) throws Exception {
		return mapper.updateBanner(dto);
	}
	
	@Override
	public int deleteBanner(int na_id) throws Exception {
		return mapper.deleteBanner(na_id);
	}
	
	@Override
	public List<NoticeDTO> getAllNoticeList(PageSet ps) throws Exception {
		return mapper.getAllNoticeList(ps);
	}

	@Override
	public int getNoticeTotal(PageSet ps) throws Exception {
		return mapper.getNoticeTotal(ps);
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
	public int getUserTotal(PageSet ps) throws Exception {
		return mapper.getUserTotal(ps);
	}

	@Override
	public List<UserDTO> getAllWithdrawalList(PageSet ps) throws Exception {
		return mapper.getAllWithdrawalList(ps);
	}

	@Override
	public int getWithdrawalTotal(PageSet ps) throws Exception {
		return mapper.getWithdrawalTotal(ps);
	}

	@Override
	public List<UserDTO> getAllSaleList(PageSet ps) throws Exception {
		return mapper.getAllSaleList(ps);
	}

	@Override
	public int getSaleTotal(PageSet ps) throws Exception {
		return mapper.getSaleTotal(ps);
	}

	@Override
	public List<UserDTO> getAllCommunityList(PageSet ps) throws Exception {
		return mapper.getAllCommunityList(ps);
	}

	@Override
	public int getCommunityTotal(PageSet ps) throws Exception {
		return mapper.getCommunityTotal(ps);
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
	public List<Contact_usDTO> getAllContactUsList(PageSet ps) throws Exception {
		return mapper.getAllContactUsList(ps);
	}

	@Override
	public int getContactUsTotal(PageSet ps) throws Exception {
		return mapper.getContactUsTotal(ps);
	}

	@Override
	public int insertNotice(NoticeDTO dto) throws Exception {
		return mapper.insertNotice(dto);
	}

	@Override
	public List<String> getDailyLabel() throws Exception {
		return mapper.getDailyLabel();
	}
	
	@Override
	public List<String> getWeeklyLabel() throws Exception {
		return mapper.getWeeklyLabel();
	}
	
	@Override
	public List<String> getMonthlyLabel() throws Exception {
		return mapper.getMonthlyLabel();
	}
	
	@Override
	public List<Integer> getDailyNewUser() throws Exception {
		return mapper.getDailyNewUser();
	}

	@Override
	public List<Integer> getDailyWithdrawalUser() throws Exception {
		return mapper.getDailyWithdrawalUser();
	}

	@Override
	public List<Integer> getDailyVisit() throws Exception {
		return mapper.getDailyVisit();
	}

	@Override
	public List<Integer> getWeeklyNewUser() throws Exception {
		return mapper.getWeeklyNewUser();
	}

	@Override
	public List<Integer> getWeeklyWithdrawalUser() throws Exception {
		return mapper.getWeeklyWithdrawalUser();
	}

	@Override
	public List<Integer> getWeeklyVisit() throws Exception {
		return mapper.getWeeklyVisit();
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
	public List<Integer> getMonthlyVisit() throws Exception {
		return mapper.getMonthlyVisit();
	}
	
	@Override
	public List<Notification_adDTO> getAllBannerEndDateList(PageSet ps) throws Exception {
		return mapper.getAllBannerEndDateList(ps);
	}

	@Override
	public int getBannerEndDateTotal(PageSet ps) throws Exception {
		return mapper.getBannerEndDateTotal(ps);
	}

	@Override
	public int updateNotice(NoticeDTO dto) throws Exception {
		return mapper.updateNotice(dto);
	}

	@Override
	public int deleteNotice(int notice_id) throws Exception {
		return mapper.deleteNotice(notice_id);
	}

	@Override
	public List<Integer> getDailySaleList() throws Exception {
		return mapper.getDailySaleList();
	}

	@Override
	public List<Integer> getDailyCommunityList() throws Exception {
		return mapper.getDailyCommunityList();
	}

	@Override
	public List<Integer> getWeeklySaleList() throws Exception {
		return mapper.getWeeklySaleList();
	}

	@Override
	public List<Integer> getWeeklyCommunityList() throws Exception {
		return mapper.getWeeklyCommunityList();
	}

	@Override
	public List<Integer> getMonthlySaleList() throws Exception {
		return mapper.getMonthlySaleList();
	}

	@Override
	public List<Integer> getMonthlyCommunityList() throws Exception {
		return mapper.getMonthlyCommunityList();
	}

	@Override
	public List<Integer> getDailyBoardNotifyList() throws Exception {
		return mapper.getDailyBoardNotifyList();
	}

	@Override
	public List<Integer> getDailyCmtNotifyList() throws Exception {
		return mapper.getDailyCmtNotifyList();
	}

	@Override
	public List<Integer> getDailyReviewNotifyList() throws Exception {
		return mapper.getDailyReviewNotifyList();
	}

	@Override
	public List<Integer> getWeeklyBoardNotifyList() throws Exception {
		return mapper.getWeeklyBoardNotifyList();
	}

	@Override
	public List<Integer> getWeeklyCmtNotifyList() throws Exception {
		return mapper.getWeeklyCmtNotifyList();
	}

	@Override
	public List<Integer> getWeeklyReviewNotifyList() throws Exception {
		return mapper.getWeeklyReviewNotifyList();
	}

	@Override
	public List<Integer> getMonthlyBoardNotifyList() throws Exception {
		return mapper.getMonthlyBoardNotifyList();
	}

	@Override
	public List<Integer> getMonthlyCmtNotifyList() throws Exception {
		return mapper.getMonthlyCmtNotifyList();
	}

	@Override
	public List<Integer> getMonthlyReviewNotifyList() throws Exception {
		return mapper.getMonthlyReviewNotifyList();
	}

	@Override
	public int updateHidden(A_boardDTO dto) throws Exception {
		return mapper.updateHidden(dto);
	}

	@Override
	public List<NotifyDTO> getBoardNotifyList(PageSet ps) throws Exception {
		return mapper.getBoardNotifyList(ps);
	}

	@Override
	public int getBoardNotifyCount(PageSet ps) throws Exception {
		return mapper.getBoardNotifyCount(ps);
	}

	@Override
	public int updateBoardHandling(NotifyDTO dto) throws Exception {
		return mapper.updateBoardHandling(dto);
	}

	@Override
	public int updateBoardDelete(NotifyDTO dto) throws Exception {
		return mapper.updateBoardDelete(dto);
	}

	@Override
	public int updateReported(NotifyDTO dto) throws Exception {
		return mapper.updateReported(dto);
	}

	@Override
	public int updateCommunityBoardDelete(NotifyDTO dto) throws Exception {
		return mapper.updateCommunityBoardDelete(dto);
	}

	@Override
	public int updateCancelReported(NotifyDTO dto) throws Exception {
		return mapper.updateCancelReported(dto);
	}

	@Override
	public List<NotifyDTO> getCmtNotifyList(PageSet ps) throws Exception {
		return mapper.getCmtNotifyList(ps);
	}

	@Override
	public int getCmtNotifyCount(PageSet ps) throws Exception {
		return mapper.getCmtNotifyCount(ps);
	}

	@Override
	public int updateCmtHandling(NotifyDTO dto) throws Exception {
		return mapper.updateCmtHandling(dto);
	}

	@Override
	public int updateCmtDelete(NotifyDTO dto) throws Exception {
		return mapper.updateCmtDelete(dto);
	}

	@Override
	public List<NotifyDTO> getReviewNotifyList(PageSet ps) throws Exception {
		return mapper.getReviewNotifyList(ps);
	}

	@Override
	public int getReviewNotifyCount(PageSet ps) throws Exception {
		return mapper.getReviewNotifyCount(ps);
	}

	@Override
	public int updateReviewHandling(NotifyDTO dto) throws Exception {
		return mapper.updateReviewHandling(dto);
	}

	@Override
	public int updateReviewDelete(NotifyDTO dto) throws Exception {
		return mapper.updateReviewDelete(dto);
	}

	@Override
	public int deleteCheck(DeleteCheckDTO dto) throws Exception {
		return mapper.deleteCheck(dto);
	}

	@Override
	public List<Admin_categoryDTO> getNoticeAdminCategory() throws Exception {
		return mapper.getNoticeAdminCategory();
	}

	@Override
	public int insertNoticeAdmin(Notice_adminDTO dto) throws Exception {
		return mapper.insertNoticeAdmin(dto);
	}

	@Override
	public Notice_adminDTO getNoticeAdmin(int notice_admin_id) throws Exception {
		return mapper.getNoticeAdmin(notice_admin_id);
	}

	@Override
	public int deleteNoticeAdmin(int notice_admin_id) throws Exception {
		return mapper.deleteNoticeAdmin(notice_admin_id);
	}

	@Override
	public int updateNoticeAdmin(Notice_adminDTO dto) throws Exception {
		return mapper.updateNoticeAdmin(dto);
	}

	@Override
	public UserDTO getuserDetail(int user_id) throws Exception {
		return mapper.getuserDetail(user_id);
	}

	@Override
	public int updateUserDetail(UserDTO dto) throws Exception {
		return mapper.updateUserDetail(dto);
	}

	@Override
	public Contact_usDTO getContactUsDetail(int cu_id) throws Exception {
		return mapper.getContactUsDetail(cu_id);
	}

	@Override
	public int insertContactUsCmt(Contact_usDTO dto) throws Exception {
		return mapper.insertContactUsCmt(dto);
	}

	@Override
	public int deleteContactUsCmt(int cuc_comment_id) throws Exception {
		return mapper.deleteContactUsCmt(cuc_comment_id);
	}

	@Override
	public Contact_usDTO getContactUsCmt(int cu_id) throws Exception {
		return mapper.getContactUsCmt(cu_id);
	}

	@Override
	public int updateContactUsState(Contact_usDTO dto) throws Exception {
		return mapper.updateContactUsState(dto);
	}

	@Override
	public int updateCboardHidden(A_Community_boardDTO dto) throws Exception {
		return mapper.updateCboardHidden(dto);
	}

	@Override
	public int updateNoticeAdminView(int notice_admin_id) throws Exception {
		return mapper.updateNoticeAdminView(notice_admin_id);
	}

	@Override
	public int deleteUser(int user_id) throws Exception {
		return mapper.deleteUser(user_id);
	}
}












