<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// https://opencartadmin.com © 2011-2019 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ControllerExtensionModuleDatafix', false)) {
	class ControllerExtensionModuleDatafix extends Controller {
		private $error = array();
		public function __construct($registry) {
			parent::__construct($registry);
			$this->load->model('datafix/datafix');
		}
		public function index() {
				$this->model_datafix_datafix->control('datafix/datafix');
				$this->controller_datafix_datafix->index($this->registry);
		}
		public function uninstall() {
			if ($this->validate()) {
				$this->model_datafix_datafix->control('datafix/datafix');
				$this->controller_datafix_datafix->uninstall($this->registry);
			}
		}
		public function install() {
			$this->model_datafix_datafix->control('datafix/datafix');
			$this->controller_datafix_datafix->install($this->registry);
		}
		protected function validate() {
			if (!$this->user->hasPermission('modify', 'extension/module/datafix')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			return !$this->error;
		}
 	}
}
