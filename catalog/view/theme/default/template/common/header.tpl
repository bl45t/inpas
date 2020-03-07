<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
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
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="catalog/view/theme/default/stylesheet/style.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

</head>
<body class="<?php echo $class; ?>">
<nav class="navbar navbar-default" role="navigation">

  <div class="head_all">
        <div class="container navbar-header ">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <a class="navbar-brand" href="#"><img src="catalog/view/theme/default/image/logo.png" 
  width="270" height="auto" alt="lorem"></a>

        <button class="login">Вход</button>

        <form action="" method="post" class="search">
        <input type="search" name="" placeholder="поиск" class="input" />
      </form>

        <div class="language">
          <img src="catalog/view/theme/default/image/icons/russia.svg " width="35" alt="ru"  class="rus">
          <img src="catalog/view/theme/default/image/icons/united-kingdom.svg" width="35" height="auto" alt="Ru">
        </div>

    </div>

    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

      <ul class="container nav navbar-nav">
        <li class="menu1 active"><a href="#">Главная</a></li>
        <li class="menu2"><a href="#">О проекте</a></li>
        <li class="menu3"><a href="#">Новости</a></li>
        <li class="menu4"><a href="#">Публикации</a></li>
        <li class="menu5"><a href="#">Мероприятия</a></li> 
        <li class="menu6"><a href="#">База данных</a></li> 
        <li class="menu7"><a href="#">Контакты</a></li>        
      </ul> 

      <button class="login mobile_header">Вход</button>

        <form action="" method="post" class="search mobile_header">
        <input type="search" name="" placeholder="поиск" class="input" />
      </form>

        <div class="language mobile_header">
          <img src="img/icons/russia.svg " width="35" alt="ru"  class="rus">
          <img src="img/icons/united-kingdom.svg" width="35" height="auto" alt="Ru">
        </div>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>