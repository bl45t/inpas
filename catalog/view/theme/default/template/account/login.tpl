<?php echo $header; ?>
<div id="loginPage" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <div class="container">
          <div class="row reg_m">
            <div class="form_group">
              <div class="header1"><?=$heading_title?></div>
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div id="loginGroup" class="form-group">
                      <label for="exampleInputEmail1"><?php echo $entry_email; ?></label>
                      <input type="text" name="email" class="form-control" id="inputlogin" aria-describedby="emailHelp" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>">  <div class="input_icon input_null"></div>             
                    </div>
                    <div id="passGroup" class="form-group">
                      <label for="exampleInputPassword1"><?php echo $entry_password; ?></label>
                      <input type="password" name="password" class="form-control" id="inputpassword"  value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>"> <div class="input_icon input_null"></div>
                    </div>

                    <input type="submit" class="login button_reg" value="<?php echo $button_login; ?>" class="btn btn-primary" />
                    <div class="reg_link"><a href="<?=$register?>"><?=$text_register?></a></div>
                </form>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    <?php echo $column_right; ?>
  </div>
  
  <script>
    $("#loginGroup input").change(function(){

      let loginText = $(this).val();
      loginText = loginText.trim();
        
      if (!loginText || loginText.length === 0) {
        $("#loginGroup .input_icon").removeClass('input_null');
        $("#loginGroup .input_icon").removeClass('input_right');
        $("#loginGroup .input_icon").addClass('input_error');
      } else {
        $("#loginGroup .input_icon").removeClass('input_null');
        $("#loginGroup .input_icon").removeClass('input_error');
        $("#loginGroup .input_icon").addClass('input_right');
      }

    });

     $("#passGroup input").change(function(){

      let pass = $(this).val();
      pass = pass.trim();
        
      if (!pass || pass.length === 0) {
        $("#passGroup .input_icon").removeClass('input_null');
        $("#passGroup .input_icon").removeClass('input_right');
        $("#passGroup .input_icon").addClass('input_error');
      } else {
        $("#passGroup .input_icon").removeClass('input_null');
        $("#passGroup .input_icon").removeClass('input_error');
        $("#passGroup .input_icon").addClass('input_right');
      }

    });
  </script>

</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>