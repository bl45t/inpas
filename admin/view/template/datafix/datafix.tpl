<?php if (isset($header)) echo $header; ?><?php if (isset($column_left)) echo $column_left; ?>
<div id="content">
   <div class="datafix-top-heading">
      <div style="float:left; margin-top: 10px; width: 24px;">
         <!-- <img src="<?php if (isset($icon)) echo $icon; ?>" style="height: 24px; margin-left: 10px; " > -->
      </div>
      <div style="margin-left: 5px; float:left; margin-top: 12px;">
         <ins style="color: #fff;  font-weight: normal;  text-decoration: none; ">
         <a href="<?php echo $url_datafix; ?>"><?php echo strip_tags($heading_title_datafix); ?>&nbsp;<?php echo $datafix_version; ?></a>
         </ins>
      </div>
      <div class="datafix-top-copyright">
         <div style="color: #fff; font-size: 12px; margin-top: 2px; line-height: 18px; margin-left: 9px; margin-right: 9px; overflow: hidden;"><?php echo $heading_dev; ?></div>
      </div>
   </div>
   <div class="page-header">
      <div class="container-fluid">
         <div id="content1" style="border: none;">
            <div class="clearboth-1"></div>
            <?php if ($success) { ?>
            <div class="alert-success success"><i class="fa fa-check-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button>
            <?php echo $success; ?>
            </div>
            <?php } ?>
            <?php if (isset($error_warning) && $error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button>
            <?php echo $error_warning; ?>
            </div>
            <?php } ?>
            <div id="content" style="border: none;">
               <div class="clearboth-1"></div>
               <?php if (isset($session_success)) {  unset($session_success); ?>
               <div class="success"><?php echo $language_text_datafix_success; ?></div>
               <?php } ?>
               <div class="box1">
                  <div class="content">
                     <div class="clearboth-1"></div>
                     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                        <div style="
                           display: flex;
                           flex-wrap: wrap;
                           align-content: space-between;
                           justify-content: space-between;
                           width: 100%;
                           margin-top: 4px; margin-bottom: 8px;
                           ">
                           <div style="display: flex; align-items: center;">
                              <div>
                                 <i class="fa <?php echo $ico_datafix; ?>" aria-hidden="true"></i> <?php echo strip_tags($heading_title_datafix); ?>&nbsp;<?php echo $datafix_version; ?>&nbsp;&nbsp;<?php if (!isset($datafix_settings['status']) || !$datafix_settings['status']) { ?><span style="color: red;"><?php } else { ?><span style="color: green;"><?php } ?><?php echo $entry_datafix_widget_status; ?><?php if (!isset($datafix_settings['status']) || !$datafix_settings['status']) { ?></span><?php } ?>&nbsp;&nbsp;
                              </div>
                              <div class="input-group">
                                 <select class="form-control" name="datafix_settings[status]">
                                    <?php if (isset($datafix_settings['status']) && $datafix_settings['status']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_datafix_enabled; ?></option>
                                    <option value="0"><?php echo $text_datafix_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_datafix_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_datafix_disabled; ?></option>
                                    <?php } ?>
                                 </select>
                              </div>
                           </div>
                           <div style="text-align: right;">
                              <div id="sticky-anchor"></div>
                              <div id="sticky" style="margin:5px; float:right;">
                                 <a href="#" class="mbutton datafix_save"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $button_save; ?></a>
                              </div>
                           </div>
                        </div>
                        <?php if (isset($stores) && is_array($stores) && !empty($stores)) { ?>
                        <div style="display: flex; align-items: center; margin-bottom: 8px">
                           <div>
                              <?php echo $language->get('entry_datafix_store'); ?>&nbsp;&nbsp;
                           </div>
                           <div class="input-group">
                              <select class="form-control sc_select_other" id="datafix_settings_store_id" name="datafix_settings_<?php echo $store_id ?>[store_id]">
                                 <?php foreach ($stores as $store) { ?>
                                 <option value="<?php echo $store['store_id']; ?>" <?php if (isset($store_id) && $store_id == $store['store_id']) { ?> selected="selected" <?php } ?>><?php echo $store['url']; ?> - <?php echo $store['name']; ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                        </div>
                        <?php } ?>
                        <div id="tabs" class="htabs">
                           <a href="#tab-options" class="lm-tab"><?php echo $tab_text_datafix_options; ?></a>
                           <a href="#tab-install" id="tab-install-header" class="lm-tab"> <?php echo $entry_datafix_install_update; ?></a>
                           <a href="#tab-service" class="lm-tab"><?php echo $tab_text_datafix_service; ?></a>
                           <a href="#tab-doc" class="lm-tab"><?php echo $tab_text_datafix_doc; ?></a>
                        </div>

                        <div id="tab-options">
							<?php echo $html_tab_options ?>
                        </div>

                        <div id="tab-install">
							<?php echo $html_tab_install ?>
                        </div>

						<div id="tab-service">
                        	<?php echo $html_tab_service ?>
						</div>

                        <div id="tab-doc">
                        	<?php echo $html_tab_doc ?>
                        </div>

                     </form>
                  </div>
					<style>
					   .flex-box {
					   	display: flex;
					   	align-items: center;
					  	align-content: stretch;
					   	justify-content: space-between;
					   }
					   .flex-box > div {
					   	width: 33.3%;
					   }
					</style>

                  <script>
                     form_submit = function() {
                     $('#form').submit();
                     	return false;
                     }
                     $('.datafix_save').bind('click', form_submit);
                  </script>
                  <script>
                     $('#tabs a').tabs();

                     $('#tabs-multi > a').tabs();
                  </script>
                  <script>
                     function odd_even() {
                     	var kz = 0;
                     	$('table tr').each(function(i,elem) {
                     	$(this).removeClass('odd');
                     	$(this).removeClass('even');
                     		if ($(this).is(':visible')) {
                     			kz++;
                     			if (kz % 2 == 0) {
                     				$(this).addClass('odd');
                     			}
                     		}
                     	});
                     }

                     $(document).ready(function(){
                     	odd_even();

                     	$('.htabs a').click(function() {
                     		odd_even();
                     	});

                     	$('.vtabs a').click(function() {
                     		odd_even();
                     	});

                     });

                     function input_select_change() {

                     	$('input').each(function(){
                     		if (!$(this).hasClass('no_change')) {
                     	        $(this).removeClass('sc_select_enable');
                     	        $(this).removeClass('sc_select_disable');

                     			if ( $(this).val() != '' ) {
                     				$(this).addClass('sc_select_enable');
                     			} else {
                     				$(this).addClass('sc_select_disable');
                     			}
                     		}
                     	});

                     	$('select').each(function(){
                     		if (!$(this).hasClass('no_change')) {
                     	        $(this).removeClass('sc_select_enable');
                     	        $(this).removeClass('sc_select_disable');

                     			this_val = $(this).find('option:selected').val()

                     			if (this_val == '1' ) {
                     				$(this).addClass('sc_select_enable');
                     			}

                     			if (this_val == '0' || this_val == '') {
                     				$(this).addClass('sc_select_disable');
                     			}

                     			if (this_val != '0' && this_val != '1' && this_val != '') {
                     				$(this).addClass('sc_select_other');
                     			}
                     		}
                     	});
                     }

                     $('.table-help-href').on('click', function() {
                     	$('.help').toggle();
                     });

                     $(document).ready(function(){
                     	$('.help').hide();

                     	input_select_change();

                     	$( "select" )
                     	  .change(function () {
                     		input_select_change();

                     	  });

                     	$( "input" )
                     	  .blur(function () {
                     		input_select_change();
                     	  });

                     });
                  </script>
                  <script>
                     function delayer(){
                         window.location = 'index.php?route=datafix/datafix&<?php echo $token_name; ?>=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&datafix_save=1';
                     }
                  </script>
                  <script>
                     string_sh_tabs_click = localStorage.getItem('sh_tabs_click');

                     if (string_sh_tabs_click == null) {
                     	var array_sh_tabs_click = [];
                     } else {
                     	var array_sh_tabs_click = JSON.parse(string_sh_tabs_click);

                     	array_sh_tabs_click.forEach(function(item, index, array) {
                     		$('a[href="'+ item + '"]').click();
                     		console.log(item);
                     	});
                     }

                     $('.lm-tab').on('click', function() {
                     	sh_tab_datafix_href = $(this).attr('href');
                            array_sh_tabs_click.push(sh_tab_datafix_href);
                            if (array_sh_tabs_click.length > 3) {
                            	array_sh_tabs_click.shift();
                            }
                            localStorage.setItem('sh_tabs_click', JSON.stringify(array_sh_tabs_click));
                     });
                  </script>
                  <style>
                     .sticky-back {
                     	background-color: #E1E1E1;
                     	box-shadow: 0 0 16px rgba(0, 0, 0, 0.3) !important;
                     }
                     #sticky.stick {
                     	position: fixed;
                     	top: 0;
                     	z-index: 10000;
                     }
                  </style>
                  <script>
                     function sticky_relocate() {
                         var window_top = $(window).scrollTop();
                         var div_top = $('#sticky-anchor').offset().top;

                         if (window_top > div_top) {
                             $('#sticky').addClass('stick');
                             $('#sticky').addClass('sticky-back');
                             $('#sticky').css( { "right" : "0px" } );

                         } else {
                             $('#sticky').removeClass('stick');
                             $('#sticky').removeClass('sticky-back');
                             $('#sticky').css( { "margin-left" : "0px" } );
                         }
                     }

                     $(function () {
                         div_left = $('#sticky').offset().left-60;
                         $(window).scroll(sticky_relocate);
                         sticky_relocate();
                     });
                  </script>
                  <script>
                     $('#datafix_settings_store_id').change(function(){
                       var store_id = $(this).val();
                       window.location = 'index.php?route=datafix/datafix&<?php echo $token_name; ?>=<?php echo $token; ?>&store_id=' + store_id;
                     });
                  </script>

                  <?php if (isset($widgets_ocmod_swith) && $widgets_ocmod_swith) { ?>
                  <script>
                     $(document).ready(function(){
                     	$('#datafix_ocmod_refresh').click();
                     });
                  </script>
                  <?php } ?>

                  <?php if (isset($datafix_save) && $datafix_save) { ?>
                  <script>
                     $(document).ready(function(){
                     	$('.datafix_save').click();
                     });
                  </script>
                  <?php } ?>



                  <?php if (isset($text_datafix_update) && $text_datafix_update != '' ) { ?>
                  <script>
                     $(document).ready(function(){
                     	$('#tab-install-header').click();
                     });
                  </script>
                  <?php } ?>
                  <script>
                     $('.close').on('click', function() {
                     	$('.alert, .success').hide();
                     });
                  </script>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<?php if (isset($header)) echo $footer; ?>

