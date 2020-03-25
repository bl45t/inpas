<?php
/* All rights reserved belong to the module, the module developers https://opencartadmin.com */
// https://opencartadmin.com © 2011-2019 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ControllerDatafixDatafixlib', false)) {
class ControllerDatafixDatafixlib extends Controller {
	protected $data;

	public function __construct($registry) {
		parent::__construct($registry);
		if (version_compare(phpversion(), '5.3.0', '<') == true) {
			exit('PHP5.3+ Required');
		}

        if (is_object($this->model_datafix_datafix)) {
			if (!$this->config->get('datafix_datafix_settings')) {
				$this->data['datafix_settings'] = $this->model_datafix_datafix->getSetting('datafix_settings');
				$this->config->set('datafix_datafix_settings', $this->data['datafix_settings']);
			} else {
				$this->data['datafix_settings'] = $this->config->get('datafix_datafix_settings');
			}
        }

		if (isset($this->data['datafix_settings']) && $this->data['datafix_settings']['status']) {
			if (isset($this->data['datafix_settings']['datafix_two_status']) && $this->data['datafix_settings']['datafix_two_status']) {
				$_SERVER['REQUEST_URI'] = preg_replace('/(?<!^[http:]|[https:])[\/]{2,}/', '/', trim($_SERVER['REQUEST_URI']));
			}
			$datafix_vars = explode(PHP_EOL, $this->data['datafix_settings']['datafix_vars']);
			foreach ($this->request->get as $datafix_key => $datafix_value) {
				if ($datafix_key == 'path') {
			        $datafix_pathes = explode('_',$datafix_value);
			        $datafix_path = array();
			        foreach ($datafix_pathes as $df_value)
			            if ((int)$df_value > 0) {
			                $datafix_path[] = (int)$df_value;
			        } else {
			            unset($this->request->get[$datafix_key]);
			            break;
			        }
			        $this->request->get[$datafix_key] = implode('_',$datafix_path);
			    }
				foreach ($datafix_vars as $datafix_vars_key => $datafix_vars_value) {
					if (trim($datafix_key) == trim($datafix_vars_value)) {
						if ((int)$datafix_value > -1) {
							$this->request->get[$datafix_key] = (int)$datafix_value;
						} else {
							unset($this->request->get[$datafix_key]);
						}
					}
				}
			}
		}
	}

}
}