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
				<div class="col-xs-12 col-sm-6 col_main">
					<a href="<?php echo $news_item['href']; ?>">
						<div class="news" style='background-image: url("<?=$news_item["thumb"]?>")'>
							<div class="news_text">
								<div class="news_header"><?php echo $news_item['title']; ?></div>
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
