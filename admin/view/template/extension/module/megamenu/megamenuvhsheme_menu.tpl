<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<?php if ($results) { ?>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-sheme-menu').submit() : false;"><i class="fa fa-trash-o"></i></button>
        <?php } ?>
		<a class="btn btn-info" onclick="addMenu();"><?php echo $text_add ?></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
    </div>
  </div>
  <div class="container-fluid">
	<?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_list_Item; ?></h3>
		</div>
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-sheme-menu" class="form-horizontal">
		<div class="panel-body">
		<div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
						<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
						<td class="text-left"><?php echo $column_name; ?></td>
						<td class="text-left"><?php echo $ns_text_type; ?></td>
						<td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($results) { ?>
					 <?php foreach ($results as $result) { ?>
					 <tr>
						<td class="text-center"><?php if (in_array($result['mm_sheme_id'], $selected)) { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $result['mm_sheme_id']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $result['mm_sheme_id']; ?>" />
                        <?php } ?></td>
						<td class="text-left"><a onclick="editmenu('<?php echo $result['mm_sheme_id']; ?>');"><?php echo $result['name']; ?></a></td>
						<td class="text-left"><?php echo $result['menu_sheme_type'];?></td>
						<td class="text-right"><a href="<?php echo $result['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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
    </div>
  </div>
</div>
<script>
function addMenu() {	
	html  = '<div class="modal fade" id="name-modal">';
	html += '  <div id="name-content"></div>';
	html += '</div>';

	$('body').append(html);				
							
	$('#name-modal').modal({backdrop:'static',keyboard: false});
	$('#name-content').load('index.php?route=extension/module/megamenuvhsheme/openModal&token=<?php echo $token;?>');
}
function editmenu(mm_sheme_id) {	
	html  = '<div class="modal fade" id="name-modal-'+ mm_sheme_id +'">';
	html += '  <div id="name-content-'+ mm_sheme_id +'"></div>';
	html += '</div>';

	$('body').append(html);				
							
	$('#name-modal-'+ mm_sheme_id).modal({backdrop:'static',keyboard: false});
	$('#name-content-'+ mm_sheme_id).load('index.php?route=extension/module/megamenuvhsheme/openModal&token=<?php echo $token;?>&mm_sheme_id='+mm_sheme_id);
}
</script>
<?php echo $footer; ?>