var toolbar = [
    ['fontname', ['fontname']],
    ['fontsize', ['fontsize']],
    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    ['color', ['forecolor','color']],
    ['table', ['table']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']],
    ['insert',['picture','link','video']],
    ['view', ['codeview','fullscreen', 'help']]
  ];

var setting = {
    height : 500,
    minHeight : 500,
    maxHeight : 500,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar,
    callbacks : {
        onImageUpload : function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            	uploadSummernoteImageFile(files[i], this);
   			}
    	},
    	onInit: function (e) {
            e.editable.html('');
        }
    }
 };

$('.summernote').summernote(setting);

function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : address,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			setTimeout(function() {
				$(el).summernote('editor.insertImage', data.url);
			}, 4000);
		}
	});
}