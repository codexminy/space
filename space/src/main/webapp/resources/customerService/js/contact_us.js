/* 등록,취소 */
const contact_us_create = document.getElementById('contact_us_create');
const submit_btn = document.getElementById('submit_btn');
const go_back_main = document.getElementById('go_back_main');
const go_back_btn = document.getElementById('go_back_btn');
/* 전송 */
submit_btn.addEventListener('click', () => {
	
	var cs_category_select = document.getElementById("cs_category_select");
	
	if(contact_us_create.user_id.value == ""){
		alert("로그인을 해주세요");
		go_back_main.submit();
	} else if(cs_category_select.value == "none") {
		alert("카테고리를 선택해주세요");
	} else if(contact_us_create.cu_title.value == "") {
		alert("제목을 입력해주세요.");
	} else if(contact_us_create.cu_content.value == "") {
		alert("내용을 입력해주세요.");
	} else{
		contact_us_create.submit();
	}	
});
/* 돌아가기 */
go_back_btn.addEventListener('click', () => {
		go_back_main.submit();
});