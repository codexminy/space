<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Post</title>
</head>
<style>
.top {
	width: 1200px;
	height: 200px;
}
.board_wrapper {
	width: 1200px;
	height : 1000px;
	/* background-color: red; */

}
body {
	display: flex;
	justify-content: center; /*가로에서 가우데에 요소를 배치*/
}
.board_p {
	width: 1200px;
}
.board_top {
	display : flex;
	width: 1200px;
	height: 300px;
	flex-flow: row wrap;
	align-content: flex-start;
}
.board_img {
	width: 25%;
	height: 300px;
	margin : 0 ;
	flex-basis: auto; /* 기본값 */
	cursor: pointer;
	
}
.board_img > img {
	width: 200px;
	height: 200px;
	margin-right: 0;
	border-radius: 5px;
	border : 1px solid gray;
}
.board_tag {
	width: 15%;
	flex-basis: auto; /* 기본값 */
	margin-right: 0;
}
.board_tag > ul  {
	margin-top: 43%;
}
.board_tag > ul > li {
	margin-top: 30%;
	font-size: 18px;
	line-height: 18px;
}
ul { 
	list-style: none;
	text-align: center
}
li {
	text-decoration: none;
}
.board_input {
	width: 60%;
}
/* .board_input > form {
	margin-top: 10%;
} */
/* .board_input> form > ul > li{
	margin-top: 5%;
	height: 30px;
} */
.board_input > ul > li{
	margin-top: 5%;
	height: 30px;
}
.category {
	width: 30%;
	height: 30px;
	border-radius: 5px;
	border : 1px solid gray;
	text-align: center;
	float: left;

}
.title {
	width: 65%;
	height: 25px;
	border-radius: 5px;
	border : 1px solid gray;
	
}
.price {
	width: 55%;
	height: 25px;
	border-radius: 5px;
	border : 1px solid gray;
	float: left;
}
#address {
	width: 55%;
	height: 25px;
	border-radius: 5px;
	border : 1px solid gray;
	float: left;
}
.radio{
	float: left;
}
.label {
	float: left;
}
.board_middle {
	width: 1200px;
	height: 100px;
	display: flex;
}
.img_div {
	width: 80px;
	height: 80px;
	margin-right: 10px;
	border : 1px solid gray;
	border-radius: 5px;
	background-color: #FFF092;
}
#upload_file {
  	display: none; 
}
.upload_img{
	width: 80px;
	height: 80px;
	border : 1px solid gray;
	border-radius: 5px;
	cursor: pointer;
}
.img_info {
	display: flex;
}
.img_info > ul {
	float: left;
	padding-left: 0;
}
.img_info > ul > li {
	text-align: left;
	font-size: 10px;
}
.img_span {
	width: 80px;
	height: 80px;
	border : 1px solid gray;
	border-radius: 5px;
	z-index: 999;
}
#star_p {
	position: absolute;
}
.board_end {
	display: left;
	width: 1200px;
	border-top: 1px solid gray;
}
.content {
	width: 100%;
	float: left;
	display: left;
	padding-left: 0;
}
.content > li{
	text-align: left;
}
.content > li > textarea {
	width: 100%;
	text-align: left;
	color: gray;
	resize: none;
}
input::placeholder {
	color : gray;
	opacity: 1;
	text-align: left;
}
</style>
<body>
	<div>
		<div class="top">top영역</div>
		<div class="board_wrapper">
			<p class="board_p">● 일반상품 등록하기</p>
			<form action="./boardView" method="post" id="board_form" enctype="multipart/form-data">
			<!-- ★★★★★★user_id 가져와서 value에 넣어줘야함 !! ★★★★★★★★★-->
			<input type="hidden" name="user_id" value="2" />
			<div class="board_top">
				<div class="board_img">
					<p>기본정보</p>
					<img alt="첨부파일이미지" src="${pageContext.request.contextPath}/resources/images/board/post.png" id="postimg" />
					<input type="file"  id="upload_file" name="upfile" multiple="multiple"  />
					<input type="hidden" name="main_img" id="main_img"/>
				</div>
				<div class="board_tag">
					<ul>
						<li>제목</li>
						<li>가격</li>
						<li>거래지역</li>
					</ul>
				</div>
				<div class="board_input">

						<ul>
							<li>
								<select name="p_category_id" id="p_category_id" class="category">
									<option>카테고리</option>
									<c:forEach items="${categoryList }" var="list">
										<option value="${list.p_category_id}">${list.p_category_name }</option>
									</c:forEach>
								</select>
								<input type="text" name="board_title" class="title"/>
							</li>
							<li>
								<input type="text" name="board_price" class="price" id="price"  pattern="[0-9]+"/>
								<div>
									<input type="checkbox" name="board_trade_type" value="give_away" class="radio" id="give_away"/>
									<label for="board_trade_type" class="label" >무료나눔</label>
								</div>
							</li>
							<li>
								<input type="text" value="${address }" id="address" />
								<input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery"/>
								<label for="board_trade_type" class="label" >택배</label>
								<input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" />
								<label for="board_trade_type" class="label" >직거래</label>
							</li>
						</ul>
				</div>
			</div>
			<div class="board_middle">
				<div class="img_div" id="img_div1"></div>
				<div class="img_div" id="img_div2"></div>
				<div class="img_div" id="img_div3"></div>
				<div class="img_div" id="img_div4"></div>
				<div class="img_div" id="img_div5"></div>
				<div class="img_div" id="img_div6"></div>
			</div>
			<div class="img_info">
				<ul>
					<li>- 이미지는 등록 순서대로 첨부되며, 클릭하여 대표 이미지를 변경할 수 있습니다.</li>
					<li>- 최대 6장까지 등록이 가능합니다.</li>
					<li>- jpg,jpeg,png 확장자만 등록이 가능합니다.</li>
					<li>- 규정에 위배되는 이미지는 등록시 게시글이 제한 될 수 잇으며 추후 발견시 무통보 삭제 및 제재를 받으실 수 있습니다.</li>
				</ul>
			</div>
			<div class="board_end">
				<ul class="content">
					<li>상품 설명</li>
					<li>
						<textarea rows="20"  name="board_content" id="board_content" 
						placeholder="상품 설명을 입력해주세요.&#10;상품에 대한 자세한 설명은 빠른 거래에 도움을 줍니다.&#10;가품 및 온라인 거래 금지 품목 거래시 게시가 제한 될 수 있으며,&#10;현행법에 의거하여 처벌 받으실 수 있습니다.&#10;자세한 사항은 공지사항을 확인해주세요!"></textarea>
					</li>
				</ul>				
			</div>
			<div>
				<input type="button" value="등록" id="submit_btn"/>
						<button>취소</button>
			</div>
					</form>
		</div>
		<div>
			푸터영역
		</div>
	</div>

