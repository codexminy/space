<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/community.css?ver=2" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrap_cm">
		<header>
			<div class="input_login">
				<form id="temp_user" name="createForm" action="./login" method="POST">
					<input type="text" name="temp_id" placeholder="아이디를 입력하세요." autocomplete="off" />
					<input type="password" name="temp_pw" placeholder="비밀번호를 입력하세요." autocomplete="off" />
				</form>
				<button id="login_btn">확인</button>
			</div>
			<div class="hello_login">${user_id }님 반갑습니다.</div>
			<p id="hello">${user_id }</p>
		</header>
		<div id="community_category">
			<ul>
				<a href="main"><li>전체보기</li></a>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<a href="category?id=${c_category_list.c_category_id }"><li>${c_category_list.c_category_name }</li></a>
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
				<div class='c_board'>
					<form class="c_board_view" action="./c_board" method="GET">
						<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
					</form>
					<div class='c_category'>${c_board_list.c_category_name }</div>
					<div class='c_board_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_board_list.user_id }.png" width="60px"/></div>
					<ul class='c_board_writer'>
						<li>작성자&nbsp;&nbsp;${c_board_list.user_nickname }</li>
						<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
					</ul>
					<h3>${c_board_list.c_board_title }</h3>
					<hr />
					<div class='c_board_max_height'>
						<div class='view_count'>조회수: ${c_board_list.c_board_view }</div>
						<p class='c_board_content'>${c_board_list.c_board_content }</p>
					</div>
					<hr />
					<ul class='c_board_option'>
						<!-- 
						<li class='view_report'>신고하기
							<p class='data_board_id'>${c_board_list.c_board_id }</p>
						</li>
						 -->						
						<li class='view_comment'><img src="${pageContext.request.contextPath}/resources/images/community/spacetalk.png" width="20px" height="18px">댓글보기
							<c:forEach items="${c_comment_count }" var="c_comment_count">
							<c:choose>
							<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
								${c_comment_count.total }
							</c:when>
							</c:choose>	
							</c:forEach>
						</li>
					</ul>
					<div class='c_comment'>
						<hr />
						<c:forEach items="${c_comment_list }" var="c_comment_list">
						<c:choose>
						<c:when test="${(c_comment_list.c_board_id eq c_board_list.c_board_id) and (c_comment_list.c_depth eq 0)}">
							<div class='c_comment_box'>
								<div class='depth${c_comment_list.c_depth }'>
									<div class='c_comment_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_comment_list.user_id }.png" width="60px"/></div>
									<ul class='c_board_commenter'>
										<li>작성자&nbsp;&nbsp;${c_comment_list.user_nickname }</li>
										<li><fmt:formatDate value="${c_comment_list.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
									</ul>
									<div class='c_comment_content'>${c_comment_list.c_content }</div>
									<ul class='c_comment_option'>
										<li class='comment_report'>신고하기
											<p class='data_board_id2'>${c_comment_list.c_board_id }</p>
											<p class='data_comment_id'>${c_comment_list.c_id }</p>
										</li>
										<li class='reply_write'>답글쓰기
										</li>
									</ul>
								</div>
								<div class='reply_form'>
									<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${user_id }.png" width="30px"/></div>
									<form class='reply_write_form' name="replyForm" action="./reply_write" method="POST">
										<textarea class='reply_textarea' name="c_content" style="width:87%;height:30px;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
										<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
										<input type="hidden" name="user_id" value="${user_id }" />
										<input type="hidden" name="c_depth" value="1" />
										<input type="hidden" name="c_group_id" value="${c_comment_list.c_id }" />
										<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
										<input class='reply_btn' type="submit" value="등록"/>
									</form>
								</div>
								<c:forEach items="${c_comment_list2 }" var="c_comment_list2">
								<c:if test="${(c_comment_list.c_id eq c_comment_list2.c_group_id) and (c_comment_list2.c_depth eq 1)}">
									<div class='depth${c_comment_list2.c_depth }'>
										<div class='c_comment_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_comment_list2.user_id }.png" width="60px"/></div>
										<ul class='c_board_commenter'>
											<li>작성자&nbsp;&nbsp;${c_comment_list2.user_nickname }</li>
											<li><fmt:formatDate value="${c_comment_list2.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
										</ul>
										<div class='c_comment_content'>${c_comment_list2.c_content }</div>
										<ul class='c_comment_option'>
											<li class='comment_report'>신고하기
												<p class='data_board_id2'>${c_comment_list2.c_board_id }</p>
												<p class='data_comment_id'>${c_comment_list2.c_id }</p>
											</li>
											<li class='rereply_write'>답글쓰기</li>
										</ul>
									</div>
									<div class='rereply_form'>
										<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${user_id }.png" width="30px"/></div>
										<form class='rereply_write_form' name="rereplyForm" action="./reply_write" method="POST">
											<textarea class='reply_textarea' name="c_content" style="width:87%;height:30px;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
											<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
											<input type="hidden" name="user_id" value="${user_id }" />
											<input type="hidden" name="c_depth" value="2" />
											<input type="hidden" name="c_group_id" value="${c_comment_list2.c_id }" />
											<input type="hidden" name="c_group_order_id" value="${c_comment_list.c_id }" />
											<input class='rereply_btn' type="submit" value="등록"/>
										</form>
									</div>
									<c:forEach items="${c_comment_list3 }" var="c_comment_list3">
									<c:if test="${(c_comment_list2.c_id eq c_comment_list3.c_group_id) and (c_comment_list3.c_depth eq 2)}">
										<div class='depth${c_comment_list3.c_depth }'>
											<div class='c_comment_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_comment_list3.user_id }.png" width="60px"/></div>
											<ul class='c_board_commenter'>
												<li>작성자&nbsp;&nbsp;${c_comment_list3.user_nickname }</li>
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
						<c:when test="${not empty user_id}">
							<div class='mycomment'>
								<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${user_id }.png" width="50px"/></div>
								<form class='c_comment_write' name="commentForm" action="./comment_write" method="POST">
									<textarea class='c_comment_textarea' name="c_content" style="width:80%;height:50px;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
									<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
									<input type="hidden" name="user_id" value="${user_id }" />
									<input class='c_comment_btn' type="submit" value="등록"/>
								</form>
							</div>			
						</c:when>
						</c:choose>	
						
					</div>
				</div>
			</c:forEach>
		</main>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/community/js/community.js?ver=3"></script>
</body>
</html>