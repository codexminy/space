/*
function comment_display() {
	if ($('.c_comment').css('display')=='none'){
		$('.c_comment').css('display', 'block');
	} else if($('.c_comment').css('display')=='block') {
		$('.c_comment').css('display', 'none');
	}
}
*/

const view_comment = document.querySelectorAll('.view_comment');
      
for(let i=0; i<view_comment.length; ++i) {
    view_comment[i].addEventListener('click', () =>{
		console.log(1);
        const c_comment = document.querySelectorAll('.c_comment');

        for(let j=0; j<c_comment.length; ++j) {
            if(c_comment[j].classList.contains('active')){
                c_comment[j].classList.remove('active');
            }
            c_comment[i].classList.add('active');
        }
    })
}