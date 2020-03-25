
                           <div style="
                              display: flex;
                              flex-wrap: wrap;
                              align-content: space-between;
                              justify-content: space-between;
                              width: 100%;
                              margin-top: 4px; margin-bottom: 8px;
                              ">
                              <div>
                                 <a href="#" onclick="
                                    $.ajax({
                                    url: '<?php echo $url_create; ?>',
                                    dataType: 'html',
                                    beforeSend: function()
                                    {
                                    	$('#create_tables').html('<?php echo $language->get('text_datafix_loading_small'); ?>');
                                    },
                                    success: function(json) {
                                    $('#create_tables').html(json);
                                    	//setTimeout('delayer()', 2000);
                                    },
                                    error: function(json) {
                                    	$('#create_tables').html('error');
                                    }
                                    }); return false;" class="markbuttono" style=""><?php echo $url_text_datafix_create_text; ?></a>
                                 <div id="create_tables"></div>
                                 <div id="div_ocmod_refresh_install"></div>

                                 <?php if (isset($text_datafix_update) && $text_datafix_update != '' ) { ?>
                                 <div style="font-size: 16px; color: green;"><?php echo $text_datafix_update; ?></div>
                                 <?php } ?>
                              </div>

                              <div>
								<a href="#" id="sc_check_common" onclick="
										$.ajax({
											url: '<?php echo $url_check_ver; ?>',
											dataType: 'html',
											beforeSend: function()
											{
								               $('#check_ver').html('<?php echo $language->get('text_datafix_loading_main'); ?>');
											},
											success: function(json) {
												$('#check_ver').html(json);
											},
											error: function(json) {
											$('#check_ver').html('error');
											}
										}); return false;" class="markbuttongreen widthbutton sc_button" style=""><?php echo $text_datafix_check_ver; ?></a>
                                       <div id="check_ver"></div>
                              </div>

                              <div>
                                 <a href="#" id="delete-settings" class="mbuttonr" onclick="$('#delete-settings').toggle();$('#delete-settings-sure').toggle(); return false;"><?php echo $url_text_datafix_delete_text; ?></a>
                                 <a href="#" id="delete-settings-sure" onclick="
                                    $.ajax({
                                    url: '<?php echo $url_delete; ?>',
                                    dataType: 'html',
                                    beforeSend: function()
                                    {
                                    	$('#delete_tables').html('<?php echo $language->get('text_datafix_loading_small'); ?>');
                                    },
                                    success: function(json) {
                                    	$('#delete_tables').html(json);
                                    	//setTimeout('delayer()', 2000);
                                    },
                                    error: function(json) {
                                    	$('#delete_tables').html('error');
                                    }
                                    }); return false;" class="mbuttonred mbuttonr" style="display: none;"><?php echo $url_text_datafix_delete_sure_text; ?></a>
                                 <div id="delete_tables"></div>
                              </div>
                           </div>
