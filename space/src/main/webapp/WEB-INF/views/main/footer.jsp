<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration : none;     
}
footer{
    max-width: 1920px;
    width: 1200px;
    margin: 0 auto;
}
.footer {
    clear: both;
	width: 1200px;
	height: 150px;
	padding :70px;
}
.footer .copyright ul{
    padding:0 5px;
    font-size: 12px;
    text-align: center;
    
}
.footer .copyright ul li{
    display: inline-block;
}

.footer .copyright-text{
    font-size: 12px;
    text-align: center;
}
</style>
<body>
	<footer class="footer">
        <div class="copyright">
            <ul>
                <li><a href="#">회사소개</a></li>
                <li>|</li>
                <li><a href="#">인재채용</a></li>
                <li>|</li>
                <li><a href="#">광고문의</a></li>
                <li>|</li>
                <li><a href="#">개인정보처리방침</a></li>
                <li>|</li>
                <li><a href="#">이용약관</a></li>
            </ul>
        </div>
        <div class="copyright-text">Copyright ⓒ <strong>SPACE MARKET</strong> Corp. All rights reserved.</div>  
	</footer>
</body>
</html>