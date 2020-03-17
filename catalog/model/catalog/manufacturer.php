<?php
class ModelCatalogManufacturer extends Model {

	public function addManufacturer($data) {
		$curCode = $this->language->get('code');
		
    	$front_language_id = $curCode === 'ru' ? 1 : 2;

		$data['name'] = $data['manufacturer_description'][$front_language_id ]['name'];
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "', id_country = ". $this->db->escape($data['id_country']) .", id_region = ". $this->db->escape($data['id_region']) .", created = ".time());

		$manufacturer_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "manufacturer SET image = '" . $this->db->escape($data['image']) . "' WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");
		}

		if (isset($data['status'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "manufacturer SET status = '" . $this->db->escape($data['status']) . "' WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");
		}

		foreach ($data['manufacturer_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer_description SET manufacturer_id = '" . (int)$manufacturer_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', city = '".$this->db->escape($value['city'])."', phone = '".$this->db->escape($value['phone'])."', fax = '".$this->db->escape($value['fax'])."', email = '".$this->db->escape($value['email'])."', address = '".$this->db->escape($value['address'])."', post_code = '".$this->db->escape($value['post_code'])."', site_address = '".$this->db->escape($value['site_address'])."', description = '" . $this->db->escape($value['description']) . "', educational_program = '" . $this->db->escape($value['educational_program']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['manufacturer_store'])) {
			foreach ($data['manufacturer_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer_to_store SET manufacturer_id = '" . (int)$manufacturer_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}



		$this->cache->delete('manufacturer');

		return $manufacturer_id;
	}

	public function getManufacturer($manufacturer_id) {
		$query = $this->db->query("SELECT DISTINCT *, md.name AS name FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' && m.manufacturer_id = '" . (int)$manufacturer_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row;
	}

	public function getManufacturers($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' && m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

			$sort_data = array(
				'name',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY md.name";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$manufacturer_data = $this->cache->get('manufacturer.' . (int)$this->config->get('config_language_id').'.'. (int)$this->config->get('config_store_id'));

			if (!$manufacturer_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' && m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY md.name");

				$manufacturer_data = $query->rows;

				$this->cache->set('manufacturer.' . (int)$this->config->get('config_language_id') . '.'. (int)$this->config->get('config_store_id'), $manufacturer_data);
			}

			return $manufacturer_data;
		}
	}
}