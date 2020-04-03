<?php echo $header; ?>
<div id="bd_expert_page" class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    	<form action="<?=$search_link?>" method="get" class="search search_sub bd_search">
	        <div class="">
		        <div class="header_of_list ">
					<div class="title_search_block">
		            	<div class="header2"><?=$text_heading_title?></div>
		            </div>
		            <div class="search_block">
		            	<button type="button" id="filter_btn" class="bd_filtr"><?=$text_filters?></button>
		            	<input id="search_field_input" type="text" name="search_field" placeholder="<?=$text_search?>" class="input" value="<?=$search_field?>"/>
		            </div>

		        </div>
	    	</div>

	    	<?php
				$isHiddenFilter = (!empty($id_country) || !empty($id_region) || !empty($name_city) || !empty($search_field) || !empty($name_organization) || !empty($name_post) || !empty($name_degree)) ? "" : " hidden ";
	    	?>

    		<div id="filter_param" class="col-md-12 <?=$isHiddenFilter?>">
				<div class="col-sm-3">
					<div class="form-group">
						<label><?=$text_country?></label>
						<select id="country_select" class="form-control" name="id_country">
							<option value=""><?=$text_select?></option>
							<?php foreach ($countries as $id => $c) { ?>
								<?php if ($id_country == $id) { ?>
									<option value="<?=$id?>" selected="selected"><?=$c['name']?></option>
								<?php } else { ?>
									<option value="<?=$id?>"><?=$c['name']?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label><?=$text_region?></label>
						<select id="region_select" class="form-control" name="id_region">
							<option value=""><?=$text_select?></option>
						</select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label><?=$text_city?></label>
						<input class="form-control" type="text" name="name_city" value="<?=$name_city?>">
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group autocompleate_group">
						<label><?=$text_organization?></label>
						<input class="form-control" type="text" name="name_organization" value="<?=$name_organization?>">
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group autocompleate_group">
						<label><?=$text_post?></label>
						<input class="form-control" type="text" name="name_post" value="<?=$name_post?>">
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group autocompleate_group">
						<label><?=$text_degree?></label>
						<input class="form-control" type="text" name="name_degree" value="<?=$name_degree?>">
					</div>
				</div>

				<div class="col-sm-3 pull-right">
					<button type="submit" class=" bd_search_btn pull-right"><?=$text_search?></button>
				</div>

			</div>
		 </form>

        <div class="row">
		<?php if (count($experts)) { ?>
			<?php foreach ($experts as $expert) { ?>
			 	<div class="organization">
			      <div class="org_text">
			        <div class="org_img expert_img">
			        	<?php if (isset($expert['avatar'])) { ?>
			        		<img src="<?=$expert['avatar']?>">
						<?php } else { ?>
							<img src="catalog/view/theme/default/image/user.png">
						<?php } ?>


						<?php if (!empty($expert['country_iso_code_2'])) { ?>
				        	<div class="flag_exp">
				        		<span class="flag-icon-squared  flag-icon-<?=$expert['country_iso_code_2']?>"></span>
				        	</div>
				        <?php } ?>
			        </div>
			        <p class="expert_name"><?=$expert['name']?></p>
			        <div class="expert_position"><?=$expert['post']?>: <?=$expert['org_name']?></div>
			        <div class="org_full exp_full">
			          <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_region?>:</span> <?=$expert['region_name']?></div>
			          <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_phone?></span> <?=$expert['telephone']?></div>
			          <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_email?></span> <?=$expert['email']?></div>
			          <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_post?>:</span> <?=$expert['post']?></div>
					  <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_degree?>:</span> <?=$expert['degree']?></div>
			          <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_organization?>:</span> <a href="<?=$expert['link_to_org']?>"><?=$expert['org_name']?></a></div>
					  <div class="col-md-6 col-sm-12"><span class="label_description"><?=$text_address?></span> <?=$expert['address']?></div>
			          <div class="col-md-6 col-md-12">
			          	<span class="label_description"><?=$text_interests?></span>
			          	<?=$expert['field_of_interest']?>
			          </div>
                      <div class="col-md-6 col-sm-12"><a href="<?=$expert['link']?>"><?=$text_link?></a></div>

			        </div>
			      </div>
			      <div class="col-md-12 less_org"><?=$text_hide?></div>
			      <div class="col-md-12 more_org"><?=$text_open?></div>
			    </div>
	    	<?php } ?>
	    <?php } else { ?>
			<h2><?=$text_sorry_not_found?></h2>
	    <?php } ?>
        </div>


    	<div class="row">
			<div class="col-sm-12 text-center">
				<?php echo $pagination; ?>
			</div>
			<div class="col-sm-12 text-right"><?php echo $results; ?></div>
		</div>


  	</div>
    <?php echo $column_right; ?>
	</div>
</div>

<script>
	$(".more_org").click(function() {
		$(this).parent(".organization").addClass("open");
	});

	$(".less_org").click(function() {
		$(this).parent(".organization").removeClass("open");
	});

	$("#filter_btn").click(function(){
		$("#filter_param").toggleClass('hidden');
	});

	$('#country_select').on('change', function() {
		$.ajax({
			url: 'index.php?route=account/account/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('#country_select').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
			},
			complete: function() {
				$('.fa-spin').remove();
			},
			success: function(json) {
				html = '<option value=""><?php echo $text_select; ?></option>';

				if (json['zone'] && json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
						html += '<option value="' + json['zone'][i]['zone_id'] + '"';

						if (json['zone'][i]['zone_id'] == '<?php echo $id_region; ?>') {
							html += ' selected="selected"';
						}

						html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					//html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}

				$('#region_select').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#country_select').trigger('change');


	// Manufacturer
	$('input[name=\'name_organization\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/manufacturer/autocomplete&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {

					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['manufacturer_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'name_organization\']').val(item['label']);
		}
	});

	// Post
	$('input[name=\'name_post\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=information/bd_expert/autocompletePost&name_post=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {

					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['name']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'name_post\']').val(item['label']);
		}
	});

	// Degree
	$('input[name=\'name_degree\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=information/bd_expert/autocompleteDegree&name_degree=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {

					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['name']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'name_degree\']').val(item['label']);
		}
	});

</script>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
