const snb_check = document.getElementById('snb_check');
const contentList = document.querySelector('.contentList');
if(snb_check.children.length == 0){
	snb_check.innerHTML = "<li>문의내역이 없습니다.</li>";
	contentList.innerHTML = "<p>문의내역이 없습니다.</p>";
}

const comment_check = document.querySelector('.comment_check');
if(comment_check.children.length <= 1){
	comment_check.innerHTML += "<li>현재 답변 대기 중 상태입니다.<br>신속하게 답변을 드릴 예정이오니, 조금만 더 기다려주세요.<br>최선을 다하는 우주마켓 되겠습니다.<br>감사합니다.</li>";
}