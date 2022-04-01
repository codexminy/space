const hello = document.getElementById('hello'); // userLoggedIn으로 로그인 확인
if(hello.innerText == ""){
	console.log("로그아웃 중")
} else {
	console.log("로그인 중")
}
/* 문의하기(POST) */
const cu_btn = document.getElementById('cu_btn');
const contact_us = document.getElementById('contact_us');
cu_btn.addEventListener('click', () =>{
	if(hello.innerText == ""){
		alert("로그인이 필요합니다.")
	} else {
        contact_us.submit();
	}
});
/* 문의내역 보기(POST) */
const culv_btn = document.getElementById('culv_btn');
const contact_us_list_view = document.getElementById('contact_us_list_view');
culv_btn.addEventListener('click', () =>{
	if(hello.innerText == ""){
		alert("로그인이 필요합니다.")
	} else {
        contact_us_list_view.submit();
	}
});