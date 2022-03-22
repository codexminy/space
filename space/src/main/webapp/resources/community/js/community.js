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

const view_comment = document.querySelectorAll('.view_comment');
for(let i=0; i<view_comment.length; ++i) {
    view_comment[i].addEventListener('click', () =>{
        const c_comment = document.querySelectorAll('.c_comment');
		if(c_comment[i].classList.contains('active')){
            c_comment[i].classList.remove('active');
            view_comment[i].innerText = "펼치기";
        } else {
	        c_comment[i].classList.add('active');
	        view_comment[i].innerText = "접기";
		}
    });
}

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

const view_report = document.querySelectorAll('.view_report');
const data_board_id = document.querySelectorAll('.data_board_id');
for(let i=0; i<rereply_write.length; ++i) {
    view_report[i].addEventListener('click', () =>{
		if(hello.innerText == ""){
			alert("로그인이 필요합니다.")
		} else {
			var center_width = '600';
    		var center_height = '300';
			var center_left = Math.ceil((window.screen.width - center_width)/2);
    		var center_top = Math.ceil((window.screen.height - center_height)/2);
    		var uid = data_board_id[i].innerText;
    		var url = "report?uid="+uid;
	        window.open(url,"report_page",'width='+ center_width +', height='+ center_height +', left=' + center_left + ', top='+ center_top);
		}
    });
}


