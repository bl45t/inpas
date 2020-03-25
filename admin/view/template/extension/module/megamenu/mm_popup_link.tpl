<div class="modal-dialog modal-lg">
  <div class="modal-content">
	<div class="modal-header">
		<button id="button-close" class="pull-right btn btn-danger btn-sm" type="button">×</button>
		<h4 class="modal-title"><?php echo $ns_text_menu_link;?></h4>
	</div>
	<div id="body-edit-product-name" class="modal-body">
	  <form class="form-horizontal" id="form-link-menu" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="col-sm-12">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group pull-left">
						<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
						<input id="linkmenu_<?php echo $language['language_id']; ?>" class="form-control" type="text" name="menuvh[link][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menuvh['link'][$language['language_id']]) ? $menuvh['link'][$language['language_id']] : ''; ?>" />
					</div>
					<?php if (isset($error_link[$language['language_id']])) { ?>
						<div class="text-danger"><?php echo $error_link[$language['language_id']]; ?></div>
					<?php } ?>
				<?php } ?>
			</div>
		</div>
	  </form>
	</div>
	<div class="modal-footer">
	  <div class="text-center"><a onclick="saveEditor();" class="button-save btn btn-info btn-lg" data-form="form-link-menu"><i class="fa fa-save fa-fw"></i><?php echo $button_save;?></a></div>
	</div>
  </div>
<script type="text/javascript">
function saveEditor() {	
	$.ajax({
		url: 'index.php?route=extension/module/megamenuvh<?php echo isset($sheme)?$sheme:''?>/saveLinkMenu&token=<?php echo $token;?>&megamenu_id=<?php echo $megamenu_id;?>',
		type: 'post',
		dataType: 'json',
		data: $('#form-link-menu').serialize(),
		success: function(json) {
		$('.alert.alert-danger').remove()
			if (json['warning']) {
				$('#form-link-menu').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-link-menu').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#link-modal-<?php echo $megamenu_id;?>').modal('hide');
					$('#link-content-<?php echo $megamenu_id;?>').empty();		
				}, 1000)
				setTimeout(function(){
					location.reload();	
				}, 1500)
			}
		}
	});
}
  
$('#button-close').on('click', function() {
	$('#link-modal-<?php echo $megamenu_id;?>').modal('hide');
	$('#link-content-<?php echo $megamenu_id;?>').empty();			
});
</script>
</div>