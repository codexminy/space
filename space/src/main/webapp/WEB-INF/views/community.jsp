<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<style>
		html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,
		small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,
		aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,
		nav,output,ruby,section,summary,time,mark,audio,video {
		  margin: 0;
		  padding: 0;
		  border: 0;
		  font-size: 100%;
		  font: inherit;
		  vertical-align: baseline;
		}
		/* HTML5 display-role reset for older browsers */
		article,aside,details,figcaption,figure,footer,header,hgroup,menu,
		nav,section {
		  display: block;
		}
		body {
		  line-height: 1;
		}
		ol,
		ul {
		  list-style: none;
		}
		blockquote,
		q {
		  quotes: none;
		}
		blockquote:before,
		blockquote:after,
		q:before,
		q:after {
		  content: "";
		  content: none;
		}
		table {
		  border-collapse: collapse;
		  border-spacing: 0;
		}
		input:focus {
		  outline: none;
		}
		a {
		  color: inherit;
		  text-decoration: none;
		}
		*, *::before, *::after {
		    padding: 0;
		    margin: 0 auto;
		    box-sizing: border-box;
		}
		/* 텍스트 마우스 드래그시 색상 변경방법 */
		::selection,
		::-moz-selection {
		    background : #39f;
		    color      : #fff;
		    text-shadow: none;
		}
		link {
		    display: none;
		}
		html {
		    font-family: 'Noto Sans KR', 'Roboto Slab', sans-serif;
		      /* `font` 속성 리셋 */
		    font-size                  : 62.5%;
		    /* 기본 글꼴 사이즈 정의            : 16x => 1rem */
		    font-weight                : normal;
		    line-height                : 1.5;
		    /* 단위 쓰지 말것 */
		    background-color           : #fff;
		    color                      : #4d5058;
		    /* 글꼴 크기 조정을 방지 */
		    -webkit-text-size-adjust   : 100%;
		    /* 폰트를 부드럽게 */
		    -webkit-font-smoothing     : antialiased;
		    -moz-osx-font-smoothing    : grayscale;
		    /* 웹킷 마음대로 눌림 하이라이트 막음 */
		    -webkit-tap-highlight-color: transparent;
		}
		html{
			width:1920px;
            height: 100%;
            background-color: white;
		}
		body{
			width:1200px;
			background-color: #dddddd;
            height: 100%;
            margin: 0 auto;
		}
		main {
			width:800px;
			background-color: #fff;
            height: 100%;
            margin: 0 auto;
		}
		main > ul{
			/* 임시*/
			padding-top: 300px;
			display: flex;
			justify-content: space-between;
		}
		main > ul > li {
			width:100px;
			height:40px;
			background-color: #eee;
			text-align: center;
			line-height: 40px;
		}
		.c_board {
			margin-top: 50px;
			width: 100%;
			border: 1px solid #333;
			border-radius: 10px;
		}
		.c_board > .c_category {
			display:inline-block;
			margin: 10px 0 10px 20px;
			padding: 5px;
			border: 1px solid #999;
			border-radius: 5px;
		}
		.c_board > .c_board_img {
			display:inline-block;
			width: 60px;
			height: 60px;
			float: right;
			margin: 10px 20px 10px 10px;
			border: 1px solid #999;
			border-radius: 9999px;
			text-align: center;
			line-height: 60px;
		}
		.c_board > ul {
			display:inline-block;
			float: right;
			text-align: right;
			font-size: 16px;
			margin: 10px;
			margin-top: 20px;
			line-height: 20px;
		}
		.c_board > h3 {
			margin: 20px 0 10px 20px;
			font-size: 20px;
		}
		.c_board > hr {
			margin: 0 10px;
		}
		.c_board > p {
			margin: 30px 20px;
			font-size: 20px;
		}
	</style>
</head>
<body>
	<div>
		<header>
			
		</header>
		<main>
			<ul>
				<li>
					전체
				</li>
				<li>
					카테고리1
				</li>
				<li>
					카테고리2
				</li>
				<li>
					카테고리3
				</li>
				<li>
					카테고리4
				</li>
				<li>
					카테고리5
				</li>
			</ul>
			<div class='c_board'>
				<div class='c_category'>카테고리1</div>
				<div class='c_board_img'>프로필</div>
				<ul>
					<li>작성자 이름</li>
					<li>22.03.08&nbsp;&nbsp;&nbsp;&nbsp;11:32</li>
				</ul>				
				<h3>제모오오오ㅗ오오오오ㅗ오오옥</h3>
				<hr />
				<p>내요오오ㅗ오오오ㅗ오오옹ㅇㅇ</p>
				<div>댓글쓰기</div>
			</div>
		</main>
	</div>
</body>
</html>