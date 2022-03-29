/* 임시 로그인 */
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

/* 삭제 대기 
const postimg = document.getElementById("postimg");
const upload_file = document.getElementById("upload_file");

postimg.addEventListener('click', (e)=> {
	upload_file.click();
});

function readFile(e) {		
		for(var image of e.files){
			var cnt = 1;
			var reader = new FileReader();			
			reader.onload = e => {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "upload_img");
				img.setAttribute("id", "upload_img"+cnt);
				img.setAttribute("alt", cnt-1);	
				document.querySelector("div#img_div"+cnt).appendChild(img);	
				cnt++;
			};
		reader.readAsDataURL(image);
	}
};

upload_file.addEventListener("change", e => {
	if(e.target.files.length > 5){
		upload_file.value = "";
		
		alert("최대 5장까지 등록이 가능합니다.");
	} else {
		var reuslt = false;
		for(var image of e.target.files){
			console.log(image.name);
			result = CheckImagefiles(image.name);
		}
		if(result){
			readFile(e.target);
		} else {
			alert("jpg,jpeg,png 확장자만 등록이 가능합니다.");
		}
	}
});

function CheckImagefiles(fileName) {
    var result = false;
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    if(!ext){
        return result;
    }
    var imgs = ['png', 'jpg', 'jpeg'];
    ext = ext.toLocaleLowerCase();
    imgs.forEach( function(element) {
        if(ext == element){
            result = true;
        }
    });
    return result;
}
*/

/* 등록,취소 */
const c_board_create = document.getElementById('c_board_create');
const go_back_main = document.getElementById('go_back_main');
const submit_btn = document.getElementById('submit_btn');
const go_back_btn = document.getElementById('go_back_btn');
/* 전송 */
submit_btn.addEventListener('click', () => {
	
	var c_category_select = document.getElementById("c_category_select");
	
	if(c_board_create.user_id.value == ""){
		alert("로그인을 해주세요");
		go_back_main.submit();
	} else if(c_category_select.value == "none") {
		alert("카테고리를 선택해주세요");
	} else if(c_board_create.c_board_title.value == "") {
		alert("제목을 입력해주세요.");
	} else if(c_board_create.c_board_content.value == "") {
		alert("내용을 입력해주세요.");
	} else{
		c_board_create.submit();
	}	
});
/* 돌아가기 */
go_back_btn.addEventListener('click', () => {
		go_back_main.submit();
});














