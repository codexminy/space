<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="list-wrap">
	<div class="search-setting-wrap">
		<div class="deleteCheck" onclick="deleteCheck('${table}')">삭제</div>
		<select name="amount" onchange="startSearch()" class="amount">
			<option value="10" selected>10개</option>
			<option value="20">20개</option>
			<option value="30">30개</option>
			<option value="40">40개</option>
			<option value="50">50개</option>
		</select>
	</div>
	<table class="common-table">
		<colgroup>
			<c:forEach var="width" items="${width }">
				<col width="${width }">
			</c:forEach>
		</colgroup>
		<thead>
			<tr>
				<c:forEach var="head" items="${head }">
					<th>${head }</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody class="list"></tbody>
	</table>
	<div class="pagenation">
		<ul class="paging"></ul>
	</div>
	<div class="search-wrap">
		<div class="search-area"></div>
		<button class="search" type="button" onclick="startSearch()">검색</button>
	</div>
</div>
<form id="form" action="${path }${detailUrl}" method="get">
	<input type="hidden" name="${id }" id="detail"/>
</form>










