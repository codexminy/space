package com.second.space.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.board.model.AuctionDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.board.model.FollowingDTO;
import com.second.space.board.model.ReviewDTO;
import com.second.space.board.model.WinningBidDTO;
import com.second.space.board.service.BoardServiceImpl;
import com.second.space.common.util.Utils;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {
	
	@Autowired
	BoardServiceImpl boardService;
		
	@RequestMapping("/board/boardList")
	public void boardList(PageSet ps, Model model) throws Exception {
		
		if(ps.getP_category_id() == 0) {
			model.addAttribute("list", boardService.getAllBoardList(ps));
			model.addAttribute("paging", new Paging(boardService.getAllBoardTotal(), ps));
		} else {
			model.addAttribute("list", boardService.getCategoryBoardList(ps));
			model.addAttribute("paging", new Paging(boardService.getCategoryBoardTotal(ps), ps));
			model.addAttribute("name", boardService.getPCategoryName(ps));
		}
		
	}
	
	@RequestMapping("/board/auctionPost")
	public void auctionPost(Model model, HttpServletRequest request) {
		log.info("aution post");
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		
		try {
			if(user != null) {
				model.addAttribute("categoryList",boardService.getPaymentsCategory());
				model.addAttribute("address", boardService.getAddress(user.getUser_id()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/board/boardAuction")
	public ModelAndView boardAuction(BoardDTO board, AuctionDTO auction, @RequestParam(value="a_date") Integer a_date,
			ModelAndView mav, @RequestParam MultipartFile[] upfile, String main_img, HttpServletRequest request) {
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/board");
		
		
		board.setBoard_price(auction.getPurchase_price()+"");
		board.setAuction_state("Y");
		// trade_type ??????
		if(board.getBoard_trade_type().contains("both")) {
			board.setBoard_trade_type("both");
		}
		
		
		//????????? insert ?????? board_id ????????????
		int result = boardService.insertBoard(board);
		int board_id = 0;
		List<BoardImgDTO> imgList = new ArrayList<>();
		
		
		if(result > 0) {
			//board_id ???????????? 
			board_id = boardService.getBoardId(board.getUser_id());
			log.info("?????? ?????? ??????");
			if(board_id != 0) {
				for(MultipartFile f : upfile) {
					if(!f.isEmpty()) {
						//????????? 
						String originalFileName = f.getOriginalFilename();
						String renamedFileName = Utils.getRenamedFileName(originalFileName);
						
						//???????????? ??????
						try {
							f.transferTo(new File(saveDirection+"/"+renamedFileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}

						//List ??????
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
					
					// aucton insert
					auction.setBoard_id(board_id);
				
					Calendar cal = Calendar.getInstance();
					cal.setTime(new Date());
					auction.setAuction_start_date(cal.getTime());
					cal.add(Calendar.DATE, a_date);
					auction.setAuction_end_date(cal.getTime());
					
					int result_a = boardService.insertAcution(auction);
					int auction_id = 0;
					
					if(result_a > 0) {
						auction_id = boardService.getAuctionId(board_id);
					}
					
					if(auction_id > 0) {
						log.info("????????? ??????");
			             mav.setViewName("common/loc");
			             mav.addObject("loc", "/board/auctionView?board_id="+board_id+"&auction_id="+ auction_id );
					}

				}else {
					log.info("????????? ??????");
					 mav.addObject("msg", "????????? ?????? ??????");
					 mav.setViewName("common/msg");
		             mav.addObject("loc", "/board/auctionPost");
				}
			}
		}
		
		
		return mav;
	}
	
	@RequestMapping("/board/auctionView")
	public void auctionView(@RequestParam(value="board_id") Integer board_id, @RequestParam(value="auction_id") Integer auction_id, Model model
			,HttpServletRequest request	) {
		BoardDTO board = boardService.getBoardDto(board_id);
		List<BoardImgDTO> boardimgList = boardService.getBoardImgDto(board_id);
		UserDTO user = boardService.getUserByUserId(board.getUser_id());
		int follower = boardService.getFollower(board.getUser_id());
		int boardCnt = boardService.getBoardCnt(board.getUser_id());
		AuctionDTO auction = boardService.getAuctionDTO(auction_id);
		Integer following = null;
		FollowingDTO f = new FollowingDTO();
		Integer boardLike = null;
		BoardLikeDTO b = new BoardLikeDTO();
		
		HttpSession session = request.getSession();
		UserDTO loginedInUser = (UserDTO)session.getAttribute("userLoggedIn");
		if(loginedInUser != null && user != null) {
			int user_id = loginedInUser.getUser_id();
			f.setUser_id(user_id);
			int user_login_id = user.getUser_login_id();
			f.setUser_login_id(user_login_id);
			following = boardService.getFollowing2(f);
			b.setBoard_id(board_id);
			b.setUser_id(loginedInUser.getUser_id());
			boardLike = boardService.getBoardLike(b);

		}
		
		model.addAttribute("boardImgList", boardimgList);
		model.addAttribute("board", board);
		model.addAttribute("category", boardService.getCategoryName(board.getP_category_id()));
		model.addAttribute("nickname", user.getUser_nickname());
		model.addAttribute("follower", follower);
		model.addAttribute("boardCnt", boardCnt);
		model.addAttribute("auction", auction);
		model.addAttribute("user", user);
		model.addAttribute("following", following);
		model.addAttribute("boardLike", boardLike);
	}
	
	@RequestMapping("/board/boardIndex")
	public void boardIndex(Model model) {
		
	}
	
	@RequestMapping("/board/boardVieww")
	public void boardVieww(@RequestParam(value="board_id") Integer board_id, Model model, HttpServletRequest request) {
		
		//?????? ?????? ????????????
		BoardDTO boardDto = boardService.getBoardDto(board_id);
		log.info(boardDto.getUser_id());
		
		//????????? ?????? ????????????
		List<BoardImgDTO> boardimgList = boardService.getBoardImgDto(board_id);
		// ?????? ?????????
		UserDTO user = boardService.getUserByUserId(boardDto.getUser_id());
		
		// ?????? ????????? ?????? ??? ??? 
		int follower = boardService.getFollower(boardDto.getUser_id());

		// ?????? ??? ?????? ?????? ??? 
		int boardCnt = boardService.getBoardCnt(boardDto.getUser_id());
		
		// ????????? 
		Integer following = null;
		FollowingDTO f = new FollowingDTO();
		// ??? 
		Integer boardLike = null;
		BoardLikeDTO b = new BoardLikeDTO();
		
		HttpSession session = request.getSession();
		UserDTO loginedInUser = (UserDTO)session.getAttribute("userLoggedIn");
		if(loginedInUser != null && user != null) {
			int user_id = loginedInUser.getUser_id();
			f.setUser_id(user_id);
			int user_login_id = user.getUser_login_id();
			f.setUser_login_id(user_login_id);
			following = boardService.getFollowing2(f);
			
			b.setBoard_id(board_id);
			b.setUser_id(loginedInUser.getUser_id());
			log.info(b);
			boardLike = boardService.getBoardLike(b);
			log.info(boardLike);

		}
		
		model.addAttribute("boardImgList", boardimgList);
		model.addAttribute("board", boardDto);
		model.addAttribute("category", boardService.getCategoryName(boardDto.getP_category_id()));
		model.addAttribute("nickname", user.getUser_nickname());
		model.addAttribute("address", user.getUser_address());
		model.addAttribute("follower", follower);
		model.addAttribute("boardCnt", boardCnt);
		model.addAttribute("user", user);
		model.addAttribute("following", following);
		model.addAttribute("boardLike", boardLike);
		
	}
	
	
	@RequestMapping("/board/boardPost")
	public void boardPost(Model model, HttpServletRequest request) {
		log.info("board post");
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		
		try {
			if(user != null) {
				model.addAttribute("categoryList",boardService.getPaymentsCategory());
				model.addAttribute("address", boardService.getAddress(user.getUser_id()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/board/boardView")
	public ModelAndView boardView(BoardDTO board,@RequestParam MultipartFile[] upfile, ModelAndView mav, String main_img, HttpServletRequest request) { 
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/board");

		// trade_type ??????
		if(board.getBoard_trade_type().contains("both")) {
			board.setBoard_trade_type("both");
		}
		board.setAuction_state("N");
		//????????? insert ?????? board_id ????????????
		int result = boardService.insertBoard(board);
		int board_id = 0;
		List<BoardImgDTO> imgList = new ArrayList<>();
		
		
		if(result > 0) {
			//board_id ???????????? 
			board_id = boardService.getBoardId(board.getUser_id());
			log.info("?????? ?????? ??????");
			if(board_id != 0) {
				for(MultipartFile f : upfile) {
					if(!f.isEmpty()) {
						//????????? 
						String originalFileName = f.getOriginalFilename();
						String renamedFileName = Utils.getRenamedFileName(originalFileName);
						
						//???????????? ??????
						try {
							f.transferTo(new File(saveDirection+"/"+renamedFileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						
						
						
						//List ??????
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
					log.info("????????? ??????");
		             mav.setViewName("common/loc");
		             mav.addObject("loc", "/board/boardVieww?board_id="+board_id);

				}else {
					log.info("????????? ??????");
					 mav.addObject("msg", "????????? ?????? ??????");
					 mav.setViewName("common/msg");
		             mav.addObject("loc", "/board/boardPost");
				}
			}
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/board/follow")
	public Integer follow(@RequestBody Map<String, Integer> params) {
		Integer user_id = params.get("user_id");
		Integer user_login_id = params.get("user_login_id");
		FollowingDTO f = new FollowingDTO();
		f.setUser_id(user_id);
		f.setUser_login_id(user_login_id);
		int result = boardService.insertFollowing(f);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/unfollow")
	public Integer unfollow(@RequestBody Map<String, Integer> params) {
		Integer user_id = params.get("user_id");
		Integer user_login_id = params.get("user_login_id");
		FollowingDTO f = new FollowingDTO();
		f.setUser_id(user_id);
		f.setUser_login_id(user_login_id);
		int result = boardService.deleteFollowing(f);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/like")
	public Integer like(@RequestBody Map<String, Integer> params) {
		Integer user_id = params.get("user_id");
		Integer board_id = params.get("board_id");
		BoardLikeDTO b = new BoardLikeDTO();
		b.setUser_id(user_id);
		b.setBoard_id(board_id);
		int result = boardService.insertBoardLike(b);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/unlike")
	public Integer unlike(@RequestBody Map<String, Integer> params) {
		Integer user_id = params.get("user_id");
		Integer board_id = params.get("board_id");
		BoardLikeDTO b = new BoardLikeDTO();
		b.setUser_id(user_id);
		b.setBoard_id(board_id);
		int result = boardService.deleteBoardLike(b);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/biding" )
	public Integer insertBid(@RequestBody Map<String, String> param, HttpServletRequest reqeust) {
		HttpSession session = reqeust.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		Integer winning_price = Integer.parseInt(param.get("auction_price"));
		Integer auction_id = Integer.parseInt(param.get("auction_id"));
		Integer board_id =Integer.parseInt( param.get("board_id"));
		WinningBidDTO win  = new WinningBidDTO();
		win.setAuction_id(auction_id);
		win.setBoard_id(board_id);
		win.setUser_id(user.getUser_id());
		win.setWinning_price(winning_price);
		win.setWin_status("N");
		log.info(win);
		int result = boardService.insertWinning(win);
		
		
		return winning_price;
	}
	
	
	@ResponseBody
	@RequestMapping("/board/win")
	public Integer insertWin(@RequestBody Map<String, String> param, HttpServletRequest reqeust) {
		HttpSession session = reqeust.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		Integer winning_price = Integer.parseInt(param.get("auction_price"));
		Integer auction_id = Integer.parseInt(param.get("auction_id"));
		Integer board_id =Integer.parseInt( param.get("board_id"));
		WinningBidDTO win  = new WinningBidDTO();
		win.setAuction_id(auction_id);
		win.setBoard_id(board_id);
		win.setUser_id(user.getUser_id());
		win.setWinning_price(winning_price);
		win.setWin_status("Y");
		
		int result = boardService.insertWinning(win);
		
		
		return winning_price;
	}
	
	@RequestMapping("/board/delete")
	public ModelAndView deleteBoard(@RequestParam("board_id") Integer board_id, ModelAndView mav) {
		
		//board_delete Y
		int result = boardService.deleteBoard(board_id);
		
		if(result > 0) {
			result = boardService.deleteBoardImg(board_id);
			
			 mav.addObject("msg", "????????? ??????");
			 mav.setViewName("common/msg");
             mav.addObject("loc", "/board/boardList");
		}
		
		return mav;
	}
	
	@RequestMapping("/board/boardUpdate")
	public void boardUpdate(@RequestParam("board_id") Integer board_id, Model model, 
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		
		//?????? ????????? 
		List<BoardImgDTO> imgList = boardService.getBoardImgDto(board_id);
		
		//?????? ??????
		BoardDTO board = boardService.getBoardDto(board_id);
		
		
		
		model.addAttribute("categoryList",boardService.getPaymentsCategory());
		model.addAttribute("board", board);
		model.addAttribute("img", imgList);
		model.addAttribute("address", user.getUser_address());
	}
	
	@RequestMapping("/board/boardUpdateFinish")
	public ModelAndView boardUpdateFinish(BoardDTO board,@RequestParam MultipartFile[] upfile, ModelAndView mav, String main_img, HttpServletRequest request) { 
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/board");

		// trade_type ??????
		if(board.getBoard_trade_type().contains("both")) {
			board.setBoard_trade_type("both");
		}
		board.setAuction_state("N");
		
		//????????? insert ?????? board_id ????????????
		int result = boardService.updateBoard(board);
		result = boardService.updateBoardImg(board.getBoard_id());
		int board_id = 0;
		List<BoardImgDTO> imgList = new ArrayList<>();
		
		
		if(result > 0) {
			//board_id ???????????? 
			board_id = board.getBoard_id();
			
			if(board_id != 0) {
				for(MultipartFile f : upfile) {
					if(!f.isEmpty()) {
						//????????? 
						String originalFileName = f.getOriginalFilename();
						String renamedFileName = Utils.getRenamedFileName(originalFileName);
						
						//???????????? ??????
						try {
							f.transferTo(new File(saveDirection+"/"+renamedFileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						
						
						
						//List ??????
						BoardImgDTO board_img = new BoardImgDTO();
						board_img.setBoard_id(board.getBoard_id());
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
					log.info("????????? ??????");
		             mav.setViewName("common/loc");
		             mav.addObject("loc", "/board/boardVieww?board_id="+board_id);

				}else {
					log.info("????????? ??????");
					 mav.addObject("msg", "????????? ?????? ??????");
					 mav.setViewName("common/msg");
		             mav.addObject("loc", "/board/boardUpdate?board_id="+board.getBoard_id());
				}
			}
		}
		return mav;
	}
	
	@RequestMapping("/board/review")
	public ModelAndView review(ReviewDTO review, ModelAndView mav, HttpServletRequest request) {
		log.info(review);
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		review.setUser_id(user.getUser_id());
		
		int result = boardService.insertReview(review);
		
		if(result > 0) {
			 mav.addObject("msg", "?????? ?????? ??????");
			 mav.setViewName("common/msg");
			 mav.addObject("loc", "/");
		}else {
			 mav.addObject("msg", "?????? ?????? ??????");
			 mav.setViewName("common/msg");
             mav.addObject("loc", "/board/boardVieww?board_id="+ review.getBoard_id());
		}
		
		return mav;
	}
}
