<?php if($config_main_menu_selection =='0') { ?>
<?php if ($items) { ?>
<div class="menu-header-box">
	<?php if($hmenu_type =='1') { ?>
		<nav id="horizontal-menu" class="navbar">
	<?php } ?>
  <div class="container">
  	<?php if($hmenu_type =='0') { ?>
		<nav id="horizontal-menu" class="navbar hmenu_type">
	<?php } ?>
		<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
		  <button type="button" class="btn btn-navbar navbar-toggle" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>data-toggle="open_mob_menu_left"<?php } else { ?>data-toggle="collapse" data-target=".navbar-ex1-collapse"<?php } ?>><i class="fa fa-bars"></i></button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse <?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<?php if ($item['children']) { ?>
				<li class="dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) { ?> target="_blank" data-target="link" <?php } else { ?> class="dropdown-toggle dropdown-img" data-toggle="dropdown" <?php } ?>>
						<?php if($item['thumb']){ ?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){ ?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){ ?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){ ?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<span class="toggle-child" data-toggle="collapse"><i class="fa fa-plus plus"></i></span>
						<?php echo $item['name']; ?>
						<i class="fa fa-angle-down arrow"></i>
					</a>
					<?php if($item['type']=="freelink"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
						<div class="dropdown-inner">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(count($child['children'])){ ?> nsmenu-issubchild<?php } ?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?><?php echo $child['name']; ?></a>
									<?php if(count($child['children'])){ ?>
										<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											<?php foreach ($child['children'] as $subchild) { ?>
												<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
											<?php } ?>
										</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>            
					   </div>
					<?php } ?>
					<?php } ?>
					<?php if($item['type']=="freelink"){ ?>
					<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){ ?>
						 <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
							<div class="dropdown-inner">
								<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
								 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
									<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
									<div class="row">
										<?php foreach ($children as $child) { ?>
										<div class="nsmenu-parent-block<?php if(!empty($child['children'])){ ?> nsmenu-issubchild<?php } ?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
											<?php if($item['subtype']=="full_image"){ ?>
											<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
											<?php } ?>
											<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild">
													<?php foreach ($child['children'] as $subchild) { ?>
													<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
													<?php } ?>
												</ul>
											<?php } ?>	
										</div>
										<?php } ?>	
									</div>
									<?php } ?>	
								</div>
								<?php if($item['add_html']){ ?>
								<div class="col-sm-4 menu-add-html">
									<?php echo $item['add_html']; ?>
								</div>
								<?php } ?>
							</div>             
						</div>
					<?php } ?>
					<?php } ?>	
					<?php if($item['type']=="category"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(!empty($child['children'])){ ?> nsmenu-issubchild<?php } ?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
									<?php echo $child['name']; ?>
									</a>
									<?php if(!empty($child['children'])){ ?>
									<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
									 <?php foreach ($child['children'] as $subchild) { ?>
									<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
									<?php } ?>
									</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>	
						<?php } ?>
						<?php if($item['type']=="category"){ ?>
						<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){ ?>
						  <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
									<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
									 <?php foreach (array_chunk($item['children'], $item['ac_number']) as $children) { ?>
										<div class="row">
											<?php foreach ($children as $child) { ?>
											<div class="nsmenu-parent-block<?php if(!empty($child['children'])){ ?> nsmenu-issubchild<?php } ?> col-md-<?php echo $item['number_column_sc'];?> col-sm-12">
												<?php if($item['subtype']=="full_image" && ($child['thumb'] !='')) { ?>
												<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
												<?php } ?>
												<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
												
												<?php if(!empty($child['children'])){ ?>
													<ul class="list-unstyled nsmenu-ischild">
														<?php foreach ($child['children'] as $subchild) { ?>
														<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
														<?php } ?>
													</ul>
												<?php } ?>	
												
											</div>
											<?php } ?>	
										</div>
										<?php } ?>	
									</div>
									<?php if($item['add_html']){ ?>
									<div class="col-sm-4 menu-add-html">
										<?php echo $item['add_html']; ?>
									</div>
									<?php } ?>
							</div>
							<?php } ?>	
							<?php } ?>
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){ ?>
								<?php if(($item['subtype']=="full_masonry") || ($item['subtype']=="full_image_masonry") || ($item['subtype']=="full_3_level") || ($item['subtype']=="full_3_level_image")){ ?>
								<div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											<div class="row-flex-masonry">
												<?php foreach ($item['children'] as $child) { ?>
												<div class="nsmenu-parent-block<?php if(count($child['children'])){ ?> nsmenu-issubchild<?php } ?> col-sm-12 col-md-<?php echo $item['number_column_sc'] ?>">
													<?php if($item['subtype']=="full_image_masonry" && ($child['thumb'] !='')){ ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>">
													<?php echo $child['name']; ?>
													</a>
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
																<?php if($item['type']=="freelink"){ ?>
																	<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>
																<?php } else { ?>
																	<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
																<?php } ?>
															<?php } ?>
														</ul>
													<?php } ?>

												</div>
												<?php } ?>
											</div>
										</div>
										<?php if($item['add_html']){ ?>
										<div class="col-sm-4 menu-add-html">
											<?php echo $item['add_html']; ?>
										</div>
										<?php } ?>
								</div>
								<?php } ?>
								<?php } ?>
							<?php if($item['type']=="html"){ ?>
							  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock">
									<div class="nsmenu-html-block">				
										<?php echo $item['html']; ?>
									</div>
							   </div>	
							<?php } ?>
							<?php if($item['type']=="manufacturer"){ ?>
								<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock">
									<?php if($item['type_manuf'] == "type_alphabet"){ ?>
									<div class="dropdown-inner">
										<div class="col-sm-<?php if($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php if ($item['result_manufacturer_a']) { ?>
												<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
												<div class="row">
												<?php foreach ($manufacturer_a as $man_alphabet) { ?>
													<?php if ($man_alphabet['manufacturer']) { ?>
														<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
															<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
															<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																<?php foreach ($manufacturers as $manufacturer) { ?>
																	<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																<?php } ?>
															</div>
														<?php } ?>
													
													<?php } ?>
												<?php } ?>
												</div>
												<?php } ?>
											<?php } ?>
										</div>
										<?php if($item['add_html']){ ?>
										<div class="col-sm-4 menu-add-html">
											<?php echo $item['add_html']; ?>
										</div>
										<?php } ?>
									</div>
									<?php } ?>
									<?php if($item['type_manuf'] == "type_image"){ ?>
									<div class="dropdown-inner">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){ ?>
										<div class="col-sm-4 menu-add-html">
											<?php echo $item['add_html']; ?>
										</div>
										<?php } ?>
									</div> 
									<?php } ?>	            
								</div>
							<?php } ?>
							<?php if($item['type']=="information"){ ?>	
								<div class="dropdown-menu nsmenu-type-information">
									<ul class="list-unstyled nsmenu-haschild">
										<?php foreach ($item['children'] as $child) { ?>
											<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
										<?php } ?>
									</ul>
								</div>
							<?php } ?>
							<?php if($item['type']=="product"){ ?>
								<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock">
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
														<div class="price">
															<?php if (!$child['special']) { ?>
																<?php echo $child['price']; ?>
															<?php } else { ?>
																<span class="price-old"><?php echo $child['price']; ?></span>
																<span class="price-new"><?php echo $child['special']; ?></span>
															<?php } ?>
														</div>
													</div>
													<?php } ?>
												</div>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo $item['add_html']; ?>
											</div>
											<?php } ?>
										</div>
									</div>
							<?php } ?>
					</li>
				<?php } else {  ?>
					<li><a <?php if($item['new_blank'] == 1) { ?> target="_blank" data-target="link" <?php } else {  ?> class="dropdown-img" <?php } ?> href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){ ?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){ ?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){ ?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){ ?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>
		<?php if($hmenu_type =='0') { ?>
			</nav>
			 <?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
			  <div id="maskMenuHor"></div>	
			<?php } ?>
		<?php } ?>
	</div>
	<?php if($hmenu_type =='1') { ?>
		</nav>
		 <?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
		  <div id="maskMenuHor"></div>	
		<?php } ?>
	<?php } ?>
 </div>
