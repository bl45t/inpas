<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		$this->load->language('common/home');
		$data['text_publications'] = $this->language->get('text_publications');
		$data['text_all_publications'] = $this->language->get('text_all_publications');
		$data['text_top_university'] = $this->language->get('text_top_university');

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$this->load->model('catalog/attribute');
		$data['publications'] = $this->model_catalog_attribute->getAttributes(['start' => '0' ,'limit' => '5', 'order' => 'DESC']);
		$data['all_publications_link'] = $this->url->link('common/publications', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
