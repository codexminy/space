<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 상품 등록하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/boardPost.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-wrapper">
	<h2>● 일반 상품 등록하기</h2>
	<form action="./boardView" method="post" id="board_form" enctype="multipart/form-data">
	    <input type="hidden" name="user_id" value="2" />
	    <div class="board-top">
	        <h2>기본 정보</h2>
	        <div class="prouct-info">
	            <div class="board-img"  id="postimg">
	                <img src="${pageContext.request.contextPath}/resources/images/board/camera.png" alt="첨부파일이미지">
	                <p>이미지 등록</p>
	                <input type="file"  id="upload_file" name="upfile" multiple="multiple"  />
		<input type="hidden" name="main_img" id="main_img"/>
	            </div>
	            <div class="board-input">
	                <div class="product-title">
	                    <h3>제목</h3>
	                        <select name="p_category_id" id="p_category_id" class="category">
	                            <option>카테고리</option>
	                            <c:forEach items="${categoryList }" var="list">
	                                <option value="${list.p_category_id}">${list.p_category_name }</option>
	                            </c:forEach>
	                        </select>
	                    <input type="text" name="board_title" class="title"/>
	                </div>
	                <div class="product-price">
	                    <h3>가격</h3>
	                    <input type="text" name="board_price" class="price" id="price"  pattern="[0-9]+" onkeyup="inputNumberFormat(this)"/>
	                    <div class="chkbox">
	                        <input type="checkbox" name="board_trade_type" value="give_away" class="radio" id="give_away"/>
	                        <label for="give_away" class="label" >무료나눔</label>
	                    </div>
	                </div>
	                <div class="product-location">
	                    <h3>거래 지역</h3>
	                    <input type="text" value="${address }" id="address" />
	                        <div class="chkbox">
	                            <input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery"/>
	                            <label for="delivery" class="label" >택배</label>
	                            <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" />
	                            <label for="direct" class="label" >직거래</label>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="board-middle">
	            <div class="img_div" id="img_div1"></div>
	            <div class="img_div" id="img_div2"></div>
	            <div class="img_div" id="img_div3"></div>
	            <div class="img_div" id="img_div4"></div>
	            <div class="img_div" id="img_div5"></div>
	            <div class="img_div" id="img_div6"></div>
	            <div id="star_p"><img src="${pageContext.request.contextPath}/resources/images/board/star_full.png"></div>
	        </div>
	        <div class="img_info">
	            <ul>
	                <li>- 이미지는 등록 순서대로 첨부되며, 클릭하여 대표 이미지를 변경할 수 있습니다.</li>
	                <li>- 최대 6장까지 등록이 가능합니다.</li>
	                <li>- JPG, JPEG, PNG 확장자만 등록이 가능합니다.</li>
	                <li>- 규정에 위배되는 이미지는 등록시 게시글이 제한 될 수 있으며 추후 발견시 무통보 삭제 및 제재를 받으실 수 있습니다.</li>
	            </ul>
	        </div>
	        <div class="board_end">
	            <h2>상품 설명</h2>
	            <div class="content">
	                <textarea rows="20"  name="board_content" id="board_content" 
	                placeholder="상품 설명을 입력해주세요.
	                &#10;상품에 대한 자세한 설명은 빠른 거래에 도움을 줍니다.&#10;가품 및 온라인 거래 금지 품목 거래시 게시가 제한 될 수 있으며,&#10;현행법에 의거하여 처벌 받으실 수 있습니다.
	                &#10;자세한 사항은 공지사항을 확인해주세요!"></textarea>
	            </div>
	            <div class="buttons">
	                <input type="button" value="등록" id="submit_btn"/>
	                <input type="button" value="취소" id="cancle" onclick="location.href='${pageContext.request.contextPath}/board/boardList'"/>
	            </div>
	        </div>
	    </form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
<script type="text/javascript">

/*가격 천 단위 콤마(,) 설정*/
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

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