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

								<div style="display: flex; align-items: center; margin-bottom: 10px;">
								   <div style="width: 160px;">
								   	 <?php echo $language->get('entry_datafix_vars'); ?>&nbsp;
								   </div>
								   <div class="input-group">
										<span class="input-group-addon">
											<textarea name="datafix_settings[datafix_vars]" style="width: 100%;  min-height: 260px;"><?php if (isset($datafix_settings['datafix_vars'])) echo $datafix_settings['datafix_vars']; ?></textarea>
										</span>
							 		</div>
								</div>

								<div style="display: flex; align-items: center; margin-bottom: 10px;">
								   <div style="width: 160px;">
								   	 <?php echo $language->get('entry_datafix_two_status'); ?>&nbsp;
								   </div>
								   <div class="input-group">
									 <select class="form-control" name="datafix_settings[datafix_two_status]">
									     <?php if (isset($datafix_settings['datafix_two_status']) && $datafix_settings['datafix_two_status']) { ?>
									     <option value="1" selected="selected"><?php echo $text_datafix_enabled; ?></option>
									     <option value="0"><?php echo $text_datafix_disabled; ?></option>
									     <?php } else { ?>
									     <option value="1"><?php echo $text_datafix_enabled; ?></option>
									     <option value="0" selected="selected"><?php echo $text_datafix_disabled; ?></option>
									     <?php } ?>
									   </select>
								   </div>
                                </div>


								<div style="display: flex; align-items: center; margin-bottom: 10px;">
								   <div style="width: 160px;">
								   	 <?php echo $entry_datafix_menu_status; ?>&nbsp;
								   </div>
								   <div class="input-group">
										<select class="form-control" name="datafix_settings[menu_status]" id="datafix_settings_menu_status">
										   <?php if (isset($datafix_settings['menu_status']) && $datafix_settings['menu_status']) { ?>
										   <option value="1" selected="selected"><?php echo $text_datafix_enabled; ?></option>
										   <option value="0"><?php echo $text_datafix_disabled; ?></option>
										   <?php } else { ?>
										   <option value="1"><?php echo $text_datafix_enabled; ?></option>
										   <option value="0" selected="selected"><?php echo $text_datafix_disabled; ?></option>
										   <?php } ?>
										</select>
								   </div>
								</div>


								<div id="block_datafix_settings_menu_order" style="display: flex; align-items: center; margin-bottom: 10px;">
								   <div style="min-width: 160px;">
								   	 <?php echo $entry_datafix_menu_order; ?>&nbsp;
								   </div>
									<div class="input-group">
										<span class="input-group-addon">#</span>
											<input type="text" style="width: 55px;" class="form-control" name="datafix_settings[menu_order]" id="datafix_settings_menu_order" value="<?php if (isset($datafix_settings['menu_order'])) { echo $datafix_settings['menu_order']; } else { echo ''; } ?>">
									</div>
								</div>

<script>
$('#datafix_settings_menu_status').change(function() {
    $('#block_datafix_settings_menu_order').hide();
    if ($('#datafix_settings_menu_status option:selected').val() == 1) {
    	$('#block_datafix_settings_menu_order').show();
    }
  })
  .trigger('change');
</script>

							</div>



