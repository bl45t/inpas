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
      <div class=" full_event_page">
        
        <div class="row event_block">   
          <div class="col-md-3"> 
                <div class=" event_page">
                    <div class="image" style='background-image: url("<?=$thumb?>")'>
                    </div>
                </div>
          </div>

        <div class="col-md-9">
          <div class="event_full">
            <div class="event_article_header_text ">
              <div class="tag_row">
                <?php foreach ($tags as $tag) { ?>
                    <div class="white_tag "><?=$tag?></div>
                <?php } ?>
              </div>
              <div class="news_header"><?=$heading_title; ?></div>
              <div class="news_subheader"><?=$preview?></div>
              <div class="date_event color1">
                <span class="sub_grey"> <?=$text_date_start?> &nbsp;  </span> <?=$date_start?>
              </div>
              <div class="date_event color1">
                <span class="sub_grey"> <?=$text_date_end?> &nbsp;  </span> <?=$date_end?>
              </div>
              <div class="place_event color1">
                <span class="sub_grey"> <?=$text_venue?> &nbsp;  </span> <?=$venue?>
              </div>
            </div>
          </div> 
        </div>         
        </div>

  
        <div class="event_main_text">
          	<?php echo $description; ?>
   

     
        	<?php if ($images) { ?>
          
	         
	            <?php if ($images) { ?>
	            <?php foreach ($images as $image) { ?>
	           <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
	            <?php } ?>
	            <?php } ?>
          
          	<?php } ?>

          	<?php if ($attributes) { ?>
	      		<h5><?php echo $text_attributes;?></h5>
	            <?php foreach ($attributes as $attribute_group) { ?>
	              	<?php foreach ($attribute_group['attribute'] as $attribute_item) { ?>
                   		<b><?php echo $attribute_item['name'];?>:</b> <?php echo $attribute_item['text'];?><br />
	                <?php } ?>
	          	<?php } ?>
            <?php } ?>
        </div>

        <hr class="hr_text_page hidden">
        <div class="share hidden">
          <div class="share_text">Поделиться</div>
          <div class="social vk">
            <img src="catalog/view/theme/default/image/icons/vk.svg">
          </div>
          <div class="v_border"></div>
          <div class="social facebook">
             <img src="catalog/view/theme/default/image/icons/facebook.svg">
          </div>
          <div class="v_border"></div>
          <div class="social twitter">
            <img src="catalog/view/theme/default/image/icons/twitter.svg">
          </div>
          <div class="v_border"></div>
          <div class="social instagram">
            <img src="catalog/view/theme/default/image/icons/instagram.svg">
          </div>
        </div>

        <div class="reg_event hidden">
          <div class="reg_h">Регистрация на мероприятие</div>

          <form action="<?=$action?>" method="POST">
            <div class="form-group">
              <label for="exampleInputEmail1">Почта*</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">  <div class="input_icon input_right"></div>             
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Имя и фамилия*</label>
              <input type="text" class="form-control" id="exampleInputPassword1" placeholder=""> <div class="input_icon input_error"></div>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Телефон*</label>
              <input type="tel" class="form-control" id="exampleInputPassword1" placeholder=""> <div class="input_icon input_null"></div>
            </div>
                        <div class="form-group">
              <label for="exampleInputPassword1">Место работы</label>
              <input type="text" class="form-control" id="exampleInputPassword1" placeholder=""> <div class="input_icon input_null"></div>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Должность</label>
              <input type="text" class="form-control" id="exampleInputPassword1" placeholder=""> <div class="input_icon input_null"></div>
            </div>

            <button class="login" type="submit">Зарегистрироваться</button>
          </form>

        </div>
     
      </div>

  	  <?php if ($articles) { ?>
  	  <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
                <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                <p><?php echo $article['preview']; ?></p>

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
        <?php } ?>
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

      <?php if ($products) { ?>
      <h3><?php echo $text_related_products; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>

 
      </div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>