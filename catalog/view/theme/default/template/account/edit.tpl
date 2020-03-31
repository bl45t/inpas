<?php echo $header; ?>
<div class="container">
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
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <input id="is_expert_input" type="hidden" name="is_expert" value="<?=$is_expert?>">
        <fieldset>
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group">
            <label class="required" for="input-firstname"><?php echo $entry_firstname; ?></label>
            <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" class="form-control" />
            </div>
            <div id="input_group_eng_firstname" class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_firstname" value="<?php echo $eng_firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" class="form-control" />
            </div>
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
          </div>
           <div class="form-group ">
              <label class="required" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
            </div>

            <div id="input_group_eng_lastname" class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_lastname" value="<?php echo $eng_lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" class="form-control" />
            </div>
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
          </div>
          
          <div class="form-group ">
              <label for="input-middlename"><?php echo $entry_middlename; ?></label>
            <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
              <input type="text" name="middlename" value="<?php echo $middlename; ?>" placeholder="<?php echo $entry_middlename; ?>" id="input-middlename" class="form-control" />
            </div>

            <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_middlename" value="<?php echo $eng_middlename; ?>" placeholder="<?php echo $entry_middlename; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group ">
              <label class="required" for="input-email"><?php echo $entry_email; ?></label>
           
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
           
          </div>
         <div class="form-group ">
              <label class="" for="input-telephone"><?php echo $entry_telephone; ?></label>
            
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
           
          </div>
          <div class="form-group hidden">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>


          <div id="form_group_post" class="form-group ">
              <label class="" for="input-post"><?php echo $entry_post; ?></label>
              <div class="input-group">
                <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
                <input type="text" name="post" value="<?php echo $post; ?>" placeholder="<?php echo $entry_post; ?>" id="input-post" class="form-control" />
              </div>
              <div id="input_group_eng_post" class="input-group">
                <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_post" value="<?php echo $eng_post; ?>" placeholder="<?php echo $entry_post; ?>" class="form-control" />
              </div>
              <?php if ($error_post) { ?>
                <div class="text-danger"><?php echo $error_post; ?></div>
              <?php } ?>
          </div>

          <div id="form_group_workplace" class="form-group ">
             <label class="" for="input-workplace"><?php echo $entry_workplace; ?></label>
             <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
                <input type="text" name="workplace" value="<?php echo $workplace; ?>" placeholder="<?php echo $entry_workplace; ?>" id="input-workplace" class="form-control" />
            </div>
            <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_workplace" value="<?php echo $eng_workplace; ?>" placeholder="<?php echo $entry_workplace; ?>" class="form-control" />
            </div>
          </div>

          <div id="form_group_interests" class="form-group ">
              <label class="" for="input-interests"><?php echo $entry_interests; ?></label>
              <div class="input-group">
                <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
                <input type="text" name="field_of_interest" value="<?php echo $field_of_interest; ?>" placeholder="<?php echo $entry_interests; ?>" id="input-interests" class="form-control" />
              </div>
              <div class="input-group">
              <span class="input-group-addon">
                <img src="/catalog/language/en-gb/en-gb.png">
              </span>
              <input type="text" name="eng_field_of_interest" value="<?php echo $eng_field_of_interest; ?>" placeholder="<?php echo $entry_interests; ?>" class="form-control" />
              </div>
          </div>

          <div id="form_group_social_link" class="form-group ">
            <label class="" for="input-social-link"><?php echo $entry_social_link; ?></label>
            <input type="text" name="social_link" value="<?php echo $social_link; ?>" placeholder="<?php echo $entry_social_link; ?>" id="input-social-link" class="form-control" />
          </div>

          <div id="form_group_organozation" class="form-group ">
              <label class="" for="input-id-organization"><?php echo $entry_organization; ?></label>
              <select name="id_organization" id="input-id-organization" class="form-control">
                    <option value="0"><?=$text_select?></option>
                  <?php foreach ($organizations as $org) { ?>
                      <?php if (isset($id_organization) && $id_organization == $org['manufacturer_id']) { ?>
                        <option value="<?=$org['manufacturer_id']?>" selected="selected"><?=$org['org_name']?></option>
                      <?php } else { ?>
                        <option value="<?=$org['manufacturer_id']?>"><?=$org['org_name']?></option>
                      <?php } ?>
                  <?php } ?>
              </select>
          </div>

          <div id="form_group_about_me" class="form-group">
              <label class="" for="input-about-me"><?php echo $entry_about_me; ?></label>
              <div class="input-group">
                <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
                <textarea type="text" name="about_me" placeholder="<?php echo $entry_about_me; ?>" id="input-about-me" class="form-control"><?php echo $about_me; ?></textarea>  
              </div>
              <div class="input-group">
                <span class="input-group-addon">
                  <img src="/catalog/language/en-gb/en-gb.png">
                </span>
                <textarea type="text" name="eng_about_me"  placeholder="<?php echo $entry_about_me; ?>" class="form-control"><?php echo $eng_about_me; ?></textarea>
              </div>
          </div>


            <div class="form-group required">
                <label class="" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" autocomplete="off" />
                    <?php if ($error_password) { ?>
                      <div class="text-danger"><?php echo $error_password; ?></div>
                    <?php  } ?>
            </div>
            <div class="form-group required">
                <label class="" for="input-confirm"><?php echo $entry_confirm; ?></label>
                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" autocomplete="off" id="input-confirm" class="form-control" />
                    <?php if ($error_confirm) { ?>
                      <div class="text-danger"><?php echo $error_confirm; ?></div>
                    <?php  } ?>
             </div>

           <div class="form-group">
                <label class="col-sm-2"><?php echo $entry_profile_image; ?></label>
                <div class="col-sm-10">
                  <div href="" id="thumb-image"  class="img-thumbnail">
                    <img src="<?php echo $thumb; ?>" alt="" title="" />
                  </div>
                  <input type="file" name="avatar" value="<?php echo $avatar; ?>"/>
                </div>
            </div>

          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      </div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">

  let is_expert = "<?=$is_expert?>";

  if (is_expert == 1) {
    $("#form_group_workplace").addClass("hidden");
    
  } else {
    $("#form_group_interests").addClass("hidden");
    $("#form_group_social_link").addClass("hidden");
    $("#form_group_organozation").addClass("hidden");
    $("#form_group_about_me").addClass("hidden");
  }

// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
