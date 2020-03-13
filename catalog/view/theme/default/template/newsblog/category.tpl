<?php echo $header; ?>
<div id="eventPage" class="container">
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
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($articles) { ?>
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="col-md-12">
          
            <div class="row event_block">
              <div class="col-md-3"> 
                <div class="event event_page">
                  <?php if ($article['thumb']) { ?>
                    <div class="image">
                        <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" />
                    </div>
                  <?php } ?>
                </div>
              </div>

              <div class="col-md-9">
                <div class="event_full">
                    <div class="news_text">
                      <div class="tag_row">
                       <?php foreach ($article['tags'] as $tag) { ?>
                        <div class="tag"><?=$tag?></div>
                       <?php } ?>
                      </div>

                       <div class="news_header"><?=$article['name']?></div>
                       <div class="news_subheader"><?php echo $article['preview']; ?></div>
                       <div class="date_event">
                        <span class="sub_grey"> Дата начала: </span> <?=$article['date_start']?>
                       </div>
                       <div class="date_event">
                        <span class="sub_grey"> Дата окончания: </span> <?=$article['date_end']?>
                       </div>
                       <div class="place_event"><span class="sub_grey"> Место:</span><?=$article['venue']?></div>
                       <div class="eventpage_more"><a href="<?=$article['href']?>">Подробнее</a></div>

                        <?php if ($article['attributes']) { ?>
        	                <h5><?php echo $text_attributes;?></h5>
        	                <?php foreach ($article['attributes'] as $attribute_group) { ?>
        	                	<?php foreach ($attribute_group['attribute'] as $attribute_item) { ?>
                               	<b><?php echo $attribute_item['name'];?>:</b> <?php echo $attribute_item['text'];?><br />
        	                	<?php } ?>
        	                <?php } ?>
                        <?php } ?>


                    </div>
                </div>
              </div>
            </div>

        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php if ($comments_vk) { ?>
      <div class="row">
        <div class="col-md-12">
			<div id="vk_comments"></div>
			<script type="text/javascript">
			VK.init({apiId: <?php echo $comments_vk; ?>, onlyWidgets: true});
			VK.Widgets.Comments("vk_comments", {limit: 10, attach: "*"});
			</script>
        </div>
      </div>
      <?php } ?>

      <?php if ($comments_fb) { ?>
      <div class="row">
        <div class="col-md-12">
            <div id="fb-root"></div>
			<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.10";
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>
			<div class="fb-comments" data-href="<?php echo $canonical; ?>" data-width="100%" data-numposts="10"></div>
        </div>
      </div>
      <?php } ?>

      <?php if ($comments_dq) { ?>
      <div class="row">
        <div class="col-md-12">
        	<div id="disqus_thread"></div>
			<script>
			var disqus_config = function () {
				this.page.url = "<?php echo $canonical; ?>";
			};

			(function() { // DON'T EDIT BELOW THIS LINE
			var d = document, s = d.createElement('script');
			s.src = 'https://<?php echo $comments_dq; ?>.disqus.com/embed.js';
			s.setAttribute('data-timestamp', +new Date());
			(d.head || d.body).appendChild(s);
			})();
			</script>
			<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        </div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>