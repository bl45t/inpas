<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/menuprosheme.css">
<?php if(isset($menu_sheme_type) && ($menu_sheme_type =='1')){?>
<div class="category-sheme">
	<nav id="menuprosheme">
		<div>
		<div class="title-menu-sheme"><i class="fa fa-bars"></i> <?php echo $heading_title;?></div>
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<li><a href="<?php echo $item['href']; ?>" rel="nofollow"><?php echo $item['name']; ?>
					<?php if ($item['children']) { ?><span class="show-sc-sheme" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="sheme-menu-icon <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="sheme-menu-icon hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
					</a>
					
					<?php if(!empty($item['children'])) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-sheme" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
										</a>
										<?php if (!empty($child['children'])) { ?>
											<div class="collapse mob-submenu-list-3lev">
												<ul class="list-unstyled">
													<?php foreach ($child['children'] as $subchild) { ?>
													<?php if($item['type']=="freelink"){ ?>
														<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
													<?php } else { ?>
														<li><a href="<?php echo $subchild['href']; ?>"> - <?php echo $subchild['name']; ?></a></li>
													<?php } ?>
													<?php } ?>
												</ul>
											</div>
										<?php } ?>
									</li>
								<?php } ?>
							</ul>
						</div>
					<?php } ?>
					
				</li>
			<?php } ?>
			
		  </ul>
		</div>
	</nav>
	<?php if(isset($sheme_menu_mask) && ($sheme_menu_mask == 1)) { ?>
	<div id="maskMenuShemeA"></div>
	<?php } ?>
</div>

