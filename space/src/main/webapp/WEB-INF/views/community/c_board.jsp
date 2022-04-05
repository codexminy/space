<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	request.setAttribute("c_board_id", request.getParameter("c_board_id"));
%>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/c_board.css?ver=2" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id='wrap_cm'>
		<p id="hello">${userLoggedIn.user_id }</p>
		<div id="community_category">
			<ul>
				<li><a href="main">전체보기</a></li>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<li><a href="category?id=${c_category_list.c_category_id }">${c_category_list.c_category_name }</a></li>
				</c:forEach>
			</ul>		
		</div>
		<main>
			<div class="flex-end">
				<div id="board_write">글쓰기
					<form id="board_write_on" action="./c_board_write" method="POST">
					</form>
				</div>
			</div>
			<c:forEach items="${c_board_list }" var="c_board_list">
			<c:if test="${c_board_list.c_board_id eq c_board_id }">
				<c:choose>
				<c:when test="${c_board_list.c_board_delete eq 'N'}">
				
					<div class='c_board'>
						<div class='c_category'>${c_board_list.c_category_name }</div>
						<div class='c_board_profile'>
							<c:forEach items="${c_user_list }" var="c_user_list">
							<c:if test="${c_board_list.user_id eq c_user_list.user_id}">
								<c:choose>
								<c:when test="${not empty c_user_list.user_profile }">
									<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
								</c:otherwise>
								</c:choose>
							</c:if>
							</c:forEach>
						</div>
						<ul class='c_board_writer'>
							<li>${c_board_list.user_nickname }</li>
							<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
						</ul>
						<h3>${c_board_list.c_board_title }</h3>
						<hr />
						<div class='view_count'>조회수: ${c_board_list.c_board_view }</div>
						<div class='c_board_max_height'>
							<p class='c_board_content'>${c_board_list.c_board_content }</p>
						</div>
						<hr />
						<ul class='c_board_option'>
							<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/empathy.png" width="20px" height="18px">공감하기</li> -->
							<li><img src="${pageContext.request.contextPath}/resources/images/community/spacetalk.png" width="20px" height="18px">댓글
								<c:forEach items="${c_comment_count }" var="c_comment_count">
								<c:choose>
								<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
									${c_comment_count.total }
								</c:when>
								</c:choose>	
								</c:forEach>
							</li>
							<li class='view_report'>신고하기
								<p class='data_board_id'>${c_board_list.c_board_id }</p>
							</li>
							<li class='view_comment'>댓글접기↑</li>
						</ul>
						<div class='c_comment active'>
							<hr />
							<c:forEach items="${c_comment_list }" var="c_comment_list">
							<c:choose>
							<c:when test="${(c_comment_list.c_board_id eq c_board_list.c_board_id) and (c_comment_list.c_depth eq 0)}">
								<div class='c_comment_box'>
									<div class='depth${c_comment_list.c_depth }'>
										<div class='c_comment_profile'>
											<c:forEach items="${c_user_list }" var="c_user_list">
											<c:if test="${c_comment_list.user_id eq c_user_list.user_id}">
												<c:choose>
												<c:when test="${not empty c_user_list.user_profile }">
													<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
												</c:otherwise>
												</c:choose>
											</c:if>
											</c:forEach>
										</div>
										<ul class='c_board_commenter'>
											<li>${c_comment_list.user_nickname }</li>
											<li><fmt:formatDate value="${c_comment_list.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
										</ul>
										<div class='c_comment_content'>${c_comment_list.c_content }</div>
										<ul class='c_comment_option'>
											<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/c_heart.png" alt="좋아요" width="15px" height="13px" />좋아요</li> -->
											<li class='reply_write'>답글쓰기
											</li>
											<li class='comment_report'>신고하기
												<p class='data_board_id2'>${c_comment_list.c_board_id }</p>
												<p class='data_comment_id'>${c_comment_list.c_id }</p>
											</li>
										</ul>
									</div>
									<div class='reply_form'>
										<div class='c_comment_myprofile'>
											<c:forEach items="${c_user_list }" var="c_user_list">
											<c:if test="${userLoggedIn.user_id eq c_user_list.user_id}">
												<c:choose>
												<c:when test="${not empty c_user_list.user_profile }">
													<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="30px"/>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="30px"/>
												</c:otherwise>
												</c:choose>
											</c:if>
											</c:forEach>
										</div>
										<form class='reply_write_form' name="replyForm" action="./reply_write" method="POST">
											<textarea class='reply_textarea' name="c_content" style="width:91%;height:30px;overflow:visible;text-overflow:ellipsis;"></textarea>
											<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
											<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
											<input type="hidden" name="c_depth" value="1" />
											<input type="hidden" name="c_group_id" value="${c_comment_list.c_id }" />
											<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
											<input class='reply_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
										</form>
									</div>
									<c:forEach items="${c_comment_list2 }" var="c_comment_list2">
									<c:if test="${(c_comment_list.c_id eq c_comment_list2.c_group_id) and (c_comment_list2.c_depth eq 1)}">
										<div class='depth${c_comment_list2.c_depth }'>
											<div class='c_comment_profile'>
												<c:forEach items="${c_user_list }" var="c_user_list">
												<c:if test="${c_comment_list2.user_id eq c_user_list.user_id}">
													<c:choose>
													<c:when test="${not empty c_user_list.user_profile }">
														<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
													</c:otherwise>
													</c:choose>
												</c:if>
												</c:forEach>
											</div>
											<ul class='c_board_commenter'>
												<li>${c_comment_list2.user_nickname }</li>
												<li><fmt:formatDate value="${c_comment_list2.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
											</ul>
											<div class='c_comment_content'>${c_comment_list2.c_content }</div>
											<ul class='c_comment_option'>
												<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/c_heart.png" alt="좋아요" width="15px" height="13px" />좋아요</li> -->
												<li class='rereply_write'>답글쓰기</li>
												<li class='comment_report'>신고하기
													<p class='data_board_id2'>${c_comment_list2.c_board_id }</p>
													<p class='data_comment_id'>${c_comment_list2.c_id }</p>
												</li>
											</ul>
										</div>
										<div class='rereply_form'>
											<div class='c_comment_myprofile'>
												<c:forEach items="${c_user_list }" var="c_user_list">
												<c:if test="${userLoggedIn.user_id eq c_user_list.user_id}">
													<c:choose>
													<c:when test="${not empty c_user_list.user_profile }">
														<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="30px"/>
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="30px"/>
													</c:otherwise>
													</c:choose>
												</c:if>
												</c:forEach>
											</div>
											<form class='rereply_write_form' name="rereplyForm" action="./reply_write" method="POST">
												<textarea class='reply_textarea' name="c_content" style="width:91%;height:30px;overflow:visible;text-overflow:ellipsis;"></textarea>
												<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
												<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
												<input type="hidden" name="c_depth" value="2" />
												<input type="hidden" name="c_group_id" value="${c_comment_list2.c_id }" />
												<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
												<input class='rereply_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
											</form>
										</div>
										<c:forEach items="${c_comment_list3 }" var="c_comment_list3">
										<c:if test="${(c_comment_list2.c_id eq c_comment_list3.c_group_id) and (c_comment_list3.c_depth eq 2)}">
											<div class='depth${c_comment_list3.c_depth }'>
												<div class='c_comment_profile'>
													<c:forEach items="${c_user_list }" var="c_user_list">
													<c:if test="${c_comment_list3.user_id eq c_user_list.user_id}">
														<c:choose>
														<c:when test="${not empty c_user_list.user_profile }">
															<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
														</c:when>
														<c:otherwise>
															<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
														</c:otherwise>
														</c:choose>
													</c:if>
													</c:forEach>
												</div>
												<ul class='c_board_commenter'>
													<li>${c_comment_list3.user_nickname }</li>
													<li><fmt:formatDate value="${c_comment_list3.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
												</ul>
												<div class='c_comment_content'>${c_comment_list3.c_content }</div>
												<ul class='c_comment_option'>
													<li class='comment_report'>신고하기
														<p class='data_board_id2'>${c_comment_list3.c_board_id }</p>
														<p class='data_comment_id'>${c_comment_list3.c_id }</p>
													</li>
												</ul>
											</div>					
										</c:if>
										</c:forEach>
									</c:if>
									</c:forEach>
								</div>
							</c:when>
							</c:choose>
							</c:forEach>
							<c:choose>
							<c:when test="${not empty userLoggedIn.user_id}">
								<div class='mycomment'>
									<!--<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${userLoggedIn.user_id }.png" width="50px"/></div>  -->
									<div class='c_comment_myprofile'>
										<img src="${pageContext.request.contextPath}/resources/images/chatting/add_content.png" width="50px"/>
									</div>
									<form class='c_comment_write' name="commentForm" action="./comment_write" method="POST">
										<textarea class='c_comment_textarea' name="c_content" style="width:87%;height:50px;overflow:visible;text-overflow:ellipsis;"></textarea>
										<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
										<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
										<input class='c_comment_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
									</form>
								</div>			
							</c:when>
							</c:choose>	
							
						</div>
					</div>
				
				</c:when>
				<c:otherwise>
				
					<div class='c_board'>
						<div class='c_category'>${c_board_list.c_category_name }</div>
						<div class='alert'>신고된 게시물</div>
						<div class='c_board_profile'>
							<c:forEach items="${c_user_list }" var="c_user_list">
							<c:if test="${c_board_list.user_id eq c_user_list.user_id}">
								<c:choose>
								<c:when test="${not empty c_user_list.user_profile }">
									<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
								</c:otherwise>
								</c:choose>
							</c:if>
							</c:forEach>
						</div>
						<ul class='c_board_writer'>
							<li>${c_board_list.user_nickname }</li>
							<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
						</ul>
						<h3>${c_board_list.c_board_title }</h3>
						<hr />
						<div class='view_count'>조회수: ${c_board_list.c_board_view }</div>
						<div class='c_board_max_height'>
							<p class='c_board_content'>${c_board_list.c_board_content }</p>
						</div>
						<hr />
						<ul class='c_board_option'>
							<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/empathy.png" width="20px" height="18px">공감하기</li> -->
							<li><img src="${pageContext.request.contextPath}/resources/images/community/spacetalk.png" width="20px" height="18px">댓글
								<c:forEach items="${c_comment_count }" var="c_comment_count">
								<c:choose>
								<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
									${c_comment_count.total }
								</c:when>
								</c:choose>	
								</c:forEach>
							</li>
							<li class='view_report'>신고하기
								<p class='data_board_id'>${c_board_list.c_board_id }</p>
							</li>
							<li class='view_comment'>댓글접기↑</li>
						</ul>
						<div class='c_comment active'>
							<hr />
							<c:forEach items="${c_comment_list }" var="c_comment_list">
							<c:choose>
							<c:when test="${(c_comment_list.c_board_id eq c_board_list.c_board_id) and (c_comment_list.c_depth eq 0)}">
								<div class='c_comment_box'>
									<div class='depth${c_comment_list.c_depth }'>
										<div class='c_comment_profile'>
											<c:forEach items="${c_user_list }" var="c_user_list">
											<c:if test="${c_comment_list.user_id eq c_user_list.user_id}">
												<c:choose>
												<c:when test="${not empty c_user_list.user_profile }">
													<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
												</c:otherwise>
												</c:choose>
											</c:if>
											</c:forEach>
										</div>
										<ul class='c_board_commenter'>
											<li>${c_comment_list.user_nickname }</li>
											<li><fmt:formatDate value="${c_comment_list.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
										</ul>
										<div class='c_comment_content'>${c_comment_list.c_content }</div>
										<ul class='c_comment_option'>
											<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/c_heart.png" alt="좋아요" width="15px" height="13px" />좋아요</li> -->
											<li class='reply_write'>답글쓰기
											</li>
											<li class='comment_report'>신고하기
												<p class='data_board_id2'>${c_comment_list.c_board_id }</p>
												<p class='data_comment_id'>${c_comment_list.c_id }</p>
											</li>
										</ul>
									</div>
									<div class='reply_form'>
										<div class='c_comment_myprofile'>
											<c:forEach items="${c_user_list }" var="c_user_list">
											<c:if test="${userLoggedIn.user_id eq c_user_list.user_id}">
												<c:choose>
												<c:when test="${not empty c_user_list.user_profile }">
													<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="30px"/>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="30px"/>
												</c:otherwise>
												</c:choose>
											</c:if>
											</c:forEach>
										</div>
										<form class='reply_write_form' name="replyForm" action="./reply_write" method="POST">
											<textarea class='reply_textarea' name="c_content" style="width:91%;height:30px;overflow:visible;text-overflow:ellipsis;"></textarea>
											<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
											<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
											<input type="hidden" name="c_depth" value="1" />
											<input type="hidden" name="c_group_id" value="${c_comment_list.c_id }" />
											<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
											<input class='reply_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
										</form>
									</div>
									<c:forEach items="${c_comment_list2 }" var="c_comment_list2">
									<c:if test="${(c_comment_list.c_id eq c_comment_list2.c_group_id) and (c_comment_list2.c_depth eq 1)}">
										<div class='depth${c_comment_list2.c_depth }'>
											<div class='c_comment_profile'>
												<c:forEach items="${c_user_list }" var="c_user_list">
												<c:if test="${c_comment_list2.user_id eq c_user_list.user_id}">
													<c:choose>
													<c:when test="${not empty c_user_list.user_profile }">
														<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
													</c:otherwise>
													</c:choose>
												</c:if>
												</c:forEach>
											</div>
											<ul class='c_board_commenter'>
												<li>${c_comment_list2.user_nickname }</li>
												<li><fmt:formatDate value="${c_comment_list2.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
											</ul>
											<div class='c_comment_content'>${c_comment_list2.c_content }</div>
											<ul class='c_comment_option'>
												<!-- <li><img src="${pageContext.request.contextPath}/resources/images/community/c_heart.png" alt="좋아요" width="15px" height="13px" />좋아요</li> -->
												<li class='rereply_write'>답글쓰기</li>
												<li class='comment_report'>신고하기
													<p class='data_board_id2'>${c_comment_list2.c_board_id }</p>
													<p class='data_comment_id'>${c_comment_list2.c_id }</p>
												</li>
											</ul>
										</div>
										<div class='rereply_form'>
											<div class='c_comment_myprofile'>
												<c:forEach items="${c_user_list }" var="c_user_list">
												<c:if test="${userLoggedIn.user_id eq c_user_list.user_id}">
													<c:choose>
													<c:when test="${not empty c_user_list.user_profile }">
														<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="30px"/>
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="30px"/>
													</c:otherwise>
													</c:choose>
												</c:if>
												</c:forEach>
											</div>
											<form class='rereply_write_form' name="rereplyForm" action="./reply_write" method="POST">
												<textarea class='reply_textarea' name="c_content" style="width:91%;height:30px;overflow:visible;text-overflow:ellipsis;"></textarea>
												<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
												<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
												<input type="hidden" name="c_depth" value="2" />
												<input type="hidden" name="c_group_id" value="${c_comment_list2.c_id }" />
												<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
												<input class='rereply_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
											</form>
										</div>
										<c:forEach items="${c_comment_list3 }" var="c_comment_list3">
										<c:if test="${(c_comment_list2.c_id eq c_comment_list3.c_group_id) and (c_comment_list3.c_depth eq 2)}">
											<div class='depth${c_comment_list3.c_depth }'>
												<div class='c_comment_profile'>
													<c:forEach items="${c_user_list }" var="c_user_list">
													<c:if test="${c_comment_list3.user_id eq c_user_list.user_id}">
														<c:choose>
														<c:when test="${not empty c_user_list.user_profile }">
															<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
														</c:when>
														<c:otherwise>
															<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
														</c:otherwise>
														</c:choose>
													</c:if>
													</c:forEach>
												</div>
												<ul class='c_board_commenter'>
													<li>${c_comment_list3.user_nickname }</li>
													<li><fmt:formatDate value="${c_comment_list3.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
												</ul>
												<div class='c_comment_content'>${c_comment_list3.c_content }</div>
												<ul class='c_comment_option'>
													<li class='comment_report'>신고하기
														<p class='data_board_id2'>${c_comment_list3.c_board_id }</p>
														<p class='data_comment_id'>${c_comment_list3.c_id }</p>
													</li>
												</ul>
											</div>					
										</c:if>
										</c:forEach>
									</c:if>
									</c:forEach>
								</div>
							</c:when>
							</c:choose>
							</c:forEach>
							<c:choose>
							<c:when test="${not empty userLoggedIn.user_id}">
								<div class='mycomment'>
									<!--<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${userLoggedIn.user_id }.png" width="50px"/></div>  -->
									<div class='c_comment_myprofile'>
										<img src="${pageContext.request.contextPath}/resources/images/chatting/add_content.png" width="50px"/>
									</div>
									<form class='c_comment_write' name="commentForm" action="./comment_write" method="POST">
										<textarea class='c_comment_textarea' name="c_content" style="width:87%;height:50px;overflow:visible;text-overflow:ellipsis;"></textarea>
										<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
										<input type="hidden" name="user_id" value="${userLoggedIn.user_id }" />
										<input class='c_comment_btn' type="image" src="${pageContext.request.contextPath}/resources/images/chatting/send.png" value="등록"/>
									</form>
								</div>			
							</c:when>
							</c:choose>	
							
						</div>
					</div>
				
				</c:otherwise>
				</c:choose>
				
			</c:if>
			</c:forEach>
		</main>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/community/js/c_board.js?ver=3"></script>
</body>
</html>