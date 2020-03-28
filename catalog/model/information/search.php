<?php
class ModelInformationSearch extends Model
{
	public function getNewsAndEvents($data = []) {
		$sql = "
			(
				SELECT n.news_id as id, nd.title as title, nd.description as description, n.date_added as date, 'news' as type_object
				FROM " . DB_PREFIX . "news n 
				LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) 
				WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND (nd.title LIKE '%".$this->db->escape($data['filter_name'])."%' OR nd.description LIKE '%".$this->db->escape($data['filter_name'])."%')
			)

			UNION ALL
			(
				SELECT p.article_id as id, pd.name AS title, pd.preview as description, p.date_start as date, 'event' as type_object
				FROM " . DB_PREFIX . "newsblog_article p
				LEFT JOIN " . DB_PREFIX . "newsblog_article_description pd ON (p.article_id = pd.article_id)

				WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				p.status = '1' AND (pd.name LIKE '%".$this->db->escape($data['filter_name'])."%' OR pd.preview LIKE '%".$this->db->escape($data['filter_name'])."%')
			)
			ORDER BY date
		";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 5;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
}