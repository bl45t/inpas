<?php echo $header; ?>
<div id="bd_organizations_page" class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	        <div class="col-md-12">
		        <div class="header_of_list ">
		            <div class="header2"><?=$text_heading_title?></div>
		            <form action="<?=$search_link?>" method="post" class="search search_sub bd_search">
		            	<button type="button" id="filter_btn" class="bd_filtr"><?=$text_filters?></button>
		            	<input id="search_field_input" type="text" name="search_field" placeholder="<?=$text_search?>" class="input" value="<?=$search_field?>"/>
		        </div>
	    	</div>

	    	<?php 
				$isHiddenFilter = (!empty($id_country) || !empty($id_region) || !empty($name_city) || !empty($search_field)) ? "" : " hidden ";
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
					<button type="submit" class=" bd_search_btn"><?=$text_search?></button>
				</div>

			</div>
							</form>
		<?php if (count($organizations)) { ?>
			<?php foreach ($organizations as $organization) { ?>
		    	<div class="organization">
			      <div class="org_text">
			        <div class="org_img hidden"><img src="img/logo1.png"></div>
			        <p class="org_name"><?=$organization['name']?></p>
			        <span class="org_adress"><?=$organization['country_name']?>, <?=$organization['city']?></span><span class="org_phone"><?=$organization['phone']?></span>
			        <p class="org_desc"><?=$organization['description']?></p>
			        <div class="org_full">
			          <div class="col-md-6 col-sm-12"><span><?=$text_address?></span> <?=$organization['country_name']?>, <?=$organization['region_name']?>, <?=$organization['address']?></div>
			          <div class="col-md-6 col-sm-12"><span><?=$text_region?>:</span> <?=$organization['region_name']?></div>
			          <div class="col-md-6 col-sm-12"><span><?=$text_phone?></span> <?=$organization['phone']?></div>          
			          <div class="col-md-6 col-sm-12"><span><?=$text_post_code?></span> <?=$organization['post_code']?></div>        
			          <div class="col-md-6 col-sm-12"><span><?=$text_fax?></span> <?=$organization['fax']?></div>    
			          <div class="col-md-6 col-sm-12"><span><?=$text_email?></span> <?=$organization['email']?></div>
			          <div class="col-md-6 col-sm-12"><span><?=$text_site?></span> <a href=""><?=$organization['site_address']?></a></div>
			          <div class="col-md-6 col-sm-12"><span><?=$text_educational_program?></span><?=$organization['educational_program']?></div>     
			        </div>                
			      </div>
			      <div class="col-md-12 less_org"><?=$text_hide?></div>
			      <div class="col-md-12 more_org"><?=$text_open?></div>
		    	</div>
	    	<?php } ?>
	    <?php } else { ?>
			<h2><?=$text_sorry_not_found?></h2>
	    <?php } ?>


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
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}

				$('#region_select').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#country_select').trigger('change');

</script>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>