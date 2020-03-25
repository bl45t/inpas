<div class="modal-dialog modal-lg">
  <div class="modal-content">
	<div class="modal-header">
		<button id="button-close" class="pull-right btn btn-danger btn-sm" type="button">×</button>
		<h4 class="modal-title"><?php echo $entry_name;?></h4>
	</div>
	<div class="modal-body">
	  <form class="form-horizontal" id="form-editmenu" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<label class="col-sm-3 control-label"><?php echo $entry_name;?></label>
			<div class="col-sm-9">
				<input class="form-control" type="text" name="name" value="<?php echo isset($infomenu['name']) ? $infomenu['name'] : ''; ?>" />
				<input class="form-control" type="hidden" name="mm_sheme_id" value="<?php echo $mm_sheme_id;?>" />
			<?php if (isset($error_name)) { ?>
				<div class="text-danger"><?php echo $error_name; ?></div>
			<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><?php echo $ns_text_type;?></label>
			<div class="col-sm-9">
				<select name="menu_sheme_type" class="form-control">	
					<option <?php if(isset($infomenu['menu_sheme_type']) && ($infomenu['menu_sheme_type'] == '1')){?>selected="selected"<?php } ?> value="1"><?php echo $text_menu_sheme_type1; ?></option>
					<option <?php if(isset($infomenu['menu_sheme_type']) && ($infomenu['menu_sheme_type'] == '2')){?>selected="selected"<?php } ?> value="2"><?php echo $text_menu_sheme_type2; ?></option>
				</select>
			</div>
		</div>
	  </form>
	</div>
	<div class="modal-footer">
	  <div class="text-center"><a onclick="saveEditor();" class="button-save btn btn-info btn-lg" data-form="form-editmenu"><i class="fa fa-save fa-fw"></i><?php echo $button_save;?></a></div>
	</div>
  </div>
<script type="text/javascript">


function saveEditor() {	
	$.ajax({
		url: 'index.php?route=extension/module/megamenuvhsheme/editMenuSheme&token=<?php echo $token;?>',
		type: 'post',
		dataType: 'json',
		data: $('#form-editmenu').serialize(),
		success: function(json) {
		$('.alert.alert-danger').remove()
			if (json['warning']) {
				$('#form-editmenu').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
			}
			if (json['success']) {
				$('#form-editmenu').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#name-modal-<?php echo $mm_sheme_id;?>').modal('hide');
					$('#name-content-<?php echo $mm_sheme_id;?>').empty();		
				}, 1000)
				setTimeout(function(){
					location.reload();	
				}, 1500)
			}
		}
	});
}
  
$('#button-close').on('click', function() {
	$('#name-modal-<?php echo $mm_sheme_id;?>').modal('hide');
	$('#name-content-<?php echo $mm_sheme_id;?>').empty();			
});
</script>
	</div>