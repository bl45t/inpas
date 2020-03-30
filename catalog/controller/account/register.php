<?php
class ControllerAccountRegister extends Controller {
	private $error = array();

	const RU = 1;
	const EN = 2;

	public function index() {
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$this->load->language('account/register');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/customer');

		$curLang = $this->language->get('code');

		$data['cur_lang'] = $curLang;

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			//Создаем новую организацию
			if (isset($this->request->post['is_exist_org']) && $this->request->post['is_exist_org'] == 'on') {
				$arNewOrg = [];
				$id_country = (empty(trim($this->request->post['new_organization_country_id']))) ? 0 : $this->request->post['new_organization_country_id'];
				$id_region = (empty(trim($this->request->post['new_organization_region_id']))) ? 0 : $this->request->post['new_organization_region_id']; 
				$arNewOrg['id_country'] = $id_country;
				$arNewOrg['id_region'] = $id_region;

				$arNewOrg['sort_order'] = 0;
				$arNewOrg['status'] = 0;

				if ($curLang === 'ru') {
					$arNewOrg['manufacturer_description'] = $this->manufacturerDescriptionForRus($this->request->post);
				} else if ($curLang === 'en') {
					$arNewOrg['manufacturer_description'] = $this->manufacturerDescriptionForEng($this->request->post);
				} else {
					$arNewOrg['manufacturer_description'] = $this->manufacturerDescriptionForRus($this->request->post);
				}

				$this->load->model('catalog/manufacturer');

				$idNewOrg = $this->model_catalog_manufacturer->addManufacturer($arNewOrg);

				$this->request->post['id_organization'] = $idNewOrg;
			}


			$customer_id = $this->model_account_customer->addCustomer($this->request->post);

			// Clear any previous login attempts for unregistered accounts.
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $customer_id,
					'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
				);

