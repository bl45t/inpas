<div class="modal-dialog modal-lg">
  <div class="modal-content">
	<div class="modal-header">
		<button id="button-close" class="pull-right btn btn-danger btn-sm" type="button">×</button>
		<h4 class="modal-title"><?php echo $ns_setting_sticker;?></h4>
	</div>
	<div id="body-edit-product-name" class="modal-body">
		<form class="form-horizontal" id="form-sticker-menu" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-status"><?php echo $ns_text_sticker_parent; ?></label>
				<div class="col-sm-9">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group pull-left">
							<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<input id="sticker_parent_<?php echo $language['language_id']; ?>" class="form-control" type="text" name="menuvh[sticker_parent][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menuvh['sticker_parent'][$language['language_id']]) ? $menuvh['sticker_parent'][$language['language_id']] : ''; ?>" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $ns_text_sticker_parent_bg;?></label>
				<div class="col-sm-9">
					<input class="form-control color" type="text" name="menuvh[sticker_parent_bg]" value="<?php echo isset($menuvh['sticker_parent_bg']) ? $menuvh['sticker_parent_bg'] : ''; ?>" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $ns_text_sticker_parent_color;?></label>
				<div class="col-sm-9">
					<input class="form-control color" type="text" name="menuvh[spctext]" value="<?php echo isset($menuvh['spctext']) ? $menuvh['spctext'] : ''; ?>" />
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
	  <div class="text-center"><a onclick="saveEditor();" class="button-save btn btn-info btn-lg" data-form="form-sticker-menu"><i class="fa fa-save fa-fw"></i><?php echo $button_save;?></a></div>
	</div>
  </div>
  
<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
<script>
$(document).ready(function() {
  jscolor.installByClassName("color");
});
function saveEditor() {	
	$.ajax({
		url: 'index.php?route=extension/module/megamenuvh<?php echo isset($sheme)?$sheme:''?>/saveStickerMenu&token=<?php echo $token;?>&megamenu_id=<?php echo $megamenu_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('#form-sticker-menu').serialize(),
		success: function(json) {
		$('.alert.alert-danger').remove()
			if (json['warning']) {
				$('#form-sticker-menu').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-sticker-menu').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#sticker-modal-<?php echo $megamenu_id;?>').modal('hide');
					$('#sticker-content-<?php echo $megamenu_id;?>').empty();		
				}, 1000)
				setTimeout(function(){
					location.reload();	
				}, 1500)
			}
		}
	});
}
  
$('#button-close').on('click', function() {
	$('#sticker-modal-<?php echo $megamenu_id;?>').modal('hide');
	$('#sticker-content-<?php echo $megamenu_id;?>').empty();			
});
</script>
</div>
