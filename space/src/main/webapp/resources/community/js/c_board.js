const form = document.getElementById('temp_user');
const btn1 = document.getElementById('login_btn');
const hello = document.getElementById('hello'); // user_id 꺼낼 때 사용

btn1.addEventListener('click', (e) => {
		form.submit();		
});

document.querySelector('.input_login').classList.add('active');
document.querySelector('.hello_login').classList.add('active');
if(hello.innerText == ""){
	console.log("로그아웃 중")
	document.querySelector('.input_login').classList.add('active');
	document.querySelector('.hello_login').classList.remove('active');
} else {
	console.log("로그인 중")
	document.querySelector('.hello_login').classList.add('active');
	document.querySelector('.input_login').classList.remove('active');
}

/* 글쓰기(POST) */
const board_write = document.getElementById('board_write');
const board_write_on = document.getElementById('board_write_on');
board_write.addEventListener('click', () =>{
	if(hello.innerText == ""){
		alert("로그인이 필요합니다.")
	} else {
        board_write_on.submit();
	}
});

/* 댓글보기 토글 */
const view_comment = document.querySelectorAll('.view_comment');
for(let i=0; i<view_comment.length; ++i) {
    view_comment[i].addEventListener('click', () =>{
        const c_comment = document.querySelectorAll('.c_comment');
		if(c_comment[i].classList.contains('active')){
            c_comment[i].classList.remove('active');
            view_comment[i].innerText = "댓글보기↓";
        } else {
	        c_comment[i].classList.add('active');
	        view_comment[i].innerText = "댓글접기↑";
		}
    });
}

/* 댓글쓰기 토글 */
const reply_write = document.querySelectorAll('.reply_write');
for(let i=0; i<reply_write.length; ++i) {
    reply_write[i].addEventListener('click', () =>{
		if(hello.innerText == ""){
			alert("로그인이 필요합니다.")
		} else {
	        const reply_form = document.querySelectorAll('.reply_form');
			if(reply_form[i].classList.contains('active')){
	            reply_form[i].classList.remove('active');
	        } else {
		        reply_form[i].classList.add('active');
			}			
		}
    });
}

/* 대댓글쓰기 토글 */
const rereply_write = document.querySelectorAll('.rereply_write');
for(let i=0; i<rereply_write.length; ++i) {
    rereply_write[i].addEventListener('click', () =>{
		if(hello.innerText == ""){
			alert("로그인이 필요합니다.")
		} else {
	        const rereply_form = document.querySelectorAll('.rereply_form');
			if(rereply_form[i].classList.contains('active')){
	            rereply_form[i].classList.remove('active');
	        } else {
		        rereply_form[i].classList.add('active');
			}			
		}
    });
}

/* 게시글 신고 팝업 */
const view_report = document.querySelectorAll('.view_report');
const data_board_id = document.querySelectorAll('.data_board_id');
for(let i=0; i<view_report.length; ++i) {
    view_report[i].addEventListener('click', () =>{
		if(hello.innerText == ""){
			alert("로그인이 필요합니다.")
		} else {
			var center_width = '600';
    		var center_height = '300';
			var center_left = Math.ceil((window.screen.width - center_width)/2);
    		var center_top = Math.ceil((window.screen.height - center_height)/2);
    		var uid = data_board_id[i].innerText;
    		var url = "board_report?uid="+uid;
	        window.open(url,"board_report",'width='+ center_width +', height='+ center_height +', left=' + center_left + ', top='+ center_top);
		}
    });
}

/* 댓글 신고 팝업 */
const comment_report = document.querySelectorAll('.comment_report');
const data_board_id2 = document.querySelectorAll('.data_board_id2');
const data_comment_id = document.querySelectorAll('.data_comment_id');
for(let i=0; i<comment_report.length; ++i) {
    comment_report[i].addEventListener('click', () =>{
		if(hello.innerText == ""){
			alert("로그인이 필요합니다.")
		} else {
			var center_width = '600';
    		var center_height = '340';
			var center_left = Math.ceil((window.screen.width - center_width)/2);
    		var center_top = Math.ceil((window.screen.height - center_height)/2);
    		var uid1 = data_board_id2[i].innerText;
    		var uid2 = data_comment_id[i].innerText;
    		var url = "comment_report?uid1="+uid1+"&uid2="+uid2;
	        window.open(url,"comment_report",'width='+ center_width +', height='+ center_height +', left=' + center_left + ', top='+ center_top);
		}
    });
}


