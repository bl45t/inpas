<?php
class ControllerInformationBdOrganizations extends Controller
{
	public function index() {
		$data = [];
		$curLang = $this->language->get('code');

		$this->load->language('information/bd_organizations');

		$data['text_heading_title'] = $this->language->get('text_heading_title');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_region'] = $this->language->get('text_region');
		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_post_code'] = $this->language->get('text_post_code');
		$data['text_fax'] = $this->language->get('text_fax');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_site'] = $this->language->get('text_site');
		$data['text_educational_program'] = $this->language->get('text_educational_program');
		$data['text_hide'] = $this->language->get('text_hide');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_sorry_not_found'] = $this->language->get('text_sorry_not_found');
		$data['text_filters'] = $this->language->get('text_filters');
		$data['text_country'] = $this->language->get('text_country');
		$data['text_city'] = $this->language->get('text_city');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_link'] = $this->language->get('text_link');
		$data['text_experts'] = $this->language->get('text_experts');
		$data['text_experts_organization'] = $this->language->get('text_experts_organization');

		$this->document->setTitle($this->language->get('text_heading_title'));

		$optionQuery = [];

		if (($this->request->server['REQUEST_METHOD'] == 'GET')) {
			$idCountry = $this->request->get['id_country'];

			if (!empty($idCountry)) {
				$optionQuery['id_country'] = (int)$idCountry;
			}

			$idRegion = $this->request->get['id_region'];

			if (!empty($idRegion)) {
				$optionQuery['id_region'] = (int)$idRegion;
			}

			$nameCity = $this->request->get['name_city'];

			if (!empty($nameCity)) {
				$optionQuery['name_city'] = $nameCity;
			}

			$searchField = $this->request->get['search_field'];

			if (!empty($searchField)) {
				$optionQuery['search_field'] = $searchField;
			}

		}

		if (isset($this->request->get['id_country'])) {
			$data['id_country'] = $this->request->get['id_country'];
		} else {
			$data['id_country'] = '';
		}

		if (isset($this->request->get['id_region'])) {
			$data['id_region'] = $this->request->get['id_region'];
		} else {
			$data['id_region'] = '';
		}

		if (isset($this->request->get['name_city'])) {
			$data['name_city'] = $this->request->get['name_city'];
		} else {
			$data['name_city'] = '';
		}


		if (isset($this->request->get['search_field'])) {
			$data['search_field'] = $this->request->get['search_field'];
		} else {
			$data['search_field'] = '';
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = 10;

		$optionQuery['limit'] = $limit;
		$optionQuery['start'] = ($page - 1) * $limit;

		if (isset($this->request->get['organization'])) {
			$optionQuery['id_organization'] = $this->request->get['organization'];
		}

		$org_total = $this->model_catalog_manufacturer->getTotalActiveManufacturers($optionQuery);
		$organizations = $this->model_catalog_manufacturer->getManufacturers($optionQuery);

		$arOrg = [];

		foreach ($organizations as $org) {
			$arOrg[$org['manufacturer_id']]['name'] = $org['org_name'];
			$arOrg[$org['manufacturer_id']]['city'] = $org['org_city'];
			$arOrg[$org['manufacturer_id']]['phone'] = $this->customer->isLogged() ? $org['org_phone'] : $this->language->get('text_auth');
			$arOrg[$org['manufacturer_id']]['description'] = html_entity_decode($org['org_description'], ENT_QUOTES, 'UTF-8');
			$arOrg[$org['manufacturer_id']]['address'] = $org['org_address'];
			$arOrg[$org['manufacturer_id']]['post_code'] = $org['org_post_code'];
			$arOrg[$org['manufacturer_id']]['fax'] = $this->customer->isLogged() ? $org['org_fax'] : $this->language->get('text_auth');
			$arOrg[$org['manufacturer_id']]['email'] = $this->customer->isLogged() ? $org['org_email'] : $this->language->get('text_auth');
			$arOrg[$org['manufacturer_id']]['site_address'] = $org['org_site_address'];
			$arOrg[$org['manufacturer_id']]['link'] = $this->url->link('information/bd_organizations','&organization='.$org['manufacturer_id']);
			$arOrg[$org['manufacturer_id']]['experts'] = htmlspecialchars($this->url->link('information/bd_expert','&name_organization='.html_entity_decode($org['org_name'], ENT_QUOTES, "UTF-8")), ENT_QUOTES, "UTF-8");
			$arOrg[$org['manufacturer_id']]['educational_program'] = html_entity_decode($org['org_educational_program'], ENT_QUOTES, 'UTF-8');

			$arOrg[$org['manufacturer_id']]['country_name'] = $org['country_name'];
			$arOrg[$org['manufacturer_id']]['region_name'] = $org['region_name'];

			if ($curLang == 'en') {
				$arOrg[$org['manufacturer_id']]['country_name'] = $org['country_name_eng'];
				$arOrg[$org['manufacturer_id']]['region_name'] = $org['region_name_eng'];
			}

			$arShotData = [];

			if (!empty($arOrg[$org['manufacturer_id']]['country_name'])) {
				$arShotData[] = $arOrg[$org['manufacturer_id']]['country_name'];
			}

			if (!empty($arOrg[$org['manufacturer_id']]['region_name'])) {
				$arShotData[] = $arOrg[$org['manufacturer_id']]['region_name'];
			}

			$arOrg[$org['manufacturer_id']]['short_data'] = implode(', ', $arShotData);

		}

		$data['organizations'] = $arOrg;

		$data['search_link'] = $this->url->link('information/bd_organizations', '', true);

		$this->load->model('localisation/country');

		$countries = $this->model_localisation_country->getCountries();
		$arCountries = [];

		foreach ($countries as $c) {
			$arCountries[$c['country_id']]['name'] = $c['name'];

			if ($curLang == 'en') {
				$arCountries[$c['country_id']]['name'] = $c['eng_name'];
			}

		}

		$data['countries'] = $arCountries;

		$url = '';

		if (isset($this->request->get['search_field'])) {
			$url .= '&search_field=' . urlencode(html_entity_decode($this->request->get['search_field'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['id_country'])) {
			$url .= '&id_country=' . $this->request->get['id_country'];
		}

		if (isset($this->request->get['id_region'])) {
			$url .= '&id_region=' . $this->request->get['id_region'];
		}

		if (isset($this->request->get['name_city'])) {
			$url .= '&name_city=' . urlencode(html_entity_decode($this->request->get['name_city'], ENT_QUOTES, 'UTF-8'));
		}

		$pagination = new Pagination();
		$pagination->total = $org_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/bd_organizations', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($org_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($org_total - $limit)) ? $org_total : ((($page - 1) * $limit) + $limit), $org_total, ceil($org_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/bd_organizations', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/bd_organizations', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/bd_organizations', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($org_total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/bd_organizations', '&page=' . ($page + 1), true), 'next');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/bd_organizations', $data));
	}//public function index
}//class ControllerInformationBdOrganizations
