const header = '/space';

function getLoad(page) {
	const tableData = $('.list');
	const pagenation = $('.paging');
	const searchArea = $('.search-area');

	$.ajax({
		url : header + url,
		data: {
			pageNum: page,
			type: $('select[name="type"]').val(),
			keyword: $('input[name="keyword"]').val(),
			amount: $('select[name="amount"]').val()
		},
		success : function(result) {
			const list = result['list'];
			const paging = result['paging'];

			let searchData = createSearch(paging);
			let listData = createTable(list);
			let pageData = "";

			if(paging['prev']) {
				pageData += '<li><a href=javascript:getLoad(' + (paging['startPage'] - 1)  + ')><i class="fa-solid fa-angle-left"></i></a></li>';
			}
			
			for(let i=paging['startPage']; i<=paging['endPage']; ++i) {
				if(paging['ps'].pageNum === i) {
					pageData += '<li><a href=javascript:getLoad(' + i + ') class="pageActive">' + i + '</a></li>';
				} else {
					pageData += '<li><a href=javascript:getLoad(' + i + ')>' + i + '</a></li>';
				}
			}
			
			if(paging['next']) {
				pageData += '<li><a href=javascript:getLoad(' + (paging['endPage'] + 1)  + ')><i class="fa-solid fa-angle-right"></i></a></li>';
			}
			
			searchArea.html(searchData);
			tableData.html(listData);
			pagenation.html(pageData);
		}
	});
}

function goDetail(id) {
	const form = $('#form');
	form.find('#detail').val(id);
	form.submit();
}

function formatDate(date) {
    let d = new Date(date);
    let month = '' + (d.getMonth() + 1);
    let day = '' + d.getDate();
    let year = d.getFullYear();
    
    if (month.length < 2) month = '0' + month; 
    if (day.length < 2) day = '0' + day; 
    
    return [year, month, day].join('-');
}

function startSearch() {
	getLoad();
}

function selectAll() {
	if($(".chkAll").is(":checked")) {
		$("input[name=chkBox]").prop("checked", true);
	} else {
		$("input[name=chkBox]").prop("checked", false);
	}
}

function checking() {
	const total = $("input[name=chkBox]").length;
	const checked = $("input[name=chkBox]:checked").length;

	if(total != checked) {
		$(".chkAll").prop("checked", false);
	} else {
		$(".chkAll").prop("checked", true); 
	}
}

function deleteCheck(tableName) {
	const box = document.querySelectorAll('input[name="chkBox"]:checked');
	const arr = [];
	
	if(box.length === 0) {
		alert('선택된 항목이 없습니다.');
		return;
	}
	
	box.forEach(val => {
		arr.push(val.value);
	});
	
	if(confirm('선택된 항목을 삭제하시겠습니까?')) {
		$.ajax({
			url : header + '/admin/delete',
			type: "DELETE",
			contentType: 'application/json',
			data: JSON.stringify({
				table: tableName,
				column: $('#detail').attr('name'),
				idArr: arr
			}),
			success : function(result) {
				getLoad();
				$('.chkAll').prop('checked', false);
				alert('삭제가 완료되었습니다.');
			},
			error : function(result) {
				getLoad();
				$('.chkAll').prop('checked', false);
				alert('error: 삭제 실패');
			}
		});
	}
}




