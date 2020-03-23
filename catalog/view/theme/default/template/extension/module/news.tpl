<div class="col-xs-12 col-md-6">
<?php if($show_title) { ?>
	<p class="header1">
		<?php echo $show_icon ? '<i class="fa fa-newspaper-o fa-3x"></i>&nbsp;' : ''; ?>
		<?php echo $heading_title; ?>
	</p>
<?php } ?>

	<?php foreach ($news as $news_item) { ?>
	<a href="<?php echo $news_item['href']; ?>">
		<div class="news" style='background-image: url("<?=$news_item["thumb"]?>")'>
				<div class="news_text ">
					<div class="tag_row">
					<?php foreach ($news_item['tags'] as $tag) { ?>
	          			<div class="white_tag"><?=$tag?></div>
	          		<?php } ?>
	          		</div>

					<div class="news_header"><?php echo $news_item['title']; ?></div>
					<div class="news_subheader"><?php echo $news_item['description']; ?></div>
					<div class="row">
						<div class="col-md-6">
							<div class="news_date"><?=$news_item['posted']?></div>
						</div>
						<!--<div class="col-md-6">
							<div class="news_readtime"><?=$news_item['read_time']?> <?=$text_reading_time?></div>
						</div>-->
					</div>

	          	</div>

		</div>
	</a>
	<?php } ?>
	<div class="event_more">
        <a href="<?=$news_list?>"><?=$text_all_news?></a>
    </div>
</div>