</body>
<script type="text/javascript">

/*체크박스 설정*/
const give_away = document.getElementById("give_away");
const delivery = document.getElementById("delivery");
const direct = document.getElementById("direct");
var price = document.getElementById("price");
give_away.addEventListener('click', (e)=> {
	
	price.value= 0;
	if(delivery.checked  || direct.checked ){
		delivery.checked = false;
		direct.checked = false;
	}
});

delivery.addEventListener('click', (e)=> {
	if(give_away.checked) {
		give_away.checked = false;
		price.value= "";
	} else if(direct.checked) {
		delivery.vlaue = "both";
		direct.value = "both";
	} else {
		delivery.vlaue = "delivery";
		direct.value = "direct"
	}
});

direct.addEventListener('click', (e)=> {
	if(give_away.checked) {
		price.value= "";
		give_away.checked = false;
	} else if(delivery.checked) {
		delivery.vlaue = "both";
		direct.value = "both";
	} else {
		delivery.vlaue = "delivery";
		direct.value = "direct"
	}
});

/*이미지설정*/
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
				
				
				img.addEventListener("click", (e) => {
					var p = document.getElementById("star_p");
					if(p != null){
						p.remove();
					}
					var main_img = document.getElementById("main_img");
					var file = document.getElementById("upload_file").files[e.target.alt].name;

					main_img.setAttribute("value", file);
					console.log(e.target.alt);
					console.log(file);
					
					const img = e.target;
					img.style.position = "relative";
					const star_p = document.createElement("p");
					star_p.setAttribute("id", "star_p");
					star_p.innerText = "⭐";
					
					star_p.style.top = img.getBoundingClientRect().top + window.pageYOffset +"px";
					
					img.parentNode.appendChild(star_p);
				});
	
				cnt++;
			};
		reader.readAsDataURL(image);
	}


};

upload_file.addEventListener("change", e => {
	const div_img = document.getElementsByClassName("img_div");
	for(var i = 0; i < div_img.length; i++){
		if(div_img.item(i).hasChildNodes()){
			div_img[i].firstChild.remove();
			var p = document.getElementById("star_p");
			if(p != null){
				p.remove();
			}
		}
	};
	if(e.target.files.length > 6){
		upload_file.value = "";
		
		alert("최대 6장까지 등록이 가능합니다.");
	}else {
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

/*전송*/

var submit_btn = document.getElementById('submit_btn');
submit_btn.addEventListener('click', (e) => {
	
	var select = document.getElementById("p_category_id");
	var price = document.getElementById("price");
	var main_img = document.getElementById("main_img");
	var board_content = document.getElementById("board_content");
	const board_trade_type = document.getElementsByName("board_trade_type");
	
	console.log(board_trade_type[0].checked);
	let check =  /^[0-9]+$/;

	
	if(select.value == "카테고리"){
		alert("카테고리를 선택해주세요");
	} else if(!check.test(price.value)) {
		alert("가격에는 숫자만 입력 가능합니다.");
		price.value="";
	} else if(upload_file.value == "") {
		alert("상품 사진을 등록해주세요.");
	} else if(main_img.value == "") {
		alert("메인 이미지를 선택해주세요");
	} else if(board_content.value == ""){
		alert("상품 설명을 입력해주세요");
	} else if(board_trade_type.value == ""){
		alert("거래방식을 선택해주세요");
	} else if(board_trade_type[0].checked == false && board_trade_type[1].checked == false && board_trade_type[2].checked == false){
		alert("거래방식을 선택해주세요");
	}else{
		var board_form = document.getElementById("board_form");
		board_form.submit();
	}
	
});



</script>
</html>