<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a href="<?php echo $create_menu; ?>" class="btn btn-success"><i class="fa fa-plus"></i> <?php echo $text_create_menu; ?></a>
        <button type="submit" type="submit" form="form-megamenuvh-setting" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_setting; ?></h3>
      </div>
	  <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-megamenuvh-setting" class="form-horizontal">
      <div class="panel-body">
			<div class="form-group ">
				<label class="col-sm-3 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-9">
				  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  <?php if ($error_name) { ?>
				  <div class="text-danger"><?php echo $error_name; ?></div>
				  <?php } ?>
				</div>
			</div> 
			<div class="form-group required">
				<label class="col-sm-3 control-label" for="input-megamenusheme"><?php echo $entry_menu; ?></label>
				<div class="col-sm-9">
					<select name="mm_sheme_id" class="form-control">
						<option value="0"><?php echo $text_select; ?></option>
						<?php foreach ($megamenushems as $result) { ?>
							<?php if($mm_sheme_id == $result['mm_sheme_id']): ?>
								<option selected="selected" value="<?php echo $result['mm_sheme_id']; ?>" >
									<?php echo $result['name']; ?>
								</option>
							<?php else: ?>
								<option value="<?php echo $result['mm_sheme_id']; ?>" >
									<?php echo $result['name']; ?>
								</option>
							<?php endif; ?>
						
						<?php } ?>
				   </select>
				    <?php if ($error_menu) { ?>
					  <div class="text-danger"><?php echo $error_menu; ?></div>
					  <?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-megamenu-status"><?php echo $entry_megamenu_status; ?></label>
				<div class="col-sm-9">
					<select name="status" id="input-megamenu-status" class="form-control">
						<?php if ($status) { ?>
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
				<label class="col-sm-3 control-label" for="input-menu-mask"><?php echo $entry_menu_mask; ?></label>
				<div class="col-sm-9">
					<select name="sheme_menu_mask" id="input-menu-mask" class="form-control">
						<?php if ($sheme_menu_mask) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>					
					</select>
				</div>
			</div>
      </div>
		</form>
    </div>
  </div>
</div>
<?php echo $footer; ?>