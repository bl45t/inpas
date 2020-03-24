<div class="col-xs-12 col-md-4">
  <?php if ($heading_title) { ?>
    <p class="header1"><?php echo $heading_title; ?></p>
  <?php } ?>

  <?php foreach ($articles as $article) { ?>
    <a class="event_link" href="<?php echo $article['href']?>">
        <div id="event_hp" class="event" style='background-image: url("<?=$article["thumb"]?>")'>
          <div class="event_text">
         
            <div class="header_event"><?php echo $article['name']; ?></div>
            <div class="date_event"><span class="sub_grey"> <?=$text_date_start?> </span><?=$article['date_start']?></div>
            <?php if (strtotime($article['date_end']) != strtotime('0000-00-00')) { ?>
              <div class="date_event"><span class="sub_grey"> 
                <?=$text_date_end?></span><?=$article['date_end']?>
              </div>
            <?php } ?>
            <div class="place_event"><span class="sub_grey"> <?=$text_venue?> </span><?=$article['venue']?></div>
         </div>
          <!--  Анонс
          <?php echo $article['preview'];?>
          -->
        </div> 
  </a>
  <?php } ?>
    <div class="event_more">
        <a href="<?=$link_to_category?>"><?=$button_list?></a> 
    </div>
</div>