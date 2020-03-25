<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
 <div class="page-header">
    <div class="container-fluid">
		<div class="pull-right">
			<div class="buttons">
				<a class="btn btn-primary" onclick="$('#form-megamenuvh-item').submit();" class="button"><span  data-toggle="tooltip" title="<?php echo $button_save; ?>" ><i class="fa fa-save"></i></span></a>
				<a class="btn btn-default" onclick="location = '<?php echo $cancel; ?>';" class="button"><span  data-toggle="tooltip" title="<?php echo $button_cancel; ?>" ><i class="fa fa-reply"></i></span></a>
			</div>
		</div>
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
			<div class="alert alert-danger"><?php echo $error_warning; ?></div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_form; ?></h3>
			</div>
		</div>
		<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-megamenuvh-item" class="form-horizontal">
				<div class="form-group required">
					<label class="col-sm-3 control-label"><?php echo $ns_text_menu_name;?></label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
								<input id="namemenu_<?php echo $language['language_id']; ?>" class="form-control" type="text" name="menuvh[namemenu][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menuvh['namemenu'][$language['language_id']]) ? $menuvh['namemenu'][$language['language_id']] : ''; ?>" />
							</div>
							<?php if (isset($error_namemenu[$language['language_id']])) { ?>
								<div class="text-danger"><?php echo $error_namemenu[$language['language_id']]; ?></div>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $ns_text_menu_link;?></label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
								<input id="linkmenu_<?php echo $language['language_id']; ?>" class="form-control" type="text" name="menuvh[link][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menuvh['link'][$language['language_id']]) ? $menuvh['link'][$language['language_id']] : ''; ?>" />
							</div>
							<?php if (isset($error_link[$language['language_id']])) { ?>
								<div class="text-danger"><?php echo $error_link[$language['language_id']]; ?></div>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="form-group required">
					<label class="col-sm-3 control-label"><?php echo $ns_text_type;?></label>
					<div class="col-sm-9">
						<select onChange="sel_type_category()"  name="menuvh[menu_type]" id="input-menu-type" class="form-control">											
							<option value="0"><?php echo $text_select; ?></option>
							<option value="category" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'category')) { ?> selected="selected" <?php } ?>><?php echo $ns_text_type_category; ?></option>
							<?php if(isset($menu_sheme_type) && ($menu_sheme_type == '2')){?>
							<option value="html" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'html')) { ?> selected="selected" <?php } ?>><?php echo $ns_text_type_html; ?></option>
							<?php } ?>
							<option value="manufacturer" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'manufacturer')) {?> selected="selected" <?php } ?>><?php echo $ns_text_type_manufacturer; ?></option>
							<option value="information" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'information')) {?> selected="selected" <?php } ?>><?php echo $ns_text_type_information; ?></option>
							<option value="product" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'product')) { ?> selected="selected" <?php } ?>><?php echo $ns_text_type_product; ?></option>											
							<option value="freelink" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'freelink')) { ?> selected="selected" <?php } ?>><?php echo $ns_text_type_freelink; ?></option>											
							<option value="link" <?php if(isset($menuvh['menu_type']) && ($menuvh['menu_type'] == 'link')) { ?> selected="selected" <?php } ?>><?php echo $ns_text_type_link; ?></option>
						</select>
						<?php if (!empty($error_menu_type)) { ?>
							<div class="text-danger"><?php echo $error_menu_type; ?></div>
						<?php } ?>
					</div>
				</div>
				
				<div class="show_elements show_elements_html">
					<label class="col-sm-3 control-label"><?php echo $ns_text_html_description; ?></label>
					<div class="col-sm-9">
						<ul class="nav nav-tabs" id="language_html">
							<?php foreach ($languages as $language) { ?>
								<li><a href="#language_html_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
						<div class="tab-content">
							<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language_html_<?php echo $language['language_id']; ?>">
									<div class="form-group">
										<textarea class="form-control summernote" name="menuvh[html_block][<?php echo $language['language_id']; ?>]" id="html_description_<?php echo $language['language_id']; ?>"><?php echo isset($html_block[$language['language_id']]) ? $html_block[$language['language_id']] : ''; ?></textarea>
									</div>
								</div>
							<?php } ?>
						</div>	
					</div>	
				</div>
				
				<div class="show_elements show_elements_category">			
					<div class="form-group required">
						<label class="col-sm-3 control-label" for="input_variant_category"><?php echo $ns_type_dropdown_list; ?></label>
						<div class="col-sm-9">
							<select onChange="sel_type_category()" name="menuvh[category_setting][variant_category]" id="input_variant_category" class="form-control">
								<option value="simple" <?php if(isset($variant_category) && ($variant_category == 'simple')) { ?> selected="selected" <?php } ?>><?php echo $ns_type_dropdown_simple; ?></option>
								<?php if(isset($menu_sheme_type) && ($menu_sheme_type == '2')){?>
								<option value="full" <?php if(isset($variant_category) && ($variant_category == 'full')) { ?> selected="selected" <?php } ?>><?php echo $ns_type_dropdown_full; ?></option>
								<option value="full_image" <?php if(isset($variant_category) && ($variant_category == 'full_image')) { ?> selected="selected" <?php } ?>><?php echo $ns_type_dropdown_full_image; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-category_show_subcategory"><?php echo $ns_show_sub_categories; ?></label>
						<div class="col-sm-9">
							<select id="input-category_show_subcategory" name="menuvh[category_setting][show_sub_category]" class="form-control">
								<?php if ($show_sub_category) { ?>
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
						<label class="col-sm-3 control-label"><?php echo $ns_text_product_width; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[category_setting][category_img_width]" value="<?php echo isset($category_img_width) ? $category_img_width : 50;?>" placeholder="<?php echo $ns_text_product_width; ?>" class="form-control" />									 
						</div>
					</div>		
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $ns_text_product_height; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[category_setting][category_img_height]" value="<?php echo isset($category_img_height) ? $category_img_height : 50;?>" placeholder="<?php echo $ns_text_product_height; ?>" class="form-control" />									 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-category"><?php echo $ns_text_category; ?></label>
						<div class="col-sm-9">
							<input type="text" name="category" value="" placeholder="<?php echo $ns_text_category; ?>" id="input-category" class="form-control" />
							<div id="category-category" class="well well-sm" style="height: 450px; overflow: auto;">
								<?php if(!empty($category_list_sel)) { ?>
									<?php foreach ($category_list_sel as $category_list) { ?>
										<div class="row-category-menu" id="category-item-<?php echo $category_list['category_id']; ?>">
											<i class="del-cat fa fa-minus-circle"></i>
											<?php echo $category_list['name']; ?>
											<input type="hidden" name="menuvh[category_setting][category_list][]" value="<?php echo $category_list['category_id']; ?>" />
										</div>
									<?php } ?>	
								<?php } ?>	
							</div>
						</div>
					</div>							
				</div>
				
				<div class="show_elements show_elements_manufacturer">
					<div class="form-group" <?php if(isset($menu_sheme_type) && ($menu_sheme_type == '1')){?>style="display:none;<?php } ?>>
						<label class="col-sm-3 control-label"><?php echo $ns_type_dropdown_list; ?></label>
						<div class="col-sm-9">
							<select name="menuvh[manufacturers_setting][type_manuf]" class="form-control">
								<option <?php if(isset($type_manuf) && ($type_manuf == 'type_image')) { ?> selected="selected" <?php } ?> value="type_image"><?php echo $ns_type_manuf_image; ?></option>
								<option <?php if(isset($type_manuf) && ($type_manuf == 'type_alphabet')) { ?> selected="selected" <?php } ?> value="type_alphabet"><?php echo $ns_type_manuf_alphabet_image; ?></option>
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $ns_text_manufacturer; ?></label>
						<div class="col-sm-9">
							<div class="well well-sm">
								<?php foreach($manufacturers_list as $manufacturer){?>
									<div class="checkbox">
										<label>
											<?php if (in_array($manufacturer['manufacturer_id'], $manufacturers_sel_id)) { ?>
												<input checked="checked" type="checkbox" name="menuvh[manufacturers_setting][manufacturers_list][]" value="<?php echo $manufacturer['manufacturer_id']?>"/> <?php echo $manufacturer['name']?> 
											<?php } else { ?>
												<input type="checkbox" name="menuvh[manufacturers_setting][manufacturers_list][]" value="<?php echo $manufacturer['manufacturer_id']?>"/> <?php echo $manufacturer['name']?> 
											<?php } ?>
										</label>
									</div>
								<?php } ?>
							</div>
						</div>
					</div>	
				</div>
				
				<div class="show_elements show_elements_information">
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $ns_text_information; ?></label>
						<div class="col-sm-9">
							<div class="well well-sm">
								<?php foreach($informations_list as $information){ ?>
									<div class="checkbox">
										<label>
											<?php if (in_array($information['information_id'], $menuvh['informations_sel_id'])) { ?>
												<input checked="checked" type="checkbox" name="menuvh[informations_list][]" value="<?php echo $information['information_id'];?>"/> <?php echo $information['title'];?> 
											<?php } else { ?>
												<input type="checkbox" name="menuvh[informations_list][]" value="<?php echo $information['information_id'];?>"/> <?php echo $information['title'];?> 
											<?php } ?>
										</label>
									</div>
								<?php } ?>                
							</div>
						</div>
					</div>
				</div>
				<div class="show_elements show_elements_product">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-product_width"><?php echo $ns_text_product_width; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[product][product_width]" value="<?php echo isset($product_width) ? $product_width : 50;?>" placeholder="<?php echo $ns_text_product_width; ?>" id="input-product_width" class="form-control" />									 
						</div>
					</div>		
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-product_height"><?php echo $ns_text_product_height; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[product][product_height]" value="<?php echo isset($product_height) ? $product_height : 50;?>" placeholder="<?php echo $ns_text_product_height; ?>" id="input-product_height" class="form-control" />									 
						</div>
					</div>		
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-product"><?php echo $ns_text_product; ?></label>
						<div class="col-sm-9">
							<input type="text" name="product" value="" placeholder="<?php echo $ns_text_product; ?>" id="input-product" class="form-control" />
							<div id="product-product" class="well well-sm" style="height: 250px; overflow: auto;">
								<?php if(!empty($products_list_sel)) { ?>
									<?php foreach ($products_list_sel as $products_list) { ?>
									<div id="product-item-<?php echo $products_list['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $products_list['name']; ?>
										<input type="hidden" name="menuvh[product][products_list][]" value="<?php echo $products_list['product_id']; ?>" />
									</div>
									<?php } ?>
								<?php } ?>
							</div>
						</div>
					</div>
				</div>
				
				<div class="show_elements show_elements_link">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-product"><?php echo $ns_text_link_options; ?></label>
						<div class="col-sm-9">
							<select id="input-use_target_blank" name="menuvh[use_target_blank]" class="form-control">
								<?php if ($use_target_blank) { ?>
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
				<div class="show_elements show_elements_freelink">
					<div class="form-group required">
						<label class="col-sm-3 control-label" for="input_variant_category"><?php echo $ns_type_dropdown_list; ?></label>
						<div class="col-sm-9">
							<select onChange="sel_type_category()" name="menuvh[sfl][variant_category]" id="input_variant_freelink" class="form-control">
								<option <?php if(isset($sfl['variant_category']) && ($sfl['variant_category'] == 'simple')) { ?> selected="selected" <?php } ?> value="simple"><?php echo $ns_type_dropdown_simple; ?></option>
								<option <?php if(isset($sfl['variant_category']) && ($sfl['variant_category'] == 'full')) { ?> selected="selected" <?php } ?> value="full"><?php echo $ns_type_dropdown_full; ?></option>
								<option <?php if(isset($sfl['variant_category']) && ($sfl['variant_category'] == 'full_image')) { ?> selected="selected" <?php } ?> value="full_image"><?php echo $ns_type_dropdown_full_image; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $ns_text_product_width; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[sfl][freelink_img_width]" value="<?php echo isset($sfl['freelink_img_width'])?$sfl['freelink_img_width']:50?>" placeholder="<?php echo $ns_text_product_width; ?>" class="form-control" />									 
						</div>
					</div>		
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $ns_text_product_height; ?></label>
						<div class="col-sm-9">
							<input type="text" name="menuvh[sfl][freelink_img_height]" value="<?php echo isset($sfl['freelink_img_height'])?$sfl['freelink_img_height']:50?>" placeholder="<?php echo $ns_text_product_height; ?>" class="form-control" />									 
						</div>
					</div>
									
					<ul class="nav nav-tabs" id="language-freelink-menu">
						<?php foreach ($languages as $language) { ?>
						<li><a href="#language-freelink-<?php echo $language['language_id']; ?>" data-toggle="tab">
						<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					</ul>
					<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="language-freelink-<?php echo $language['language_id']; ?>">	
							<table id="freelinkitems" class="table table-bordered table-hover">
								<thead>
									<tr>
										<td><?php echo $ns_text_thumb; ?></td>
										<td><?php echo $ns_text_menu_name; ?></td>
										<td><?php echo $ns_text_type_link; ?></td>
										<td><?php echo $column_3level; ?></td>
										<td><?php echo $ns_text_sort_menu; ?></td>
										<td></td>
									</tr>
								</thead>
								<tbody>
								<?php $freelinkitem_row = 0; ?>
								<?php if(isset($freelink_items[$language['language_id']])){?>
								<?php foreach ($freelink_items[$language['language_id']] as $freelink_item) { ?>
									<tr id="freelinkitem-row<?php echo $freelinkitem_row; ?>">
										<td class="text-center">
											<a href="" id="thumb-image-freelink-<?php echo $freelinkitem_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $freelink_item['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
											<input type="hidden" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][image]" value="<?php echo $freelink_item['image']; ?>" id="input-image-freelink-<?php echo $freelinkitem_row; ?>" />
										</td>
										<td class="text-left">
											<input class="form-control" type="text" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][title]" value="<?php echo $freelink_item['title']; ?>" />
										</td>
										<td class="text-left">
											<input class="form-control" type="text" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][link]" value="<?php echo $freelink_item['link']; ?>" />
										</td>
										<td class="text-left ns-input-group" style="min-width:250px;">
											<?php $freelinkitem_row3level = 0; ?>
											<div id="subcatfreelink<?php echo $freelinkitem_row; ?>">
												<?php if(isset($freelink_item['subcat'])) { ?>
												<?php foreach($freelink_item['subcat'] as $subcat3level){?>
													<div id="subcatfreelink-row-<?php echo $freelinkitem_row; ?><?php echo $freelinkitem_row3level; ?>">
														<div class="input-group">
															<input class="form-control" type="text" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][subcat][<?php echo $freelinkitem_row3level; ?>][title]" value="<?php echo isset($subcat3level['title']) ? $subcat3level['title'] : ''; ?>" />			
															<input class="form-control" type="text" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][subcat][<?php echo $freelinkitem_row3level; ?>][link]" value="<?php echo isset($subcat3level['link']) ? $subcat3level['link'] : ''; ?>" />
															<span class="input-group-addon"><a class="text-danger" onclick="$('#language-freelink-<?php echo $language['language_id']; ?> #subcatfreelink-row-<?php echo $freelinkitem_row; ?><?php echo $freelinkitem_row3level; ?>').remove();" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-trash-o"></i></a></span>
														</div>
													<hr>
													<?php $freelinkitem_row3level++; ?>
													</div>	
												<?php } ?>
												<?php } ?>
											<input type="hidden" id="subcatfreelink-row-number-<?php echo $freelinkitem_row; ?>" value="<?php echo $freelinkitem_row3level;?>">	
											</div>
											<a class="btn btn-success" onclick="addFreelinkItem3level('<?php echo $freelinkitem_row; ?>','<?php echo $language['language_id']; ?>');"><?php echo $text_add; ?></a>
										</td>
										<td class="text-left">
											<input  class="form-control" type="text" name="menuvh[sfl][freelink_item][<?php echo $language['language_id']; ?>][<?php echo $freelinkitem_row; ?>][sort]" value="<?php echo $freelink_item['sort']; ?>" />
										</td>
										<td class="text-right">
											<a class="btn btn-danger" onclick="$('#freelinkitem-row<?php echo $freelinkitem_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-trash-o"></i></a>
										</td>
									</tr>
								<?php $freelinkitem_row++; ?>
								<?php } ?>
								<?php } ?>
								<input type="hidden" id="freelink-row-number" value="<?php echo $freelinkitem_row;?>">	
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4"></td>
										<td class="text-right"><a class="btn btn-primary" onclick="addFreelinkItem('<?php echo $language['language_id']; ?>');" data-toggle="tooltip" title="<?php echo $text_add; ?>"><i class="fa fa-plus-circle"></i></a></td>
									</tr>
								</tfoot>
							</table>
						</div>
					<?php } ?>
					</div>
				</div>
				
				<div class="show_elements_add_html" <?php if(isset($menu_sheme_type) && ($menu_sheme_type == '1')){?>style="display:none;"<?php } ?>>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="input_use_html_category"><?php echo $ns_text_add_html; ?></label>
					<div class="col-sm-9">
						<div class="form-group">
							<div class="col-sm-12">
								<select id="input_use_html_category" name="menuvh[use_add_html]" class="form-control">
									<?php if ($use_add_html) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>								
							</div>
						</div>
						<ul class="nav nav-tabs" id="language_add_html">
							<?php foreach ($languages as $language) { ?>
								<li><a href="#language_add_html_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
						<div class="tab-content">
							<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language_add_html_<?php echo $language['language_id']; ?>">
									<div class="form-group required">
										<div class="col-sm-12">
											<textarea class="form-control summernote" name="menuvh[add_html][<?php echo $language['language_id']; ?>]" id="input_add_html_description_<?php echo $language['language_id']; ?>"><?php echo isset($add_html[$language['language_id']]) ? $add_html[$language['language_id']] : ''; ?></textarea>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
					</div>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="input-status"><?php echo $ns_text_status; ?></label>
					<div class="col-sm-9">
						<select name="menuvh[status]" id="input-status" class="form-control">
							<?php if ($menuvh['status']) { ?>
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
					<label class="col-sm-3 control-label" for="input-status"><?php echo $ns_text_sticker_parent; ?></label>
					<div class="col-sm-9">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
								<input id="sticker_parent_<?php echo $language['language_id']; ?>" class="form-control" type="text" name="menuvh[sticker_parent][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menuvh['sticker_parent'][$language['language_id']]) ? $menuvh['sticker_parent'][$language['language_id']] : ''; ?>" />
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $ns_text_sticker_parent_bg;?></label>
					<div class="col-sm-9">
						<input class="form-control color" type="text" name="menuvh[sticker_parent_bg]" value="<?php echo isset($menuvh['sticker_parent_bg']) ? $menuvh['sticker_parent_bg'] : ''; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $ns_text_sticker_parent_color;?></label>
					<div class="col-sm-9">
						<input class="form-control color" type="text" name="menuvh[spctext]" value="<?php echo isset($menuvh['spctext']) ? $menuvh['spctext'] : ''; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><?php echo $ns_text_sort_menu;?></label>
					<div class="col-sm-9">
						<input class="form-control" type="text" name="menuvh[sort_menu]" value="<?php echo isset($menuvh['sort_menu']) ? $menuvh['sort_menu'] : ''; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="input-image"><?php echo $ns_text_thumb; ?></label>
					<div class="col-sm-9">
						<a href="" id="thumb-image-menu" data-toggle="image" class="img-thumbnail"><img src="<?php echo $menuvh['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="menuvh[image]" value="<?php echo $menuvh['image']; ?>" id="input-image-menu" />
					</div>								
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="input-image-hover"><?php echo $ns_text_thumb_hover; ?></label>
					<div class="col-sm-9">
						<a href="" id="thumb-image-menu-hover" data-toggle="image" class="img-thumbnail"><img src="<?php echo $menuvh['thumb_hover']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="menuvh[image_hover]" value="<?php echo $menuvh['image_hover']; ?>" id="input-image-menu-hover" />
					</div>								
				</div>
				
			</form>
		</div>
	</div>

</div>

<script>
$(document).ready(function() {	
	sel_type_category();
	$('#language_add_html a:first').tab('show');
	$('#language_html a:first').tab('show');
	$('#language-freelink-menu a:first').tab('show');
});
function sel_type_category(){
	$('.show_elements').hide();	
	sel_menu_type = $("#input-menu-type :selected").val();		
	sel_category_type = $("#input_variant_category :selected").val();
	$(".show_elements_"+sel_menu_type).show();
	
		if((sel_menu_type=="category" && (sel_category_type=="simple" || sel_category_type=="0")) || sel_menu_type=="0" || sel_menu_type=="freelink" || sel_menu_type=="link" || sel_menu_type=="html"){
			$('.show_elements_add_html').hide();
		} else {
			<?php if(isset($menu_sheme_type) && ($menu_sheme_type == '2')){?>
			$('.show_elements_add_html').show();
			<?php } ?>
		}	
}



$('#input-category').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {				
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#input-category').val('');		
		$('#category-item-' + item['value']).remove();	
		cathtml1  = '<div class="row-category-menu" id="category-item-' + item['value'] + '">';
		cathtml1 += '<i class="del-cat fa fa-minus-circle"></i>';
		cathtml1 += '<span>'+item['label']+'</span>';		
		cathtml1 += '<input type="hidden" name="menuvh[category_setting][category_list][]" value="' + item['value'] + '" /></div>';
		
		$('#category-category').append(cathtml1);	
	}
});
$('#category-category').delegate('.del-cat', 'click', function() {
	$(this).parent().remove();
});

