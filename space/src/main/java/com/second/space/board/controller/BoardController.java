package com.second.space.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.service.BoardServiceImpl;
import com.second.space.common.util.Utils;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {
	
	@Autowired
	BoardServiceImpl boardService;
		
	@RequestMapping("/board/boardList")
	public void boardList() {
		
	}
	
	@RequestMapping("/board/auctionPost")
	public void auctionPost() {
		
	}
	
	@RequestMapping("/board/auctionView")
	public void auctionView() {

	}
	
	@RequestMapping("/board/boardIndex")
	public void boardIndex(Model model) {
		
	}
	
	@RequestMapping("/board/boardVieww")
	public void boardVieww() {
//		★★★보드뷰가 안 먹혀서 임의로 하나 팠어요ㅠㅠ 뒤에 W 하나 더 있어요!!
	}
	
	@RequestMapping("/board/boardPost")
	public void boardPost(Model model) {
		log.info("board post");
		try {
			model.addAttribute("categoryList",boardService.getPaymentsCategory());
			// ★★★★★★★★★★로그인 구현되면 로그인 아이디 정보로 가져오게 바꿀것 ★★★★★★★★★★
			model.addAttribute("address", boardService.getAddress(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/board/boardView")
	public void boardView(BoardDTO board,@RequestParam MultipartFile[] upfile, Model model, String main_img, HttpServletRequest request) { 
	
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/board");

		//물리경로
		URL r = this.getClass().getResource("");
		
		
		//경로 찾자 
		//현 웹 어플리케이션 프로젝트 명
		String contextPath = request.getContextPath();
		// 현 엡 어플리케이션의 프로젝트명을 제외한 경로 
		String servletPath = request.getServletPath(); 

		
		// trade_type 조정
		if(board.getBoard_trade_type().contains("both")) {
			board.setBoard_trade_type("both");
		}
		
		//게시글 insert 후에 board_id 가져오기
		int result = boardService.insertBoard(board);
		int board_id = 0;
		List<BoardImgDTO> imgList = new ArrayList<>();
		
		
		if(result > 0) {
			//board_id 가져오기 
			board_id = boardService.getBoardId(board.getUser_id());
			log.info("보드 넣기 성공");
			if(board_id != 0) {
				for(MultipartFile f : upfile) {
					if(!f.isEmpty()) {
						//파일명 
						String originalFileName = f.getOriginalFilename();
						String renamedFileName = Utils.getRenamedFileName(originalFileName);
						
						//실제서버 저장
						try {
							f.transferTo(new File(saveDirection+"/"+renamedFileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						
						
						
						//List 작성
						BoardImgDTO board_img = new BoardImgDTO();
						board_img.setBoard_id(board_id);
						board_img.setOriginalfilename(originalFileName);
						board_img.setRenamedfilename(renamedFileName);
						board_img.setStatus("N");
						if(main_img.equals(originalFileName)) {
							board_img.setMain_img("Y");
						}else {
							board_img.setMain_img("N");
						}
						imgList.add(board_img);
						
					}
				}
				
				//List Insert
				result = boardService.insertBoardImg(imgList);
				if(result > 0) {
					log.info("인서트 성공");
					//보드 정보 가져오기
					BoardDTO boardDto = boardService.getBoardDto(board_id);
					//이미지 정보 가져오기
					List<BoardImgDTO> boardimgList = boardService.getBoardImgDto(board_id);
					model.addAttribute("boardImgList", boardimgList);
					model.addAttribute("board", boardDto);
					model.addAttribute("category", boardService.getCategoryName(board.getP_category_id()));
				}else {
					log.info("인서트 실패");
				}
			}
		}
		
	}
}
