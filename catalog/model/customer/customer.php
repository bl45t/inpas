<?php
class ModelCustomerCustomer extends Model
{
	public function getExperts($data = []) {
		$sql = "
			SELECT c.customer_id, c.post, c.eng_post, c.telephone, c.email, c.field_of_interest,
			c.eng_field_of_interest,CONCAT(c.lastname, ' ', c.firstname, ' ', c.middlename) AS expert_name,
			 CONCAT(c.eng_lastname, ' ', c.eng_firstname, ' ', c.eng_middlename) AS eng_expert_name,
			cgd.name AS customer_group, md.name AS org_name, cntry.name as country_name,
			cntry.eng_name as country_eng_name, z.name as region_name, z.eng_name as region_eng_name,
			 md.address as org_address, md.manufacturer_id as id_org, cntry.iso_code_2 as country_iso_code_2, c.avatar
			FROM " . DB_PREFIX . "customer c
			LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id)
			LEFT JOIN " . DB_PREFIX . "manufacturer m ON m.manufacturer_id = c.id_organization
			LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON md.manufacturer_id = m.manufacturer_id
				AND md.language_id = '". (int)$this->config->get('config_language_id') ."'
			LEFT JOIN " . DB_PREFIX . "country cntry ON cntry.country_id = m.id_country
			LEFT JOIN " . DB_PREFIX . "zone z ON z.zone_id = m.id_region
			WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.is_expert = 1
		";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "(
				CONCAT(c.lastname, ' ', c.firstname, ' ', c.middlename) LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR
				CONCAT(c.firstname, ' ', c.middlename, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR
				CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR
				CONCAT(c.eng_lastname, ' ', c.eng_firstname, ' ', c.eng_middlename) LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR
				CONCAT(c.eng_firstname, ' ', c.eng_middlename, ' ', c.eng_lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR
				CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'
			)";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "c.customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (isset($data['id_country'])) {
			$implode[] = " m.id_country = ".$data['id_country'];
		}

		if (isset($data['id_region'])) {
			$implode[] = " m.id_region = ".$data['id_region'];
		}

		if (isset($data['name_city'])) {
			$implode[] = " md.city LIKE '%".$this->db->escape($data['name_city'])."%'";
		}

		if (isset($data['name_organization'])) {
			$implode[] = " md.name LIKE '%".$this->db->escape($data['name_organization'])."%'";
		}

		if (isset($data['name_post'])) {
			$implode[] = " c.post LIKE '%".$this->db->escape($data['name_post'])."%'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'expert_name',
			'c.email',
			'customer_group',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY expert_name";
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
	}//public function getExperts

	public function getExpertPositions($data = []) {
		$sql = "
			SELECT DISTINCT c.post
			FROM " . DB_PREFIX . "customer c
			LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id)
			WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.is_expert = 1
		";

		$implode = array();

		if (isset($data['name_post'])) {
			$implode[] = " c.post LIKE '%".$this->db->escape($data['name_post'])."%'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
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
	}//public function getExpertPositions

}//class ModelCustomerCustomer
