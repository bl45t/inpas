<?php
class ControllerInformationSearch extends Controller
{
	public function index() {
		$data = [];

		$this->load->language('information/search');

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_result_search'] = $this->language->get('text_result_search');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}

		$this->load->model('information/search');
		$this->load->model('newsblog/article');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = 10;
		$start = ($page - 1) * $limit;

		$filter_data = array(
			'filter_name' => $search,
			'start'       => $start,
			'limit'       => $limit
		);

		$results = $this->model_information_search->getNewsAndEvents($filter_data);

		unset($filter_data['limit']);
		unset($filter_data['start']);

		$result_total = count($this->model_information_search->getNewsAndEvents($filter_data));
		$i = 0;

		$data['result_search'] = [];

		foreach ($results as $result) {
			$name = strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'));
			$link = "";
			$description = "";

			if (!empty($result['description'])) {
				$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
				$description = mb_substr($description, 0, 1000);
			}
				
			if ($result['type_object'] == 'news') {
				$link .= $this->url->link('information/news/info', 'news_id=' . $result['id']);
			} else if ($result['type_object'] == 'event') {
				$mainCategoryId =  $this->model_newsblog_article->getArticleMainCategoryId($result['id']);
				$link .= $this->url->link('newsblog/article', 'newsblog_path=' . $mainCategoryId . '&newsblog_article_id=' . $result['id']);
			}

			$data['result_search'][$i]['name'] = $name;
			$data['result_search'][$i]['description'] = $description;
			$data['result_search'][$i]['link'] = $link;

			$i++;
		}

		$pagination = new Pagination();
		$pagination->total = $result_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/search','&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($result_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($result_total - $limit)) ? $result_total : ((($page - 1) * $limit) + $limit), $result_total, ceil($result_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/search', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/search', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/search', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($result_total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/search', '&page=' . ($page + 1), true), 'next');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/search', $data));
	}
}