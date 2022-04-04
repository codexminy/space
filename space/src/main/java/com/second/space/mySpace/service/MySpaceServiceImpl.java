package com.second.space.mySpace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.PageSet;
import com.second.space.mapper.MySpaceXMLMapper;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.InfoDTO;

@Service
public class MySpaceServiceImpl implements MySpaceService {
	
	@Autowired
	MySpaceXMLMapper mapper;
	
	@Override
	public InfoDTO getUserInfo(int user_id) { // 유저 닉네임
		return mapper.getUserInfo(user_id);
	}

	@Override
	public List<BoardInfoDTO> getBoardInfoList(PageSet ps) { // 유저 판매글 정보 리스트
		return mapper.getBoardInfoList(ps);
	}

	@Override
	public int getBoardInfoCount(int user_id) { // 유저 판매글 정보 리스트 총 갯수
		return mapper.getBoardInfoCount(user_id);
	}
	
}
