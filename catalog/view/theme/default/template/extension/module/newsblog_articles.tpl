<div class="col-xs-12 col-md-3">
  <?php if ($heading_title) { ?>
    <p class="header1"><?php echo $heading_title; ?></p>
  <?php } ?>

  <?php foreach ($articles as $article) { ?>
    <div class="event_block" onclick=location.href="<?php echo $article['href']?>">
        <div class="event">
          <?php if ($article['thumb']) { ?>

            <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>"/>

          <?php } ?>
         <span>
          <div class="header_event"><?php echo $article['name']; ?></div>
          <div class="date_event"><span class="sub_grey"> Дата: </span> 3 марта – 7 марта 2020 </div>
          <div class="place_event"><span class="sub_grey"> Место: </span> Бгту им. Шухова </div>
          </span>
          <!--  Анонс
          <?php echo $article['preview'];?>
          -->
        </div> 
  </div>
  <?php } ?>

</div>