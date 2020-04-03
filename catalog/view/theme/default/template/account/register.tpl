<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row reg_m"><?php echo $column_left; ?>
    <div class="form_group">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="header1"><?php echo $heading_title; ?></div>

      <div class="row type_user">
        <?php
          $expertActiveClass = '';
          $userActiveClass = '';

          if ($is_expert == 1) {
            $expertActiveClass = 'activeUser';
          } else if ($is_expert == 0) {
            $userActiveClass = 'activeUser';
          }
        ?>
          <button class="button1 user1 <?=$expertActiveClass?>" data-role="role_expert"><?=$text_expert?></button>
          <button class="button1 user1 <?=$userActiveClass?>" data-role="role_user"><?=$text_user?></button>
      </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <?php
            $valExpField = isset($is_expert) ? $is_expert : 0;
        ?>
          <input id="is_expert_input" type="hidden" name="is_expert" value="<?=$valExpField?>">

        <fieldset id="account">

          <div class="form-group hidden" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
            <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
            <div class="col-sm-10">
              <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } else { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
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

          <div id="form_group_degree" class="form-group hidden">
             <label class="" for="input-degree"><?php echo $entry_degree; ?></label>
			       <div class="input-group">
				      <span class="input-group-addon">
	            	<img src="/catalog/language/ru-ru/ru-ru.png">
	            </span>
              	<input type="text" name="degree" value="<?php echo $degree; ?>" placeholder="<?php echo $entry_degree; ?>" id="input-degree" class="form-control" />
            </div>
            <div class="input-group">
				      <span class="input-group-addon">
	            	<img src="/catalog/language/en-gb/en-gb.png">
	            </span>
	            <input type="text" name="eng_degree" value="<?php echo $eng_degree; ?>" placeholder="<?php echo $entry_degree; ?>" class="form-control" />
           	</div>
          </div>

          <div id="form_group_interests" class="form-group hidden">
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

          <div id="form_group_social_link" class="form-group hidden">
            <label class="" for="input-social-link"><?php echo $entry_social_link; ?></label>
            <input type="text" name="social_link" value="<?php echo $social_link; ?>" placeholder="<?php echo $entry_social_link; ?>" id="input-social-link" class="form-control" />
          </div>

          <div id="form_group_organozation" class="form-group hidden">
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

          <div id="form_group_not_exist_org" class="form-group hidden">
            <label class="" for="input-empty-org"><?=$text_not_exist_organization?></label>
            <input id="input-empty-org" name="is_exist_org" type="checkbox" class="form-check-input">
          </div>

          <fieldset id="newOrganization" class="hidden">

            <div class="form-group">
              <label class="required" for="input-ogr-name"><?php echo $entry_name_org; ?></label>
              <input type="text" name="new_organization_name" value="<?php echo $new_organization_name; ?>" placeholder="<?php echo $entry_name_org; ?>" id="input-ogr-name" class="form-control" />
              <?php if ($error_new_organization_name) { ?>
                <div class="text-danger"><?php echo $error_new_organization_name; ?></div>
              <?php } ?>
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-address"><?php echo $entry_org_address; ?></label>
              <input type="text" name="new_organization_address" value="<?php echo $new_organization_address; ?>" placeholder="<?php echo $entry_org_address; ?>" id="input-ogr-address" class="form-control" />
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-post-code"><?php echo $entry_post_code; ?></label>
              <input type="text" name="new_organization_post_code" value="<?php echo $new_organization_post_code; ?>" placeholder="<?php echo $entry_post_code; ?>" id="input-ogr-post-code" class="form-control" />
            </div>

            <div class="form-group">
            <label class="" for="input-new-org-country"><?php echo $entry_org_country; ?></label>
              <select id="new_org_country_select" name="new_organization_country_id" id="input-new-org-country" class="form-control">
                <option value="0"><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $new_organization_country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name'];?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>

            <div class="form-group">
              <label class="" for="input-org-region"><?php echo $entry_org_zone; ?></label>
                <select id="new_org_region_select" name="new_organization_region_id" id="input-org-region" class="form-control">
                  <option value="0"><?=$text_select?></option>
                </select>
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-city"><?php echo $entry_org_city; ?></label>
              <input type="text" name="new_organization_city" value="<?php echo $new_organization_city; ?>" placeholder="<?php echo $entry_org_city; ?>" id="input-ogr-city" class="form-control" />
            </div>

            <div class="form-group">
              <label class="required" for="input-ogr-phone"><?php echo $entry_org_phone; ?></label>
              <input type="text" name="new_organization_phone" value="<?php echo $new_organization_phone; ?>" placeholder="<?php echo $entry_org_phone; ?>" id="input-ogr-phone" class="form-control" />
              <?php if ($error_new_organization_phone) { ?>
                <div class="text-danger"><?php echo $error_new_organization_phone; ?></div>
              <?php } ?>
            </div>

            <div class="form-group">
              <label class="required" for="input-ogr-email"><?php echo $entry_org_email; ?></label>
              <input type="text" name="new_organization_email" value="<?php echo $new_organization_email; ?>" placeholder="<?php echo $entry_org_email; ?>" id="input-ogr-email" class="form-control" />
              <?php if ($error_new_organization_email) { ?>
                <div class="text-danger"><?php echo $error_new_organization_email; ?></div>
              <?php } ?>
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-fax"><?php echo $entry_org_fax; ?></label>
              <input type="text" name="new_organization_fax" value="<?php echo $new_organization_fax; ?>" placeholder="<?php echo $entry_org_fax; ?>" id="input-ogr-fax" class="form-control" />
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-site"><?php echo $entry_org_site; ?></label>
              <input type="text" name="new_organization_site" value="<?php echo $new_organization_site; ?>" placeholder="<?php echo $entry_org_site; ?>" id="input-ogr-site" class="form-control" />
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-description"><?php echo $entry_description_org; ?></label>
              <textarea name="new_organization_description" placeholder="<?php echo $entry_description_org; ?>" id="input-ogr-description" class="form-control"><?php echo $new_organization_description; ?></textarea>
            </div>

            <div class="form-group">
              <label class="" for="input-ogr-educational-program"><?php echo $entry_educational_program_org; ?></label>
              <textarea name="new_organization_educational_program" placeholder="<?php echo $entry_educational_program_org; ?>" id="input-ogr-educational-program" class="form-control"><?php echo $new_organization_educational_program; ?></textarea>
            </div>

          </fieldset>

          <div id="form_group_about_me" class="form-group hidden">
              <label class="" for="input-about-me"><?php echo $entry_about_me; ?></label>
              <div class="input-group">
                <span class="input-group-addon">
                <img src="/catalog/language/ru-ru/ru-ru.png">
              </span>
                <textarea name="about_me" placeholder="<?php echo $entry_about_me; ?>" id="input-about-me" class="form-control"><?php echo $about_me; ?></textarea>
              </div>
              <div class="input-group">
                <span class="input-group-addon">
                  <img src="/catalog/language/en-gb/en-gb.png">
                </span>
                <textarea name="eng_about_me"  placeholder="<?php echo $entry_about_me; ?>" class="form-control"><?php echo $eng_about_me; ?></textarea>
              </div>
          </div>

          <div class="form-group hidden">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>

          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
        <fieldset id="address" class="hidden">
          <legend><?php echo $text_your_address; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
            </div>
          </div>
          <div class="form-group ">
            <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              <?php if ($error_address_1) { ?>
              <div class="text-danger"><?php echo $error_address_1; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
            </div>
          </div>
          <div class="form-group ">
            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
              <?php if ($error_city) { ?>
              <div class="text-danger"><?php echo $error_city; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group ">
            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
              <?php if ($error_postcode) { ?>
              <div class="text-danger"><?php echo $error_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group ">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <div class="text-danger"><?php echo $error_country; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group ">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-zone" class="form-control">
                <option value=""></option>
              </select>
              <?php if ($error_zone) { ?>
              <div class="text-danger"><?php echo $error_zone; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
        <fieldset>
          <div class="form-group ">
              <label class="required" for="input-password"><?php echo $entry_password; ?></label>

              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>

          </div>
          <div class="form-group ">
              <label class="required" for="input-confirm"><?php echo $entry_confirm; ?></label>

              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>

          </div>
        </fieldset>
        <fieldset class="hidden">
          <legend><?php echo $text_newsletter; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
            <div class="col-sm-10">
              <?php if ($newsletter) { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" checked="checked" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" />
                <?php echo $text_no; ?></label>
              <?php } else { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" checked="checked" />
                <?php echo $text_no; ?></label>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <?php echo $captcha; ?>
        <?php if ($text_agree) { ?>
        <div class="buttons">
          <div class="pull-right"><?php echo $text_agree; ?>
            <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="agree" value="1" />
            <?php } ?>
            &nbsp;
            <div class="row">
              <div class="pull-right">
                <input class="login button_reg" type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
              </div>
            </div>
          </div>
        </div>
        <?php } else { ?>
        <div class="buttons">
          <div class="pull-right">
            <input class="login button_reg" type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
        <?php } ?>
      </form>
      </div>
    <?php echo $column_right; ?></div>
    </div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
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

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('#new_org_country_select').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#new_org_country_select').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $new_organization_region_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#new_org_region_select').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#new_org_country_select').trigger('change');

$('.type_user button').click(function() {
  $('.type_user').find('.activeUser').removeClass('activeUser');
  $(this).addClass('activeUser');

  let userRole = $(this).attr('data-role');

  if (userRole === 'role_expert') {
    $("#is_expert_input").val(1);
    getExpertRegistrationFormState();
  } else if (userRole === 'role_user') {
    $("#is_expert_input").val(0);
    getUserRegistrationFormState();
  }

});

  let userRole = $("#is_expert_input").val();
  let expert = 1;
  let user = 0;

  if (userRole == expert) {
    getExpertRegistrationFormState();
  } else if (userRole == user) {
    getUserRegistrationFormState();
  }

  function getExpertRegistrationFormState() {
    $("#form_group_workplace").addClass('hidden');
    $("#form_group_degree").removeClass('hidden');
    $("#form_group_social_link").removeClass('hidden');
    $("#form_group_interests").removeClass('hidden');
    $("#form_group_organozation").removeClass('hidden');
    $("#form_group_not_exist_org").removeClass('hidden');
    $("#form_group_about_me").removeClass('hidden');
    $("#form_group_post label").addClass('required');
    $('input[name="customer_group_id"][value="2"]').prop('checked', true);
  }

  function getUserRegistrationFormState() {
    $("#form_group_workplace").removeClass('hidden');
    $("#form_group_degree").addClass('hidden');
    $("#form_group_social_link").addClass('hidden');
    $("#form_group_interests").addClass('hidden');
    $("#form_group_organozation").addClass('hidden');
    $("#form_group_not_exist_org").addClass('hidden');
     $("#form_group_about_me").addClass('hidden');
    $("#form_group_post label").removeClass('required');
    $("#input-empty-org").removeAttr('checked');
    $("#input-empty-org").trigger('change');
     $('input[name="customer_group_id"][value="1"]').prop('checked', true);
  }

  $("#form_group_not_exist_org #input-empty-org").change(function() {
    if ($(this).is(':checked') == true) {
        $("#newOrganization").removeClass('hidden');
        $("#input-id-organization option[value='0']").prop('selected', true);
    } else {
        $("#newOrganization").addClass('hidden');
    }
  });

  $("#input-id-organization").change(function(){
    let curVal = $(this).val();

    if (curVal != 0) {
      $("#input-empty-org").prop('checked', false);
      $("#input-empty-org").trigger('change');
    }

  });

  let is_checked_new_org = "<?=$is_checked_new_org?>";

  if (is_checked_new_org == 1) {
    $("#input-empty-org").attr('checked', 'checked');
    $("#input-empty-org").trigger('change');
  }

  //Транслитерация полей в зависимости от текущей локали
  let curLang = "<?=$cur_lang?>";

  if (curLang == 'ru') {
    handleInputRusToEng('firstname', 'eng_firstname');
    handleInputRusToEng('lastname', 'eng_lastname');
    handleInputRusToEng('middlename', 'eng_middlename');
    handleInputRusToEng('post', 'eng_post');
    handleInputRusToEng('workplace', 'eng_workplace');
    handleInputRusToEng('degree', 'eng_degree');
    handleInputRusToEng('field_of_interest', 'eng_field_of_interest');
  } else if (curLang == 'en') {
    handleInputEngToRus('firstname', 'eng_firstname');
    handleInputEngToRus('lastname', 'eng_lastname');
    handleInputEngToRus('middlename', 'eng_middlename');
    handleInputEngToRus('post', 'eng_post');
    handleInputEngToRus('workplace', 'eng_workplace');
    handleInputEngToRus('degree', 'eng_degree');
    handleInputEngToRus('field_of_interest', 'eng_field_of_interest');
  }

//--></script>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
