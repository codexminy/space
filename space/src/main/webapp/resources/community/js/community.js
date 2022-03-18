const form = document.getElementById('temp_user');
const form2 = document.createForm; // 꼭 id로 가져올 필요 없이 네임으로 가져올 수도 있다.
const btn1 = document.getElementById('login_btn');

btn1.addEventListener('click', (e) => {
		form.submit();		
});

document.querySelector('.input_login').classList.add('active');
document.querySelector('.hello_login').classList.add('active');
if(document.getElementById('hello').innerText == ""){
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
    })
}