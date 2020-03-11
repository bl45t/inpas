<div class="col-xs-12 col-md-3">
  <?php if ($heading_title) { ?>
    <p class="header1"><?php echo $heading_title; ?></p>
  <?php } ?>

  <?php foreach ($articles as $article) { ?>
    <div class="event_block" onclick=location.href="<?php echo $article['href']?>">
        <div id="event_hp" class="event">
          <?php if ($article['thumb']) { ?>

            <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>"/>

          <?php } ?>
         <div class="event_info">
            <div class="header_event"><?php echo $article['name']; ?></div>
            <div class="date_event"><span class="sub_grey"> Дата начала:</span><?=$article['date_start']?></div>
            <div class="date_event"><span class="sub_grey"> Дата окончания:</span><?=$article['date_end']?></div>
            <div class="place_event"><span class="sub_grey"> Место: </span><?=$article['venue']?></div>
          </div>
          <!--  Анонс
          <?php echo $article['preview'];?>
          -->
        </div> 
  </div>
  <?php } ?>
    <div class="event_more">
        <a href="<?=$link_to_category?>">Все Мероприятия</a> 
    </div>
</div>