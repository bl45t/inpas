<?php echo $header; ?>
<div id="publicationPage" class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		<div class="col-md-12">
	        <div class="header_of_list">
	            <div class="header2"><?=$text_publications?></div>

	            <form action="" method="post" class="search search_sub">
	              <input type="search search_sub" name="" placeholder="поиск" class="input" />
	            </form>

	            <div class="select_cat">
	              <span class="select_label"><?=$text_category?></span>
	              <section class="cat_select">
	                <select class="cs-select cs-skin-rotate select_style">
	                    <option value="0">Все</option>
	                    <?php foreach ($attribute_groups as $ag) { ?>
							<option value="<?=$ag['attribute_group_id']?>"><?=$ag['name']?></option>
	                    <?php } ?>
	                </select>
	              </section>
	            </div>
	        </div>
					
				<?php foreach ($publications as $publication) { ?>
					<div class="col-xs-12 col-md-6 col_main ">  
		              <a href="<?=$publication['link']?>" target="_blank" title="<?=$publication['name']?>">
		                  <div class="row publication">
		                    
		                    <div class="col-md-2">
		                      <img src="/catalog/view/theme/default/image/publ.png">
		                    </div>
		                    
		                    <div class="col-md-10">
		                      <div class="head_publication"><?=$publication['name']?></div>
		                      <div class="date_publication"><?=date("d.m.y",$publication['updated'])?></div> 
		                    </div>       
		                    
		                  </div>
		              </a>
		          	</div>
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
<?php echo $content_bottom; ?>
<?php echo $footer; ?>