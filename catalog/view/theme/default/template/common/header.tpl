<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <?php $assets_version = '?v=1.0.21'; ?>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css">
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap&subset=cyrillic,cyrillic-ext" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap&subset=cyrillic,cyrillic-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://bootstraptema.ru/_sf/7/729.css" type="text/css">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" >
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/style.css<?=$assets_version?>" rel="stylesheet" type="text/css">
<script src="catalog/view/javascript/common.js<?=$assets_version?>" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href'].$assets_version; ?>" rel="<?php echo $link['rel']; ?>" type="text/css">
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script.$assets_version; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

</head>
<body class="<?php echo $class; ?>">
  <nav class="navbar navbar-default" role="navigation">
    <div class="head_all">
    <div class="container navbar-header ">
      <div id="header_logo_block">
        <a class="navbar-brand" href="#">
          <img src="catalog/view/theme/default/image/logo.png" width="270" height="auto" alt="lorem">
        </a>
      </div>

      <div id="header_functional_buttons">
        <div id="btn_lang_and_search">
          <div class="language">
           <?php echo $language; ?>
          </div>

          <div class="search autocompleate_group">
            <input id="header_search" type="search" placeholder="поиск" class="input" />
            <i id="search_fa_btn" class="fa fa-search"></i>
          </div>
        </div>

        <div id="btn_account">
          <?php if ($logged) { ?>
            <a href="<?=$logout?>" class="login"><?=$text_logout?></a>
            <a href="<?=$account?>" class="login"><?=$text_account?></a>
          <?php } else { ?>
            <a href="<?=$register?>" class="login"><?=$text_register?></a>
            <a href="<?=$login?>" class="login"><?=$text_login?></a>
          <?php } ?>
        </div>

      </div>

    </div>

<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
</div>
</nav>

<script type="text/javascript">

    $('#header_search').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=common/header/autocomplete&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {

          response($.map(json, function(item) {
            labelContent = '<strong>'+item['name']+'</strong>';

            if (item['description'] != undefined && item['description'].trim() != '') {
              labelContent += '<br/>'+item['description']+'...';
            }

            return {
              label: labelContent,
              link: item['link'],
            }
          }));
        }
      });
    }
  });

</script>
