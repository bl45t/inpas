<?php
class ControllerCommonPublications extends Controller {
	public function index() {
		$data = [];

		$this->load->language('common/publications');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = 10;

		$filter_data = array(
			'order' => "DESC",
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		$this->load->model('catalog/attribute');
		$data['publications'] = $this->model_catalog_attribute->getAttributes($filter_data);

		$publications_total = $this->model_catalog_attribute->getTotalAttributes();

		$this->load->model('catalog/attribute_group');
		$data['attribute_groups'] = $this->model_catalog_attribute_group->getAttributeGroups();

		$pagination = new Pagination();
		$pagination->total = $publications_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('common/publications', '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($publications_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($publications_total - $limit)) ? $publications_total : ((($page - 1) * $limit) + $limit), $publications_total, ceil($publications_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('common/publications', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('common/publications', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('common/publications', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($publications_total / $limit) > $page) {
			$this->document->addLink($this->url->link('common/publications', '&page=' . ($page + 1), true), 'next');
		}

		$data['text_publications'] = $this->language->get('text_publications');
		$data['text_category'] = $this->language->get('text_category');
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		return $this->response->setOutput($this->load->view('common/publications', $data));
	}//public function index
}//class ControllerCommonPublications