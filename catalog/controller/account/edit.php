<?php
class ControllerAccountEdit extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/edit', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/edit');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_customer->editCustomer($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('edit', $activity_data);
			}

			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_edit'),
			'href'      => $this->url->link('account/edit', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_additional'] = $this->language->get('text_additional');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_post'] = $this->language->get('entry_post');
		$data['entry_workplace'] = $this->language->get('entry_workplace');
		$data['entry_interests'] = $this->language->get('entry_interests');
		$data['entry_social_link'] = $this->language->get('entry_social_link');
		$data['entry_organization'] = $this->language->get('entry_organization');
		$data['entry_about_me'] = $this->language->get('entry_about_me');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');
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

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['post'])) {
			$data['error_post'] = $this->error['post'];
		} else {
			$data['error_post'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		$data['action'] = $this->url->link('account/edit', '', true);

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['eng_firstname'])) {
			$data['eng_firstname'] = $this->request->post['eng_firstname'];
		} elseif (!empty($customer_info)) {
			$data['eng_firstname'] = $customer_info['eng_firstname'];
		} else {
			$data['eng_firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($customer_info)) {
			$data['lastname'] = $customer_info['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['eng_lastname'])) {
			$data['eng_lastname'] = $this->request->post['eng_lastname'];
		} elseif (!empty($customer_info)) {
			$data['eng_lastname'] = $customer_info['eng_lastname'];
		} else {
			$data['eng_lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} elseif (!empty($customer_info)) {
			$data['fax'] = $customer_info['fax'];
		} else {
			$data['fax'] = '';
		}

		if (isset($this->request->post['post'])) {
			$data['post'] = $this->request->post['post'];
		} elseif (!empty($customer_info)) {
			$data['post'] = $customer_info['post'];
		} else {
			$data['post'] = '';
		}

		if (isset($this->request->post['eng_post'])) {
			$data['eng_post'] = $this->request->post['eng_post'];
		} elseif (!empty($customer_info)) {
			$data['eng_post'] = $customer_info['eng_post'];
		} else {
			$data['eng_post'] = '';
		}

		if (isset($this->request->post['workplace'])) {
			$data['workplace'] = $this->request->post['workplace'];
		} elseif (!empty($customer_info)) {
			$data['workplace'] = $customer_info['workplace'];
		} else {
			$data['workplace'] = '';
		}

		if (isset($this->request->post['eng_workplace'])) {
			$data['eng_workplace'] = $this->request->post['eng_workplace'];
		} elseif (!empty($customer_info)) {
			$data['eng_workplace'] = $customer_info['eng_workplace'];
		} else {
			$data['eng_workplace'] = '';
		}

		if (isset($this->request->post['social_link'])) {
			$data['social_link'] = $this->request->post['social_link'];
		} elseif (!empty($customer_info)) {
			$data['social_link'] = $customer_info['social_link'];
		} else {
			$data['social_link'] = '';
		}

		if (isset($this->request->post['field_of_interest'])) {
			$data['field_of_interest'] = $this->request->post['field_of_interest'];
		} elseif (!empty($customer_info)) {
			$data['field_of_interest'] = $customer_info['field_of_interest'];
		} else {
			$data['field_of_interest'] = '';
		}

		if (isset($this->request->post['eng_field_of_interest'])) {
			$data['eng_field_of_interest'] = $this->request->post['eng_field_of_interest'];
		} elseif (!empty($customer_info)) {
			$data['eng_field_of_interest'] = $customer_info['eng_field_of_interest'];
		} else {
			$data['eng_field_of_interest'] = '';
		}

		if (isset($this->request->post['about_me'])) {
			$data['about_me'] = $this->request->post['about_me'];
		} elseif (!empty($customer_info)) {
			$data['about_me'] = $customer_info['about_me'];
		} else {
			$data['about_me'] = '';
		}

		if (isset($this->request->post['eng_about_me'])) {
			$data['eng_about_me'] = $this->request->post['eng_about_me'];
		} elseif (!empty($customer_info)) {
			$data['eng_about_me'] = $customer_info['eng_about_me'];
		} else {
			$data['eng_about_me'] = '';
		}

		if (isset($this->request->post['id_organization'])) {
			$data['id_organization'] = $this->request->post['id_organization'];
		} elseif (!empty($customer_info)) {
			$data['id_organization'] = $customer_info['id_organization'];
		} else {
			$data['id_organization'] = 0;
		}

		if (isset($this->request->post['is_expert'])) {
			$data['is_expert'] = $this->request->post['is_expert'];
		} elseif (!empty($customer_info)) {
			$data['is_expert'] = $customer_info['is_expert'];
		} else {
			$data['is_expert'] = 0;
		}

		$this->load->model('catalog/manufacturer');

		$data['organizations'] = $this->model_catalog_manufacturer->getManufacturers();

		if ($data['is_expert']) {

			$curOrg = $this->model_catalog_manufacturer->getManufacturer($data['id_organization']);

			if (count($curOrg) && $curOrg['status'] == 0) {
				$data['organizations'][] = $curOrg;
			}
		}

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		if (isset($this->request->post['custom_field'])) {
			$data['account_custom_field'] = $this->request->post['custom_field'];
		} elseif (isset($customer_info)) {
			$data['account_custom_field'] = json_decode($customer_info['custom_field'], true);
		} else {
			$data['account_custom_field'] = array();
		}

		$data['back'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/edit', $data));
	}

	protected function validate() {
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

		if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		foreach ($custom_fields as $custom_field) {
			if (($custom_field['location'] == 'account') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			} elseif (($custom_field['location'] == 'account') && ($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
                $this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
            }
		}

		return !$this->error;
	}
}