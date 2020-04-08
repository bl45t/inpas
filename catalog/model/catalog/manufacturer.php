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
		$query = $this->db->query("
			SELECT md.name as org_name, md.manufacturer_id as manufacturer_id, md.name as name_desc_org, md.city as org_city, md.phone as org_phone, md.email as org_email, md.fax as org_fax, md.address as org_address, md.post_code as org_post_code, md.site_address as org_site_address, md.description as org_description, md.educational_program as org_educational_program, c.name as country_name, z.name as region_name, c.eng_name as country_name_eng, z.eng_name as region_name_eng, m.status
			FROM " . DB_PREFIX . "manufacturer m
			LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id)
			LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id)
			LEFT JOIN ". DB_PREFIX ."country c ON c.country_id = m.id_country
			LEFT JOIN ". DB_PREFIX ."zone z ON z.zone_id = m.id_region
			WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' && m.manufacturer_id = '" . (int)$manufacturer_id . "'");

		return $query->row;
	}

	public function getManufacturers($data = array()) {
			$sql = "
			SELECT md.name as org_name, md.manufacturer_id as manufacturer_id, md.name as name_desc_org, md.city as org_city, md.phone as org_phone, md.email as org_email, md.fax as org_fax, md.address as org_address, md.post_code as org_post_code, md.site_address as org_site_address, md.description as org_description, md.educational_program as org_educational_program, c.name as country_name, z.name as region_name, c.eng_name as country_name_eng, z.eng_name as region_name_eng
			FROM " . DB_PREFIX . "manufacturer m
			LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id)
			LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id)
			LEFT JOIN ". DB_PREFIX ."country c ON c.country_id = m.id_country
			LEFT JOIN ". DB_PREFIX ."zone z ON z.zone_id = m.id_region
			WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND m.status = 1";

			if (isset($data['id_country'])) {
				$sql .= " AND m.id_country = ".$data['id_country'];
			}

			if (isset($data['id_region'])) {
				$sql .= " AND m.id_region = ".$data['id_region'];
			}

			if (isset($data['name_city'])) {
				$sql .= " AND md.city LIKE '%".$this->db->escape($data['name_city'])."%'";
			}

			if (isset($data['search_field'])) {
				$sql .= " AND ( md.description LIKE '%".$this->db->escape($data['search_field'])."%' OR md.name LIKE '%".$this->db->escape($data['search_field'])."%')";
			}

			if (isset($data['id_organization'])) {
				$sql .= " AND m.manufacturer_id = ".(int)$data['id_organization'];
			}

			if (isset($data['filter_name'])) {
				$sql .= " AND md.name LIKE '%".$this->db->escape($data['filter_name'])."%'";
			}

			$sort_data = array(
				'name',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY m.sort_order";
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
	}//public function getManufacturers

	public function getTotalActiveManufacturers($data = []) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) LEFT JOIN ". DB_PREFIX ."country c ON c.country_id = m.id_country LEFT JOIN ". DB_PREFIX ."zone z ON z.zone_id = m.id_region WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND m.status = 1";

		if (isset($data['id_country'])) {
			$sql .= " AND m.id_country = ".$data['id_country'];
		}

		if (isset($data['id_region'])) {
			$sql .= " AND m.id_region = ".$data['id_region'];
		}

		if (isset($data['name_city'])) {
			$sql .= " AND md.city LIKE '%".$this->db->escape($data['name_city'])."%'";
		}

		if (isset($data['search_field'])) {
			$sql .= " AND ( md.description LIKE '%".$this->db->escape($data['search_field'])."%' OR md.name LIKE '%".$this->db->escape($data['search_field'])."%')";
		}

		if (isset($data['id_organization'])) {
				$sql .= " AND m.manufacturer_id = ".(int)$data['id_organization'];
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}//public function getTotalActiveManufacturers

}//class ModelCatalogManufacturer
