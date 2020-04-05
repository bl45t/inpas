$(document).ready(function() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		var lang = $(element).data('lang');

		if (typeof(lang) == 'undefined') {
			lang = 'en-US';
		}

		$(element).summernote({
			disableDragAndDrop: true,
			height: 300,
			lang: lang,
			emptyPara: '',
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['height', ['height']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']],
				['undo'],
        		['redo']
			],
			fontNames: ['Helvetica', 'Open Sans', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Times New Roman'],
			fontNamesIgnoreCheck: ['Open Sans'],
			popover: {
				image: [
					['custom', ['imageAttributes']],
					['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
					['float', ['floatLeft', 'floatRight', 'floatNone']],
					['remove', ['removeMedia']]
				],
			},
			imageAttributes:{
				icon:'<i class="note-icon-pencil"/>',
				removeEmpty:false, // true = remove attributes | false = leave empty if present
				disableUpload: false // true = don't display Upload Options | Display Upload Options
			},
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();

							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

									$('#modal-image').modal('show');

									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();

										$(element).summernote('insertImage', $(this).attr('href'));

										$('#modal-image').modal('hide');
									});
								}
							});
						}
					});

					return button.render();
				}
  			}
		});
	});

});
