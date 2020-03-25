<nav id="menu-mobile-ns" class="navmenu navmenu-default navmenu-fixed-left">
	<ul class="nav navbar-nav">
		<li class="btn-close-menu"><?php echo $text_category; ?>
		<span class="toggle-close-mm" data-toggle="close_mob_menu"><i class="fa fa-close"></i></span></li>
		<?php foreach ($items as $item) { ?>
			<li><a href="<?php echo $item['href']; ?>" rel="nofollow">
				<?php if ($item['children']) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
					<?php if($item['thumb']){ ?>
						<img alt="<?php echo $item['name']; ?>" class="mobile-menu-icon <?php if($item['thumb_hover']){ ?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
					<?php } ?>
					<?php if($item['thumb_hover']){ ?>
						<img alt="<?php echo $item['name']; ?>" class="mobile-menu-icon hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
					<?php } ?>
					<?php if(!empty($item['sticker_parent'])){ ?>
						<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
					<?php } ?>
					<?php echo $item['name']; ?>
					</a>
					<?php if($item['type']=="html"){ ?>
						<div class="collapse mob-submenu-list">
							<div class="mob-html-block">
								<?php echo $item['html']; ?>
							</div>
					   </div>
					<?php } ?>
					<?php if(!empty($item['children']) && ($item['type']!='html')) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
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
							<?php if(isset($item['add_html'])){ ?>
								<div class="mob-html-block">
									<?php echo $item['add_html']; ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
				</li>
			<?php } ?>
		  </ul>
</nav>