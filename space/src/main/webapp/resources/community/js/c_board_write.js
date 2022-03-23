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