$('#input-product').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#input-product').val('');		
		$('#product-item' + item['value']).remove();		
		$('#product-product').append('<div id="product-item' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="menuvh[product][products_list][]" value="' + item['value'] + '" /></div>');	
	}
});
$('#product-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});


function addFreelinkItem(language_id) {
	var freelinkitem_row = $('#freelink-row-number').val();
	$('#freelink-row-number').val(parseInt(freelinkitem_row) + 1);
	html  = '<tr id="freelinkitem-row'+ freelinkitem_row +'">';
	html += '<td class="text-center"><a href="" id="thumb-image-freelink-'+ freelinkitem_row +'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][image]" value="" id="input-image-freelink-'+ freelinkitem_row +'" /></td>';
	html += '<td class="text-left">';
	html += '<input class="form-control" type="text" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][title]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][link]" value="" />';
	html += '<td class="text-left ns-input-group" style="min-width:250px;">';
	html += '	<div id="subcatfreelink'+ freelinkitem_row +'">';
	html += '		<input type="hidden" id="subcatfreelink-row-number-'+ freelinkitem_row +'" value="0">';	
	html += '	</div>';
	html += '	<a class="btn btn-success" onclick="addFreelinkItem3level('+ freelinkitem_row +',\''+ language_id +'\');"><?php echo $text_add; ?></a>';
	html += '</td>';
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#freelinkitem-row'+ freelinkitem_row +'\').remove();" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#language-freelink-'+ language_id +' #freelinkitems tbody').append(html);

	freelinkitem_row++;
}
			

function addFreelinkItem3level(freelinkitem_row,language_id) {
	var freelinkitem_row3level = $('#subcatfreelink-row-number-'+ freelinkitem_row).val();
	$('#subcatfreelink-row-number-'+ freelinkitem_row).val(parseInt(freelinkitem_row3level) + 1);
	html  = '<div id="subcatfreelink-row-'+ freelinkitem_row + freelinkitem_row3level+'">';
	html += '<div class="input-group">';
	html += '<input class="form-control" type="text" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][subcat]['+ freelinkitem_row3level +'][title]" value="" />';				
	html += '<input class="form-control" type="text" name="menuvh[sfl][freelink_item]['+ language_id +']['+ freelinkitem_row +'][subcat]['+ freelinkitem_row3level +'][link]" value="" />';
	html += '<span class="input-group-addon"><a class="text-danger" onclick="$(\'#language-freelink-'+ language_id +' #subcatfreelink-row-'+ freelinkitem_row + freelinkitem_row3level+'\').remove();" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-trash-o"></i></a></span>';
	html += '</div><hr>';
	html += '</div>';
	$('#language-freelink-'+ language_id +' #subcatfreelink'+freelinkitem_row).append(html);

	freelinkitem_row3level++;
}
</script>
<?php echo $footer; ?>
