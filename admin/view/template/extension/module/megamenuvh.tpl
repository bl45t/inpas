<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<?php if ($list_menu_results) { ?>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-megamenuvh-setting').submit() : false;"><i class="fa fa-trash-o"></i></button>
        <?php } ?>
		<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-success"><i class="fa fa-plus"></i></a>
        <button type="submit" form="form-megamenuvh-setting" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
    </div>
  </div>
  <div class="container-fluid" >
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default" id="list-megamenu">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_setting; ?></h3>
      </div>
	  <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-megamenuvh-setting" class="form-horizontal">
      <div class="panel-body">
        
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-megamenu-status"><?php echo $entry_megamenu_status; ?></label>
				<div class="col-sm-9">
					<select name="megamenu_setting[status]" id="input-megamenu-status" class="form-control">
						<?php if ($megamenu_setting['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>					
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-menu-selection"><?php echo $entry_menu_selection; ?></label>
				<div class="col-sm-9">
					<select onchange="change_menu_theme(this.value);" name="megamenu_setting[main_menu_selection]" id="input-menu-selection" class="form-control">
						<?php if ($megamenu_setting['main_menu_selection'] =='1') { ?>
							<option value="1" selected="selected"><?php echo $text_main_vertical_menu; ?></option>
							<option value="0"><?php echo $text_main_horizontal_menu; ?></option>
						<?php } else{ ?>
							<option value="0" selected="selected"><?php echo $text_main_horizontal_menu; ?></option>
							<option value="1"><?php echo $text_main_vertical_menu; ?></option>                  
						<?php } ?>					
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-type-mobile-menu"><?php echo $entry_type_mobile_menu; ?></label>
				<div class="col-sm-9">
					<select name="megamenu_setting[type_mobile_menu]" id="input-type-mobile-menu" class="form-control">
						<?php if ($megamenu_setting['type_mobile_menu'] =='1') { ?>
							<option value="1" selected="selected">Canvas Menu</option>
							<option value="0">DropDown Menu</option>
						<?php } else{ ?>
							<option value="1">Canvas Menu</option> 
							<option value="0" selected="selected">DropDown Menu</option>
						<?php } ?>					
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-menu-mask"><?php echo $entry_menu_mask; ?></label>
				<div class="col-sm-9">
					<select name="megamenu_setting[main_menu_mask]" id="input-menu-mask" class="form-control">
						<?php if ($megamenu_setting['main_menu_mask']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>					
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-fixed-panel-top"><?php echo $entry_fixed_panel_top; ?></label>
				<div class="col-sm-9">
					<select name="megamenu_setting[fixed_panel_top]" id="input-fixed-panel-top" class="form-control">
						<?php if ($megamenu_setting['fixed_panel_top']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group horizontal_menu">
				<label class="col-sm-3 control-label"><?php echo $text_main_horizontal_menu;?></label>
				<div class="col-sm-9">
					<select name="megamenu_setting[horizontal_menu_width]" id="input-horizontal-menu-width-setting" class="form-control">
						<?php if ($megamenu_setting['horizontal_menu_width']) { ?>
							<option value="1" selected="selected"><?php echo $text_full_screen_menu; ?></option>
							<option value="0"><?php echo $text_full_screen_layout ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_full_screen_menu; ?></option>
							<option value="0" selected="selected"><?php echo $text_full_screen_layout; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group menu_always_open">
				<label class="col-sm-3 control-label"><?php echo $text_home_page;?></label>
					<div class="col-sm-9">
						<div class="checkbox-group-menu">
							<label><input type="checkbox" name="megamenu_setting[menu_open_hpage]" value="1" <?php echo (isset($megamenu_setting['menu_open_hpage']) ? 'checked="checked"' : '') ?> /><span></span></label>						 
						</div>
					</div>
			</div>
        
		<script>
			$(document).ready(function() { 
				var config_main_menu_selection = $('#input-menu-selection option:selected').val();	
				if (config_main_menu_selection =='1') {
					$('.menu_always_open').toggleClass('active');
					$('.horizontal_menu').removeClass('active');
				} else if (config_main_menu_selection =='0') {
					$('.menu_always_open').removeClass('active');
					$('.horizontal_menu').toggleClass('active');
				}
			})
			function change_menu_theme(config_main_menu_selection){						
				if (config_main_menu_selection =='1') {
					$('.menu_always_open').addClass('active');
					$('.horizontal_menu').removeClass('active');
				} else if (config_main_menu_selection =='0') {
					$('.menu_always_open').removeClass('active');
					$('.horizontal_menu').toggleClass('active');
				}
			}
		</script>
		<div class="form-group">
			<label class="col-sm-3 control-label"><i class="fa fa-exclamation-triangle required_cat"></i> <?php echo $text_category_add_auto_description;?></label>
			<div class="col-sm-9 title-setting"><a class="btn btn-save" id="autocategoryadd" data-loading-text='<?php echo $text_creating_categories;?>'><?php echo $text_category_add_auto;?></a></div>
		</div>
		<script>
			$('#autocategoryadd').bind('click',function() { 
				var autocategoryadd = 1;
					$.ajax({
						type:'get',
						dataType:'json',
						data:'autocategoryadd=' + autocategoryadd,
						url:'index.php?route=extension/module/megamenuvh/autocategoryadd&token=<?php echo $token; ?>',
						beforeSend: function() {
							$('#autocategoryadd').button('loading');
						},
						complete: function() {
							$('#autocategoryadd').button('reset');
						},							
						success: function(json){
						$('.alert.alert-danger').remove()
							if (json['warning']) {
								$('#list-megamenu').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['warning'] + '</div>');	
							}
							if (json['success']) {
								location.reload(); 
							}	
						}
					});				
			
			});
		</script>
      </div>
	  
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_list_Item; ?></h3>
		</div>
		<div class="panel-body">
		<div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
						<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
						<td class="text-left"><?php echo $column_title; ?></td>
						<td class="text-left"><?php echo $column_link; ?></td>
						<td class="text-left">
							<?php if ($sort == 'menu_type') { ?>
								<a href="<?php echo $sort_menu_type; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_type; ?></a>
							<?php } else { ?>
								<a href="<?php echo $sort_menu_type; ?>"><?php echo $column_type; ?></a>
							<?php } ?>
						</td>
						<td class="text-left">
							<?php echo $column_sticker; ?>
						</td>
						<td class="text-center">
							<?php if ($sort == 'status') { ?>
								<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
							<?php } else { ?>
								<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
							<?php } ?>
							
						</td>
						<td class="text-right">
							<?php if ($sort == 'sort_menu') { ?>
								<a href="<?php echo $sort_menu; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
							<?php } else { ?>
								<a href="<?php echo $sort_menu; ?>"><?php echo $column_sort_order; ?></a>
							<?php } ?></td>
						<td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($list_menu_results) { ?>
                    <?php foreach ($list_menu_results as $list_menu_result) { ?>
                    <tr>
                      <td class="text-center"><?php if (in_array($list_menu_result['megamenu_id'], $selected)) { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $list_menu_result['megamenu_id']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $list_menu_result['megamenu_id']; ?>" />
                        <?php } ?></td>
                      <td class="text-left">
					  	<a onclick="popupNameItem('<?php echo $list_menu_result['megamenu_id']; ?>')" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></a>
						<?php echo $list_menu_result['namemenu'][$lang_id]; ?></td>
                      <td class="text-left">
					  	<a onclick="popupLink('<?php echo $list_menu_result['megamenu_id']; ?>')" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></a>
					  <?php echo isset($list_menu_result['link'][$lang_id]) ? $list_menu_result['link'][$lang_id] : ''; ?></td>
                      <td class="text-left">
						<a onclick="popupTypeMenu('<?php echo $list_menu_result['megamenu_id']; ?>')" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></a>
						<?php echo $list_menu_result['menu_type']; ?>
					  </td>
                      <td class="text-left">
						<a onclick="popupSticker('<?php echo $list_menu_result['megamenu_id']; ?>')" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></a>
						<?php if(isset($list_menu_result['sticker_parent'][$lang_id]) && ($list_menu_result['sticker_parent'][$lang_id] !='')){?>
							<span class="cat-label cat-label-label" style="background:#<?php echo $list_menu_result['spbg']?>; color:#<?php echo $list_menu_result['spctext'];?>"><?php echo isset($list_menu_result['sticker_parent'][$lang_id]) ? $list_menu_result['sticker_parent'][$lang_id] : ''; ?></span>
						<?php } ?>
					 </td>
                      <td class="text-center"><a class="columnstatus" id="status-<?php echo $list_menu_result['megamenu_id']; ?>"><?php echo $list_menu_result['status']; ?></a></td>
                      <td class="text-right"><?php echo $list_menu_result['sort_menu']; ?></td>
                      <td class="text-right"><a href="<?php echo $list_menu_result['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
		</div>
		</form>
		
    </div>
  </div>
</div>
<style>
#form-megamenuvh-setting .cat-label{font-size:10px; text-shadow:2px 3px 3px rgba(0, 0, 0, 0.25); font-weight:600; border-radius: 2px; line-height: 1; padding:3px; z-index: 1; text-transform: uppercase; }
#form-megamenuvh-setting .cat-label-label{ background: #d9d9d9; color: #333; }
</style>
<script>
function popupTypeMenu(megamenu_id) {	
	html  = '<div class="modal fade" id="typemenu-modal-'+megamenu_id+'">';
	html += '  <div id="typemenu-content-'+megamenu_id+'"></div>';
	html += '</div>';
	$('body').addClass('mopen-menu');	

	$('body').append(html);				
							
	$('#typemenu-modal-'+megamenu_id+'').modal({backdrop:'static',keyboard: false});
	$('#typemenu-content-'+megamenu_id+'').load('index.php?route=extension/module/megamenuvh/popupTypeMenu&token=<?php echo $token;?>&megamenu_id='+megamenu_id);
}
function popupLink(megamenu_id) {	
	html  = '<div class="modal fade" id="link-modal-'+megamenu_id+'">';
	html += '  <div id="link-content-'+megamenu_id+'"></div>';
	html += '</div>';

	$('body').append(html);				
							
	$('#link-modal-'+megamenu_id+'').modal({backdrop:'static',keyboard: false});
	$('#link-content-'+megamenu_id+'').load('index.php?route=extension/module/megamenuvh/popupLink&token=<?php echo $token;?>&megamenu_id='+megamenu_id);
}
function popupSticker(megamenu_id) {	
	html  = '<div class="modal fade" id="sticker-modal-'+megamenu_id+'">';
	html += '  <div id="sticker-content-'+megamenu_id+'"></div>';
	html += '</div>';

	$('body').append(html);				
							
	$('#sticker-modal-'+megamenu_id+'').modal({backdrop:'static',keyboard: false});
	$('#sticker-content-'+megamenu_id+'').load('index.php?route=extension/module/megamenuvh/popupSticker&token=<?php echo $token;?>&megamenu_id='+megamenu_id);
	
}
function popupNameItem(megamenu_id) {	
	html  = '<div class="modal fade" id="nameitem-modal-'+megamenu_id+'">';
	html += '  <div id="nameitem-content-'+megamenu_id+'"></div>';
	html += '</div>';

	$('body').append(html);				
							
	$('#nameitem-modal-'+megamenu_id+'').modal({backdrop:'static',keyboard: false});
	$('#nameitem-content-'+megamenu_id+'').load('index.php?route=extension/module/megamenuvh/popupNameItem&token=<?php echo $token;?>&megamenu_id='+megamenu_id);
}
$('.columnstatus').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=extension/module/megamenuvh/changeStatus&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'json',
		success: function(json) {
			$('.alert.alert-danger').remove()
			if (json['error']) {
				$('#list-megamenu').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');	
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
			
			if (json['success']) {
				if(json['success']!=''){				
					$('#'+object_id).html(json['success']);
				}
			}
		}
	});
});	
</script>
<?php echo $footer; ?>