				$this->model_account_activity->addActivity('register', $activity_data);
			}

			$this->response->redirect($this->url->link('account/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/register', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', true));
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_your_address'] = $this->language->get('text_your_address');
		$data['text_your_password'] = $this->language->get('text_your_password');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_user'] = $this->language->get('text_user');
		$data['text_expert'] = $this->language->get('text_expert');
		$data['text_not_exist_organization'] = $this->language->get('text_not_exist_organization');
		
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_middlename'] = $this->language->get('entry_middlename');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_post'] = $this->language->get('entry_post');
		$data['entry_workplace'] = $this->language->get('entry_workplace');
		$data['entry_social_link'] = $this->language->get('entry_social_link');
		$data['entry_interests'] = $this->language->get('entry_interests');
		$data['entry_organization'] = $this->language->get('entry_organization');
		$data['entry_name_org'] = $this->language->get('entry_name_org');
		$data['entry_org_address'] = $this->language->get('entry_org_address');
		$data['entry_post_code'] = $this->language->get('entry_post_code');
		$data['entry_org_city'] = $this->language->get('entry_org_city');
		$data['entry_org_country'] = $this->language->get('entry_org_country');
		$data['entry_org_phone'] = $this->language->get('entry_org_phone');
		$data['entry_org_email'] = $this->language->get('entry_org_email');
		$data['entry_org_fax'] = $this->language->get('entry_org_fax');
		$data['entry_org_site'] = $this->language->get('entry_org_site');
		$data['entry_org_zone'] = $this->language->get('entry_org_zone');
		$data['entry_about_me'] = $this->language->get('entry_about_me');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_upload'] = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}


		if (isset($this->error['post'])) {
			$data['error_post'] = $this->error['post'];
		} else {
			$data['error_post'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['new_organization_name'])) {
			$data['error_new_organization_name'] = $this->error['new_organization_name'];
		} else {
			$data['error_new_organization_name'] = '';
		}

		if (isset($this->error['new_organization_phone'])) {
			$data['error_new_organization_phone'] = $this->error['new_organization_phone'];
		} else {
			$data['error_new_organization_phone'] = '';
		}

		if (isset($this->error['new_organization_email'])) {
			$data['error_new_organization_email'] = $this->error['new_organization_email'];
		} else {
			$data['error_new_organization_email'] = '';
		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}

		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		$data['action'] = $this->url->link('account/register', '', true);

		$data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}
		
		if (isset($this->request->post['new_organization_name'])) {
			$data['new_organization_name'] = $this->request->post['new_organization_name'];
		} else {
			$data['new_organization_name'] = '';
		}

		if (isset($this->request->post['new_organization_address'])) {
			$data['new_organization_address'] = $this->request->post['new_organization_address'];
		} else {
			$data['new_organization_address'] = '';
		}

		if (isset($this->request->post['new_organization_post_code'])) {
			$data['new_organization_post_code'] = $this->request->post['new_organization_post_code'];
		} else {
			$data['new_organization_post_code'] = '';
		}

		if (isset($this->request->post['new_organization_city'])) {
			$data['new_organization_city'] = $this->request->post['new_organization_city'];
		} else {
			$data['new_organization_city'] = '';
		}

		if (isset($this->request->post['new_organization_country_id'])) {
			$data['new_organization_country_id'] = $this->request->post['new_organization_country_id'];
		} else {
			$data['new_organization_country_id'] = '';
		}
		
		if (isset($this->request->post['new_organization_region_id'])) {
			$data['new_organization_region_id'] = $this->request->post['new_organization_region_id'];
		} else {
			$data['new_organization_region_id'] = '';
		}
		
		if (isset($this->request->post['new_organization_phone'])) {
			$data['new_organization_phone'] = $this->request->post['new_organization_phone'];
		} else {
			$data['new_organization_phone'] = '';
		}

		if (isset($this->request->post['new_organization_email'])) {
			$data['new_organization_email'] = $this->request->post['new_organization_email'];
		} else {
			$data['new_organization_email'] = '';
		}
		
		if (isset($this->request->post['new_organization_fax'])) {
			$data['new_organization_fax'] = $this->request->post['new_organization_fax'];
		} else {
			$data['new_organization_fax'] = '';
		}

		if (isset($this->request->post['new_organization_site'])) {
			$data['new_organization_site'] = $this->request->post['new_organization_site'];
		} else {
			$data['new_organization_site'] = '';
		}

		if (isset($this->request->post['customer_group_id'])) {
			$data['customer_group_id'] = $this->request->post['customer_group_id'];
		} else {
			$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['eng_firstname'])) {
			$data['eng_firstname'] = $this->request->post['eng_firstname'];
		} else {
			$data['eng_firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['eng_lastname'])) {
			$data['eng_lastname'] = $this->request->post['eng_lastname'];
		} else {
			$data['eng_lastname'] = '';
		}

		if (isset($this->request->post['middlename'])) {
			$data['middlename'] = $this->request->post['middlename'];
		} else {
			$data['middlename'] = '';
		}

		if (isset($this->request->post['eng_middlename'])) {
			$data['eng_middlename'] = $this->request->post['eng_middlename'];
		} else {
			$data['eng_middlename'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->request->post['is_expert'])) {
			$data['is_expert'] = $this->request->post['is_expert'];
		} else {
			$data['is_expert'] = 0;
		}

		if (isset($this->request->post['workplace'])) {
			$data['workplace'] = $this->request->post['workplace'];
		} else {
			$data['workplace'] = '';
		}

		if (isset($this->request->post['eng_workplace'])) {
			$data['eng_workplace'] = $this->request->post['eng_workplace'];
		} else {
			$data['eng_workplace'] = '';
		}

		if (isset($this->request->post['post'])) {
			$data['post'] = $this->request->post['post'];
		} else {
			$data['post'] = '';
		}

		if (isset($this->request->post['eng_post'])) {
			$data['eng_post'] = $this->request->post['eng_post'];
		} else {
			$data['eng_post'] = '';
		}

		if (isset($this->request->post['social_link'])) {
			$data['social_link'] = $this->request->post['social_link'];
		} else {
			$data['social_link'] = '';
		}

		if (isset($this->request->post['field_of_interest'])) {
			$data['field_of_interest'] = $this->request->post['field_of_interest'];
		} else {
			$data['field_of_interest'] = '';
		}

		if (isset($this->request->post['eng_field_of_interest'])) {
			$data['eng_field_of_interest'] = $this->request->post['eng_field_of_interest'];
		} else {
			$data['eng_field_of_interest'] = '';
		}

		if (isset($this->request->post['about_me'])) {
			$data['about_me'] = $this->request->post['about_me'];
		} else {
			$data['about_me'] = '';
		}

		if (isset($this->request->post['eng_about_me'])) {
			$data['eng_about_me'] = $this->request->post['eng_about_me'];
		} else {
			$data['eng_about_me'] = '';
		}

		if (isset($this->request->post['id_organization'])) {
			$data['id_organization'] = $this->request->post['id_organization'];
		} else {
			$data['id_organization'] = 0;
		}

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} else {
			$data['fax'] = '';
		}

		if (isset($this->request->post['company'])) {
			$data['company'] = $this->request->post['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = (int)$this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = (int)$this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		if (isset($this->request->post['is_expert'] ) && $this->request->post['is_expert'] == 1 && isset($this->request->post['is_exist_org']) && $this->request->post['is_exist_org'] == 'on') {
			$data['is_checked_new_org'] = 1;
		} else {
			$data['is_checked_new_org'] = 0;
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		$this->load->model('catalog/manufacturer');

		$data['organizations'] = $this->model_catalog_manufacturer->getManufacturers();

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

		if (isset($this->request->post['custom_field'])) {
			if (isset($this->request->post['custom_field']['account'])) {
				$account_custom_field = $this->request->post['custom_field']['account'];
			} else {
				$account_custom_field = array();
			}

			if (isset($this->request->post['custom_field']['address'])) {
				$address_custom_field = $this->request->post['custom_field']['address'];
			} else {
				$address_custom_field = array();
			}

			$data['register_custom_field'] = $account_custom_field + $address_custom_field;
		} else {
			$data['register_custom_field'] = array();
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$data['newsletter'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		if (isset($this->request->post['agree'])) {
			$data['agree'] = $this->request->post['agree'];
		} else {
			$data['agree'] = false;
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/register', $data));
	}

	private function validate() {
		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['eng_firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32) || (utf8_strlen(trim($this->request->post['eng_firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['eng_lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32) || (utf8_strlen(trim($this->request->post['eng_lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->request->post['is_expert'] == 1 && (
			(utf8_strlen(trim($this->request->post['post'])) < 1) || 
			(utf8_strlen(trim($this->request->post['eng_post'])) < 1) || 
			(utf8_strlen(trim($this->request->post['post'])) > 128) || 
			(utf8_strlen(trim($this->request->post['eng_post'])) > 128))){
			$this->error['post'] = $this->language->get('error_post');
		}

		if (isset($this->request->post['is_exist_org']) &&
			$this->request->post['is_exist_org'] == 'on' && (
			(utf8_strlen(trim($this->request->post['new_organization_name'])) < 1) ||
			(utf8_strlen(trim($this->request->post['new_organization_name'])) > 64))) {
			$this->error['new_organization_name'] = $this->language->get('error_new_organization_name');
		}

		if (isset($this->request->post['is_exist_org']) &&
			$this->request->post['is_exist_org'] == 'on' && (
			(utf8_strlen(trim($this->request->post['new_organization_phone'])) < 6) ||
			(utf8_strlen(trim($this->request->post['new_organization_phone'])) > 20))) {
			$this->error['new_organization_phone'] = $this->language->get('error_new_organization_phone');
		}

		if (isset($this->request->post['is_exist_org']) &&
			$this->request->post['is_exist_org'] == 'on' && (
			(utf8_strlen($this->request->post['new_organization_email']) > 96) || 
			!preg_match($this->config->get('config_mail_regexp'), $this->request->post['new_organization_email']))) {
			$this->error['new_organization_email'] = $this->language->get('error_new_organization_email');
		}

		
		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		// Customer Group
		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->post['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
            if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
            	$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
            }
		}

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		// Agree to terms
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		return !$this->error;
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	private function manufacturerDescriptionForRus($arData) {
		$result = [];

		$result[self::RU]['name'] = $arData['new_organization_name'];
		$result[self::EN]['name'] = $this->translitToEng($arData['new_organization_name']);

		$result[self::RU]['city'] = $arData['new_organization_city'];
		$result[self::EN]['city'] = $this->translitToEng($arData['new_organization_city']);

		$result[self::RU]['phone'] = $arData['new_organization_phone'];
		$result[self::EN]['phone'] = $arData['new_organization_phone'];

		$result[self::RU]['email'] = $arData['new_organization_email'];
		$result[self::EN]['email'] = $arData['new_organization_email'];

		$result[self::RU]['fax'] = $arData['new_organization_fax'];
		$result[self::EN]['fax'] = $arData['new_organization_fax'];

		$result[self::RU]['address'] = $arData['new_organization_address'];
		$result[self::EN]['address'] = $this->translitToEng($arData['new_organization_address']);

		$result[self::RU]['post_code'] = $arData['new_organization_post_code'];
		$result[self::EN]['post_code'] = $arData['new_organization_post_code'];

		$result[self::RU]['site_address'] = $arData['new_organization_site'];
		$result[self::EN]['site_address'] = $arData['new_organization_site'];

		$result[self::RU]['description'] = '';
		$result[self::EN]['description'] = '';

		$result[self::RU]['educational_program'] = '';
		$result[self::EN]['educational_program'] = '';

		$result[self::RU]['meta_title'] = '';
		$result[self::EN]['meta_title'] = '';

		$result[self::RU]['meta_h1'] = '';
		$result[self::EN]['meta_h1'] = '';

		$result[self::RU]['meta_description'] = '';
		$result[self::EN]['meta_description'] = '';

		$result[self::RU]['meta_keyword'] = '';
		$result[self::EN]['meta_keyword'] = '';

		return $result;
	} 

	private function manufacturerDescriptionForEng($arData) {
		$result = [];

		$result[self::RU]['name'] = $this->translitToRus($arData['new_organization_name']);
		$result[self::EN]['name'] = $arData['new_organization_name'];

		$result[self::RU]['city'] = $this->translitToRus($arData['new_organization_city']);
		$result[self::EN]['city'] = $arData['new_organization_city'];

		$result[self::RU]['phone'] = $arData['new_organization_phone'];
		$result[self::EN]['phone'] = $arData['new_organization_phone'];

		$result[self::RU]['email'] = $arData['new_organization_email'];
		$result[self::EN]['email'] = $arData['new_organization_email'];

		$result[self::RU]['fax'] = $arData['new_organization_fax'];
		$result[self::EN]['fax'] = $arData['new_organization_fax'];

		$result[self::RU]['address'] = $this->translitToRus($arData['new_organization_address']);
		$result[self::EN]['address'] = $arData['new_organization_address'];

		$result[self::RU]['post_code'] = $arData['new_organization_post_code'];
		$result[self::EN]['post_code'] = $arData['new_organization_post_code'];

		$result[self::RU]['site_address'] = $arData['new_organization_site'];
		$result[self::EN]['site_address'] = $arData['new_organization_site'];

		$result[self::RU]['description'] = '';
		$result[self::EN]['description'] = '';

		$result[self::RU]['educational_program'] = '';
		$result[self::EN]['educational_program'] = '';

		$result[self::RU]['meta_title'] = '';
		$result[self::EN]['meta_title'] = '';

		$result[self::RU]['meta_h1'] = '';
		$result[self::EN]['meta_h1'] = '';

		$result[self::RU]['meta_description'] = '';
		$result[self::EN]['meta_description'] = '';

		$result[self::RU]['meta_keyword'] = '';
		$result[self::EN]['meta_keyword'] = '';

		return $result;
	}

	private function translitToRus($string) {
		$cyr=array(
		     "Щ", "Ш", "Ч","Ц", "Ю", "Я", "Ж","А","Б","В",
		     "Г","Д","Е","Ё","З","И","Й","К","Л","М","Н",
		     "О","П","Р","С","Т","У","Ф","Х","Ь","Ы","Ъ",
		     "Э","Є", "Ї","І",
		     "щ", "ш", "ч","ц", "ю", "я", "ж","а","б","в",
		     "г","д","е","ё","з","и","й","к","л","м","н",
		     "о","п","р","с","т","у","ф","х","ь","ы","ъ",
		     "э","є", "ї","і"
		  );
		  $lat=array(
		     "Shch","Sh","Ch","C","Yu","Ya","J","A","B","V",
		     "G","D","E","E","Z","I","y","K","L","M","N",
		     "O","P","R","S","T","U","F","H","", 
		     "Y","" ,"E","E","Yi","I",
		     "shch","sh","ch","c","Yu","Ya","j","a","b","v",
		     "g","d","e","e","z","i","y","k","l","m","n",
		     "o","p","r","s","t","u","f","h",
		     "", "y","" ,"e","e","yi","i"
		  );
		$string = str_replace($lat,$cyr,$string);

		return $string;
	}

	private function translitToEng($string) {
        $rus = [
            'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я',
            'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'
        ];
        $lat = [
            'A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'H', 'C', 'Ch', 'Sh', 'Shch', 'Y', 'Y', 'Y', 'E', 'Yu', 'Ya',
            'a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh', 'shch', 'y', 'y', 'y', 'e', 'yu', 'ya'
        ];
        return str_replace($rus, $lat, $string);
	}

}