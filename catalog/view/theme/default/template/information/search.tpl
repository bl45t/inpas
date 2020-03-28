<?php echo $header; ?>
<div id="searchPage" class="container">
	<h3><?=$text_result_search?></h3>
	<?php if (count($result_search)) { ?>
		<?php foreach ($result_search as $rs) { ?>
			<div class="col-12">
				<div class="searched_item_block">
					<div class="news_header">
						<strong><a href="<?=$rs['link']?>"><?=$rs['name']?></a></strong>
					</div>
					<div class="news_subheader">
						<p><?=$rs['description']?></p>
					</div>
				</div>
			</div>
		<?php } ?>

		<div class="row">
	        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
	        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
	    </div>
	<?php } else { ?>
		<div class="text-center">
			<strong><?=$text_empty?></strong>
		</div>
		
	<?php } ?>
</div>

<?php echo $content_bottom;?>
<?php echo $footer; ?>