<script>
$(document).ready(function(){
var url=document.location.href;
$.each($("#menuprosheme a"),function(){
if(url.indexOf(this.href)>=0){
$(this).next().toggleClass("in");
$(this).addClass("active-m");
$(this).children().toggleClass("open-sc-sheme");
};
});
});
$("#menuprosheme .show-sc-sheme").click(function () {
	$(this).toggleClass("open-sc-sheme");
	$(this).parent().next().toggleClass("in");
});
</script>
<?php } ?>
<?php if(isset($menu_sheme_type) && ($menu_sheme_type =='2')){?> 
<script src="catalog/view/javascript/megamenu/megamenusheme.js"></script>
	<div class="menu-box">
		<?php if ($items) { ?>
			<nav id="menu-vsheme" class="btn-group btn-block">
				<div class="title-menu-sheme"><i class="fa fa-bars"></i> <?php echo $heading_title;?></div>
				<ul id="menu-vsheme-list" class="dropdown-menu-sheme nsmenu-block">
					<?php foreach ($items as $item) { ?>
						<?php if ($item['children']) { ?>
							<li class="dropdown">
							<span class="toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
								<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link" class="parent-link"'; } else {echo 'class="parent-link dropdown-img"';} ?>>
									<?php if($item['thumb']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
									<?php } ?>
									<?php if($item['thumb_hover']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
									<?php } ?>
									
									<i class="fa fa-angle-down arrow"></i>
									<?php if(!empty($item['sticker_parent'])){?>
										<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
									<?php } ?>
									<?php echo $item['name']; ?>
								</a>
								
								<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
								<?php if($item['subtype']=="simple"){ ?>
								  <div class="ns-dd dropdown-menu-simple nsmenu-type-category-simple">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">
											<?php foreach ($item['children'] as $child) { ?>
											<li <?php if(!empty($child['children'])){?> class="nsmenu-issubchild"<?php } ?>>
												<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
												<?php echo $child['name']; ?>
												</a>
												<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
													<?php foreach ($child['children'] as $subchild) { ?>
														<?php if($item['type']=="freelink"){ ?>
															<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
														<?php } else { ?>
															<li class="<?php if(count($subchild['child_4level_data'])){?> ischild_4level_simple<?php } ?>">
																<a href="<?php echo $subchild['href']; ?>"><?php if(count($subchild['child_4level_data'])){?><i class="fa fa-angle-down arrow"></i><?php }?>
																<?php echo $subchild['name']; ?>
																</a>
																<?php if(!empty($subchild['child_4level_data'])){ ?>
																<ul class="list-unstyled child_4level_simple">
																	<?php foreach ($subchild['child_4level_data'] as $child_4level_data) { ?>
																		<li><a href="<?php echo $child_4level_data['href']; ?>"><?php echo $child_4level_data['name']; ?></a></li>
																	<?php } ?>
																</ul>
																<?php } ?>
															</li>				
														<?php } ?>
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
									
										<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
										<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
										<div class="ns-dd dropdown-menu-full-image nsmenu-type-category-full-image box-col-3">
											<div class="dropdown-inner">
												<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
													<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
													<div class="row">
														<?php foreach ($children as $child) { ?>
														<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
															<?php if($item['subtype']=="full_image"){?>
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
															<?php } ?>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>">
															<?php echo $child['name']; ?>
															</a>
															
															<?php if(!empty($child['children'])){ ?>
																<ul class="list-unstyled nsmenu-ischild">
																	<?php foreach ($child['children'] as $subchild) { ?>
																		<?php if($item['type']=="freelink"){ ?>
																			<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
																		<?php } else { ?>
																			<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
																		<?php } ?>
																	<?php } ?>
																</ul>
															<?php } ?>	
															
														</div>
														<?php } ?>	
													</div>
													<?php } ?>	
												</div>
												<?php if($item['add_html']){?>
												<div class="col-sm-4 menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
												<?php }?>
											</div>            
										</div>
										<?php }?>
										<?php }?>
										
										<?php if($item['type']=="html"){?>
										  <div class="ns-dd dropdown-menu-html-block nsmenu-type-html box-col-3">
											<div class="dropdown-inner">
												<ul class="list-unstyled nsmenu-haschild">										
													<li class="nsmenu-parent-block">
														<div class="nsmenu-html-block">				
															<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
													</li>
												</ul>									
											</div>            
										   </div>	
										<?php } ?>
										
										<?php if($item['type']=="manufacturer"){ ?>
											<div class="ns-dd dropdown-menu-manufacturer nsmenu-type-manufacturer <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-2 <?php } ?>">
												<?php if($item['type_manuf'] == "type_alphabet"){ ?>
													<div class="dropdown-inner">
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
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
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
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
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													</div> 
													<?php } ?>	           
											</div>
									
										<?php }?>
										
										<?php if($item['type']=="information"){?>
											<div class="ns-dd dropdown-menu-information nsmenu-type-information <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-1 <?php } ?>">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 2 : 1; ?>
														<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / $num_columns)) as $children) { ?>
															<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){ ?>col-xs-12 col-sm-6<?php } ?>">
																<?php foreach ($children as $child) { ?>
																	<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
																<?php } ?>
															</ul>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){ ?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php } ?>
												</div>
											</div>
										<?php } ?>
										
										<?php if($item['type']=="product"){ ?>
											<div class="ns-dd dropdown-menu-product nsmenu-type-product box-col-3">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
														<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
														<div class="row">
															<?php foreach ($children as $child) { ?>
															<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
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
													<?php if($item['add_html']){?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php }?>
												</div>          
											</div>
										<?php } ?>
							</li>
						<?php } else {  ?>
								<li>						
									<a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
										<?php if($item['thumb']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
										<?php } ?>
										<?php if($item['thumb_hover']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
										<?php } ?>
										<?php if(!empty($item['sticker_parent'])){?>
											<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
										<?php } ?>
										<?php echo $item['name']; ?>
									</a>
								</li>							
						<?php } ?>
					<?php } ?>
				</ul>
			</nav>
			<?php if(isset($sheme_menu_mask) && ($sheme_menu_mask == 1)) { ?>
				<div id="maskMenuSheme"></div>	
			<?php } ?>
			<?php } ?>
	</div>	
<?php } ?>

