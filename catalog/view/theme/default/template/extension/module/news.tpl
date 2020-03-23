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
				<div class="news_header"><?php echo $news_item['title']; ?></div>
	          </div>
		</div>
	</a>
	<?php } ?>
	<div class="event_more">
        <a href="<?=$news_list?>"><?=$text_all_news?></a>
    </div>
</div>
