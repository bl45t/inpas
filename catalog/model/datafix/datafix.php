<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// https://opencartadmin.com © 2011-2019 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ModelDatafixDatafix', false)) {
class ModelDatafixDatafix extends Model
{
	public function getSettings($store_id = 0) {
		$setting_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting_datafix WHERE store_id = '" . (int)$store_id . "'");

		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$setting_data = $result['value'];
			} else {
				$setting_data = json_decode($result['value'], true);
			}
		   $this->config->set('datafix_' . $result['codekey'] . $store_id, $setting_data);
		}
	}

	public function getSetting($code, $store_id = 0) {
		if (!$this->config->get('datafix_' . $code . $store_id)) {
			$setting_data = array();

			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting_datafix WHERE store_id = '" . (int)$store_id . "' AND `codekey` = '" . $this->db->escape($code) . "'");

			foreach ($query->rows as $result) {
				if (!$result['serialized']) {
					$setting_data = $result['value'];
				} else {
					$setting_data = json_decode($result['value'], true);
				}
			}
	        $this->config->set('datafix_' . $code . $store_id, $setting_data);
			return $setting_data;
		} else {
			return $this->config->get('datafix_' . $code . $store_id);
		}
	}

	public function editSetting($code, $data, $store_id = 0) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "setting_datafix` WHERE store_id = '" . (int)$store_id . "' AND `codekey` = '" . $this->db->escape($code) . "'");

		foreach ($data as $key => $value) {
			if ($code == $key) {
				if (!is_array($value)) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting_datafix SET store_id = '" . (int)$store_id . "', `codekey` = '" . $this->db->escape($code) . "', `value` = '" . $this->db->escape($value) . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting_datafix SET store_id = '" . (int)$store_id . "', `codekey` = '" . $this->db->escape($code) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
				}
			}
		}
	}

	public function deleteSetting($code, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting_datafix WHERE store_id = '" . (int)$store_id . "' AND `codekey` = '" . $this->db->escape($code) . "'");
	}

	public function getSettingValue($key, $store_id = 0) {
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "setting_datafix WHERE store_id = '" . (int)$store_id . "' AND `codekey` = '" . $this->db->escape($key) . "'");

		if ($query->num_rows) {
			return $query->row['value'];
		} else {
			return null;
		}
	}

	public function editSettingValue($code = '', $key = '', $value = '', $store_id = 0) {
		if (!is_array($value)) {
			$this->db->query("UPDATE " . DB_PREFIX . "setting_datafix SET `value` = '" . $this->db->escape($value) . "', serialized = '0'  WHERE `codekey` = '" . $this->db->escape($code) . "' AND store_id = '" . (int)$store_id . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "setting_datafix SET `value` = '" . $this->db->escape(json_encode($value)) . "', serialized = '1' WHERE `codekey` = '" . $this->db->escape($code) . "' AND store_id = '" . (int)$store_id . "'");
		}
	}

	public function cont($cont) {
		$cont = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$cont);
		$file  = DIR_CATALOG . 'controller/' .  $cont . '.php';
		if (file_exists($file)) {
           $this->cont_loading($cont, $file);
		} else {
			$file  = DIR_APPLICATION . 'controller/' . $cont . '.php';
            if (file_exists($file)) {
             	$this->cont_loading($cont, $file);
            }
		}
	}

	public function control($cont) {
		$cont = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$cont);
		$file = DIR_APPLICATION . 'controller/' .  $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
        if (function_exists('modification')) {
        	$file = modification($file);
        }
		if (file_exists($file)) {
			include_once($file);
			$controller_name = 'controller_' . str_replace('/', '_', $cont);
			$this->registry->set($controller_name, new $class($this->registry));
		}
		return $controller_name;
	}

	public function cont_loading ($cont, $file) {
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
	    if (function_exists('modification')) {
	    	$file = modification($file);
	    }
		include_once($file);
		$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
	}


}
}
