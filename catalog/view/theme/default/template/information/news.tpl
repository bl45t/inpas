<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="row">
				<div class="col-md-12 full_width">
	      			<div class="full_news_page">
						<div class=" fn_head">  
							<div class="col-md-3"> 
	        					<div class="img_full_news" style='background-image: url("<?=$thumb?>")'></div>
	        				</div> 
	        				<div class="col-md-9">    
					          <div class="full_new_header">
					                <div class="tag_row">
	                					<?php foreach ($tags as $tag) { ?>
	                    					<div class="tag "><?=$tag?></div>
	                					<?php } ?>
	              					</div>
					            <div class="news_header"><?php echo $heading_title; ?></div>
					            <div class="news_subheader"></div>		         
					            <div class="news_date"><?=$posted?></div>
					          </div>
					        </div>
	        			</div>

	        			<div class="event_main_text news_p">
							<?php echo $description; ?>
	        			</div>
	      			</div>
	      		</div>
      		</div>
		</div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>