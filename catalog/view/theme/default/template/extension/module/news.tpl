<div class="col-xs-12 col-md-6 col_main">
<?php if($show_title) { ?>
	<p class="header1">
		<?php echo $show_icon ? '<i class="fa fa-newspaper-o fa-3x"></i>&nbsp;' : ''; ?>
		<?php echo $heading_title; ?>
	</p>
<?php } ?>

	<?php foreach ($news as $news_item) { ?>
	<a href="<?php echo $news_item['href']; ?>">
		<div class="news">
			<div class="news_text">
				<div class="tag tag_cat">Наука</div>
          		<div class="tag tag_univ">Бгту</div>
          		<div class="tag tag_country">Россия</div>
				<div class="news_header"><?php echo $news_item['title']; ?></div>
				<div class="news_subheader"><?php echo $news_item['description']; ?></div>
				<div class="news_date">25 фев.  2020</div>   <div class="news_readtime">12 минут чтения</div>
          	</div>

          	<?php if($news_item['thumb']) { ?>
				<div class="news_image">
					<img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" />
				</div>
			<?php } ?>
			
		</div>
	</a>
	<?php } ?>

</div>