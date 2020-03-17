<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-manufacturer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer" class="form-horizontal">
          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">

               <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <select name="id_country" id="input-country" class="form-control country_select">
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $id_country) {  ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
                </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-region"><?php echo $entry_region; ?></label>
                <div class="col-sm-10">
                  <select name="id_region" id="input-region" class="form-control region_select">
                   <!-- ajax -->
                  </select>
                </div>
              </div>

          <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-city<?php echo $language['language_id']; ?>"><?php echo $entry_city; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][city]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['city'] : ''; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-phone<?php echo $language['language_id']; ?>"><?php echo $entry_phone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][phone]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['phone'] : ''; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-phone<?php echo $language['language_id']; ?>" class="form-control" />
                  <?php if (isset($error_phone[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_phone[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>

              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email<?php echo $language['language_id']; ?>"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][email]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['email'] : ''; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email<?php echo $language['language_id']; ?>" class="form-control" />
                  <?php if (isset($error_email[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_email[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
  
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax<?php echo $language['language_id']; ?>"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][fax]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['fax'] : ''; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address<?php echo $language['language_id']; ?>"><?php echo $entry_address; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][address]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['address'] : ''; ?>" placeholder="<?php echo $entry_address; ?>" id="input-address<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>

               <div class="form-group">
                <label class="col-sm-2 control-label" for="input-post-code<?php echo $language['language_id']; ?>"><?php echo $entry_post_code; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][post_code]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['post_code'] : ''; ?>" placeholder="<?php echo $entry_post_code; ?>" id="input-post-code<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-site-address<?php echo $language['language_id']; ?>"><?php echo $entry_site_address; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][site_address]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['site_address'] : ''; ?>" placeholder="<?php echo $entry_site_address; ?>" id="input-site-address<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" data-lang="<?php echo $lang; ?>" class="form-control summernote"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-educational-program<?php echo $language['language_id']; ?>"><?php echo $entry_educational_program; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][educational_program]" placeholder="<?php echo $entry_educational_program; ?>" id="input-educational-program<?php echo $language['language_id']; ?>" data-lang="<?php echo $lang; ?>" class="form-control summernote"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['educational_program'] : ''; ?></textarea>
                </div>
              </div>

              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_h1; ?>" id="input-meta-h1<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                </div>
              </div>
            </div>
          <?php } ?>

          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $manufacturer_store)) { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $manufacturer_store)) { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
              <?php if ($error_keyword) { ?>
              <div class="text-danger"><?php echo $error_keyword; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-10">
                <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                </select>
              </div>
          </div>

        </form>
      </div>
    </div>
  </div>

<script>
  $("#input-name1").change(function(){
    let str = $(this).val();
    let transiltName = translit(str);
    $("#input-name2").val(transiltName);
  });

  $("#input-city1").change(function(){
    let str = $(this).val();
    let transiltName = translit(str);
    $("#input-city2").val(transiltName);
  });

  $("#input-address1").change(function(){
    let str = $(this).val();
    let transiltName = translit(str);
    $("#input-address2").val(transiltName);
  });
  
  $("#input-phone1").change(function(){
    let str = $(this).val();
    $("#input-phone2").val(str);
  });

  $("#input-email1").change(function(){
    let str = $(this).val();
    $("#input-email2").val(str);
  });

  $("#input-fax1").change(function(){
    let str = $(this).val();
    $("#input-fax2").val(str);
  });

  $("#input-post-code1").change(function(){
    let str = $(this).val();
    $("#input-post-code2").val(str);
  });


  $("#input-site-address1").change(function(){
    let str = $(this).val();
    $("#input-site-address2").val(str);
  });


$('.country_select').on('change', function() {
  $.ajax({
    url: '/index.php?route=account/account/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
     
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $id_region; ?>') {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('.region_select').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('.country_select').trigger('change');


</script>


  <script type="text/javascript"><!--
    <?php if ($ckeditor) { ?>
    <?php foreach ($languages as $language) { ?>
      ckeditorInit('input-description<?php echo $language['language_id']; ?>', getURLVar('token'));
      <?php } ?>
    <?php } ?>
  //--></script>
  <script type="text/javascript"><!--
    $('#language a:first').tab('show');
    //--></script></div>
</div>
<?php echo $footer; ?>