<?php } ?>
<?php } ?>
<script>
$('.nsmenu-type-manufacturer a[data-toggle="tooltip"]').tooltip({
	animated: 'fade',
	placement: 'top',
	template: '<div class="tooltip tooltip-manufacturer" role="tooltip"><div class="arrow"></div><div class="tooltip-inner tooltip-manufacturer-inner"></div></div>',
	html: true
});
</script>
<?php if($config_fixed_panel_top) { ?>
<script>
$(document).ready(function() {
	var header_h = $('header').outerHeight();
	if (viewhw().width >= 992) {	
	$(window).scroll(function(){
		if($(this).scrollTop() > header_h + 120) {
			if($("#top-fixed").length==0) {
				$('#maskMenuHor').removeClass('open');
				$('#horizontal-menu').removeClass('active-mask');
				<?php if($hmenu_type =='1') { ?>
				$('header').before('<div id="top-fixed" class="hidden-xs hidden-sm"></div>');	
				$('.menu-header-box #horizontal-menu').clone().appendTo('#top-fixed');
				<?php } else { ?>
				$('header').before('<div id="top-fixed" class="hidden-xs hidden-sm"><div class="container"></div></div>');	
				$('.menu-header-box #horizontal-menu').clone().appendTo('#top-fixed .container');
				<?php } ?>
				$('#top-fixed').addClass('fixed-top-header');
				mmpro_aim_h();
			}
		}else{
			$('#top-fixed').remove();
			$('#maskMenuHor').removeClass('open');
			$('#horizontal-menu').removeClass('active-mask');
		}		
	});
	}
});
</script>
<?php } ?>
<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>
<?php if($deviceType !='computer'){ ?>
<div class="mob-menu hidden-md hidden-lg"></div>
<script>
$(document).on('click', '#menu-mobile-ns .show-sc-mobile', function () {
	$(this).siblings(".collapsible").toggle();
	$(this).toggleClass("open-sc-mobile");
	$(this).parent().next().toggleClass("in");
});
function close_mob_menu(){
	$('#menu-mobile-ns.navmenu-fixed-left').removeClass('active');
	$('body').removeClass('modal-open');
}
$(document).on('click', '[data-toggle="close_mob_menu"]', function () {
	close_mob_menu();
});
$(document).mouseup(function (e){ 
	var div = $("#menu-mobile-ns.active"); 
	if (!div.is(e.target) 
		&& div.has(e.target).length === 0) { 
		close_mob_menu();
	}
});
$(document).on('click', '[data-toggle="open_mob_menu_left"]', function (e) {
	if ($(".mob-menu").find('#menu-mobile-ns').length == 0) {
		$('.mob-menu').load('index.php?route=common/menuvh/load_mob_menu', function() {
			setTimeout(function () {
				$('#menu-mobile-ns.navmenu-fixed-left').toggleClass('active');
				$('body').toggleClass('modal-open');
			}, 50);
		});
	} else {
		$('#menu-mobile-ns.navmenu-fixed-left').toggleClass('active');
		$('body').toggleClass('modal-open');
	}
});
</script>
<?php } ?>
<?php } ?>