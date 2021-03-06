<?php
class ControllerInformationBdExpert extends Controller
{
	public function index() {
		$data = [];
		$curLang = $this->language->get('code');

		$this->load->language('information/bd_expert');

		$data['text_heading_title'] = $this->language->get('text_heading_title');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_region'] = $this->language->get('text_region');
		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_post'] = $this->language->get('text_post');
		$data['text_degree'] = $this->language->get('text_degree');
		$data['text_organization'] = $this->language->get('text_organization');
		$data['text_interests'] = $this->language->get('text_interests');
		$data['text_hide'] = $this->language->get('text_hide');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_sorry_not_found'] = $this->language->get('text_sorry_not_found');
		$data['text_filters'] = $this->language->get('text_filters');
		$data['text_country'] = $this->language->get('text_country');
		$data['text_city'] = $this->language->get('text_city');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_link'] = $this->language->get('text_link');
		$data['text_about_me'] = $this->language->get('text_about_me');

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
				$optionQuery['filter_name'] = $searchField;
			}

			$nameOrganization = $this->request->get['name_organization'];

			if (!empty($nameOrganization)) {
				$optionQuery['name_organization'] = $nameOrganization;
			}

			$namePost = $this->request->get['name_post'];

			if (!empty($namePost)) {
				$optionQuery['name_post'] = $namePost;
			}

			$nameDegree = $this->request->get['name_degree'];

			if (!empty($nameDegree)) {
				$optionQuery['name_degree'] = $nameDegree;
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

		if (isset($this->request->get['name_organization'])) {
			$data['name_organization'] = $this->request->get['name_organization'];
		} else {
			$data['name_organization'] = '';
		}

		if (isset($this->request->get['name_post'])) {
			$data['name_post'] = $this->request->get['name_post'];
		} else {
			$data['name_post'] = '';
		}

		if (isset($this->request->get['name_degree'])) {
			$data['name_degree'] = $this->request->get['name_degree'];
		} else {
			$data['name_degree'] = '';
		}

		$this->load->model('customer/customer');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = 10;

		$optionQuery['limit'] = $limit;
		$optionQuery['start'] = ($page - 1) * $limit;
		$optionQuery['filter_approved'] = 1;

		$experts = $this->model_customer_customer->getExperts($optionQuery);

		unset($optionQuery['limit']);
		unset($optionQuery['start']);

		$exprts_total = count($this->model_customer_customer->getExperts($optionQuery));

		$arExperts = [];

		$this->load->model('tool/imagecrop');

		foreach ($experts as $e) {
			$addrInfo = [];

			if (!empty($e['country_name'])) {
				$addrInfo[] = ($curLang == 'ru') ? $e['country_name'] : $e['country_eng_name'];
			}

			if (!empty($e['region_name'])) {
				$addrInfo[] = ($curLang == 'ru') ? $e['region_name'] : $e['region_eng_name'];
			}

			if (!empty($e['org_address'])) {
				$addrInfo[] = $e['org_address'];
			}

			$arExperts[$e['customer_id']]['name'] = ($curLang == 'ru') ? $e['expert_name'] : $e['eng_expert_name'];
			$arExperts[$e['customer_id']]['post'] = ($curLang == 'ru') ? $e['post'] : $e['eng_post'];
			$arExperts[$e['customer_id']]['degree'] = ($curLang == 'ru') ? $e['degree'] : $e['eng_degree'];
			$arExperts[$e['customer_id']]['telephone'] = $this->customer->isLogged() ? $e['telephone'] : $this->language->get('text_auth');
			$arExperts[$e['customer_id']]['email'] = $this->customer->isLogged() ? $e['email'] : $this->language->get('text_auth');
			$arExperts[$e['customer_id']]['field_of_interest'] = ($curLang == 'ru') ? $e['field_of_interest'] : $e['eng_field_of_interest'];
			$arExperts[$e['customer_id']]['org_name'] = $e['org_name'];
			$arExperts[$e['customer_id']]['country_name'] = ($curLang == 'ru') ? $e['country_name'] : $e['country_eng_name'];
			$arExperts[$e['customer_id']]['region_name'] = ($curLang == 'ru') ? $e['region_name'] : $e['region_eng_name'];
			$arExperts[$e['customer_id']]['address'] = implode(', ', $addrInfo);
			$arExperts[$e['customer_id']]['link_to_org'] = $this->url->link('information/bd_organizations','&organization='.$e['id_org']);
			$arExperts[$e['customer_id']]['link'] = $this->url->link('information/bd_expert','&search_field='.htmlspecialchars($arExperts[$e['customer_id']]['name']));
			$arExperts[$e['customer_id']]['about_me'] = $this->customer->isLogged() ? (($curLang == 'ru') ? $e['about_me'] : $e['eng_about_me']) : $this->language->get('text_auth');
			$arExperts[$e['customer_id']]['country_iso_code_2'] = strtolower($e['country_iso_code_2']);

			if (!empty($e['avatar'])) {
				$arExperts[$e['customer_id']]['avatar'] = $this->model_tool_imagecrop->resize($e['avatar'], 0, 83);
			}

		}

		$data['experts'] = $arExperts;

		$data['search_link'] = $this->url->link('information/bd_expert', '', true);

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

		if (isset($this->request->get['name_organization'])) {
			$url .= '&name_organization=' . urlencode(html_entity_decode($this->request->get['name_organization'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['name_post'])) {
			$url .= '&name_post=' . urlencode(html_entity_decode($this->request->get['name_post'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['name_degree'])) {
			$url .= '&name_degree=' . urlencode(html_entity_decode($this->request->get['name_degree'], ENT_QUOTES, 'UTF-8'));
		}

		$pagination = new Pagination();
		$pagination->total = $exprts_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/bd_expert', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($exprts_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($exprts_total - $limit)) ? $exprts_total : ((($page - 1) * $limit) + $limit), $exprts_total, ceil($exprts_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/bd_expert', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/bd_expert', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/bd_expert', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($exprts_total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/bd_expert', '&page=' . ($page + 1), true), 'next');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/bd_expert', $data));
	}//public function index

	public function autocompletePost() {
		$json = array();

		if (isset($this->request->get['name_post'])) {
			$this->load->model('customer/customer');

			$filter_data = array(
				'name_post' => $this->request->get['name_post'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_customer_customer->getExpertPositions($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}//public function autocompletePost

	public function autocompleteDegree() {
		$json = array();

		if (isset($this->request->get['name_degree'])) {
			$this->load->model('customer/customer');

			$filter_data = array(
				'name_degree' => $this->request->get['name_degree'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_customer_customer->getExpertDegree($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}//public function autocompleteDegree

}//class ControllerInformationBdExpert
