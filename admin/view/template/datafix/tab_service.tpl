<div style="
			display: flex;
			flex-direction: column;
  			align-items: flex-start;
			flex-wrap: wrap;
			align-content: space-between;
			justify-content: space-between;
			width: 100%;
			margin-top: 4px;
			margin-bottom: 11px;
			">
								<div style="display: flex; align-items: center; margin-bottom: 11px;">
								   <div style="width: 160px;">
								   	 <?php echo $language->get('entry_datafix_datafix_ocmodrefresh'); ?>&nbsp;
								   </div>
								   <div class="input-group">
										<a href="#" id="datafix_ocmod_refresh" onclick="
										$.ajax({
										url: '<?php echo $url_ocmodrefresh; ?>',
										dataType: 'html',
										beforeSend: function()
										{
											$('#div_ocmod_refresh').html('<?php echo $language->get('text_datafix_loading_main'); ?>').show();
										},
										success: function(content) {
											if (content) {
												$('#div_ocmod_refresh').html('<span style=\'color:green\'><?php echo $language->get('text_datafix_ocmodrefresh_success'); ?><\/span>');
												setTimeout(hide_messages, 3000, '#div_ocmod_refresh');
											}
										},
										error: function(content) {
											$('#div_ocmod_refresh').html('<span style=\'color:red\'><?php echo $language->get('text_datafix_ocmodrefresh_fail'); ?><\/span>');
										}
										}); return false;" class="markbuttono sc_button" style=""><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $language->get('url_text_datafix_ocmodrefresh'); ?></a>
										<div id="div_ocmod_refresh">&nbsp;</div>
								   </div>
								</div>

								<div style="display: flex; align-items: center; margin-bottom: 11px;">
								   <div style="width: 160px;">
								   	 <?php echo $language->get('entry_datafix_datafix_cacheremove'); ?>&nbsp;
								   </div>
								   <div class="input-group">
										<a id="datafix_cache_remove" class="markbuttono sc_button"><i class="fa fa-recycle" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $language->get('url_text_datafix_cacheremove'); ?></a>
										<div id="div_cache_remove">&nbsp;</div>
								   </div>
								</div>
</div>

<script>
if ($.isFunction($.fn.on)) {
	$(document).on('click', '#datafix_cache_remove', js_cache_remove);
} else {
	$('#datafix_cache_remove').live('click', js_cache_remove);
}

function js_cache_remove() {
	$.ajax({
		url: '<?php echo $url_cacheremove; ?>',
		dataType: 'html',
		beforeSend: function() {
			$('#div_cache_remove').html('<?php echo $language->get('text_datafix_loading_main_without'); ?>').show();
		},
		success: function(content) {
			if (content) {
				$('#div_cache_remove').html('<span style=\'color:green\'>'+content+'<\/span>');
				setTimeout(hide_messages, 3000, '#div_cache_remove');
			}
		},
		error: function(content) {
			$('#div_cache_remove').html('<span style=\'color:red\'><?php echo $language->get('text_datafix_cacheremove_fail'); ?><\/span>');
		}
	});
	return false;
}

function hide_messages(sel) {	$(sel).html('&nbsp;');
}

</script>
