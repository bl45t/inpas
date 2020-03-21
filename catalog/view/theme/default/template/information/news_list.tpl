<?php echo $header; ?>
<div id="newsPage" class="container">
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
			<h1><?php echo $heading_title; ?></h1>
			<?php if ($news_list) { ?>
			<div class="row">

				<div class="select_cat">
					<label class="select_label" for="input-limit"><?php echo $text_limit; ?></label>
					<select id="input-limit" class="cs-select cs-skin-rotate select_style" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				
				<div class="select_cat">
					<label class="select_label" for="input-sort"><?php echo $text_sort; ?></label>
					<select id="input-sort" class="cs-select cs-skin-rotate select_style" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
			
			</div>
			<br />

			<div class="row">
				<?php foreach ($news_list as $news_item) { ?>
				<div class="col-xs-12 col-md-6 col_main">
					<a href="<?php echo $news_item['href']; ?>">
						<div class="row news">
							<div class="col-md-9">
								<div class="news_text">
									<div class="tag_row">
									<?php foreach ($news_item['tags'] as $tag) { ?>
					          			<div class="tag"><?=$tag?></div>
					          		<?php } ?>
					          		</div>

									<div class="news_header"><?php echo $news_item['title']; ?></div>
									<div class="news_subheader"><?php echo $news_item['description']; ?></div>
									<div class="news_date"><?=$news_item['posted']?></div>
									<div class="news_readtime"><?=$news_item['read_time']?> <?=$text_reading_time?></div>
		          				</div>
		          			</div>
							<div class="col-md-3">
				          	<?php if($news_item['thumb']) { ?>
								<div class="news_image">
									<img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" />
								</div>
							<?php } ?>
							</div>

						</div>
					</a>
				</div>
				<?php } ?>
			</div>

			<div class="row">
				<div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
				<div class="col-sm-12 text-right"><?php echo $results; ?></div>
			</div>
			<?php } else { ?>
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
		</div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>