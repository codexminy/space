const send_btn = document.getElementById('send_btn');
const report = document.getElementById('report'); 
send_btn.addEventListener('click', () =>{
	report.submit();
});
