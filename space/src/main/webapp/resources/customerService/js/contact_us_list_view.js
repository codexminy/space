const snb_check = document.getElementById('snb_check');
const contentList = document.querySelector('.contentList');
if(snb_check.children.length == 0){
	snb_check.innerHTML = "<li>문의내역이 없습니다.</li>";
	contentList.innerHTML = "<p>문의내역이 없습니다.</p>";
}