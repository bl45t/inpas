<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>


        <div class="col-xs-12 col-md-3">
          <p class="header1"><?=$text_publications?></p>
            <?php foreach ($publications as $publication) { ?>
              <a href="<?=$publication['link']?>" target="_blank" title="<?=$publication['name']?>">
                  <div class="publication">

                    <div class="col-md-3 col-xs-2 publication_image">
                      <img src="/image/<?=$publication['image']?>">
                    </div>

                    <div class="col-md-9 col-xs-10">
                      <div class="head_publication"><?=$publication['name']?></div>
                      <!--<div class="date_publication"><?=date("d.m.y",(int)$publication['updated'])?></div>-->
                    </div>

                  </div>
              </a>
            <?php } ?>

            <a href="<?=$all_publications_link?>">
              <div class="event_more">
                <?=$text_all_publications?>
              </div>
            </a>
        </div>
        <?php echo $column_right; ?>
    </div>


    </div>

</div>
    <?php echo $content_bottom; ?>
<?php echo $footer; ?>
