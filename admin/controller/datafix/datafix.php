<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// https://opencartadmin.com © 2011-2019 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ControllerDatafixDatafix', false)) {
class ControllerDatafixDatafix extends Controller
{
	private $error = array();
	protected $data;
	protected $template;
	protected $children;

	public function __construct($registry) {
		parent::__construct($registry);
		if (version_compare(phpversion(), '5.3.0', '<') == true) {
			exit('PHP5.3+ Required');
		}
		if (!defined('SC_VERSION') && defined('VERSION')) define('SC_VERSION', (int)substr(str_replace('.', '', VERSION), 0, 2));

		if (defined('SC_VERSION')) {
			if (!class_exists('PHP_Exceptionizer', false)) {
				if (function_exists('modification')) {
					require_once(modification(DIR_SYSTEM . 'library/exceptionizer.php'));
				} else {
					require_once(DIR_SYSTEM . 'library/exceptionizer.php');
				}
			}
	        if (SC_VERSION > 23) {
	        	$this->data['token_name'] = 'user_token';
	        } else {
	        	$this->data['token_name'] = 'token';
	        }
	        if (isset($this->session->data[$this->data['token_name']])) {
	        	$this->data['token'] = $this->session->data[$this->data['token_name']];
	        } else {
	        	$this->data['token'] = '';
	        }

		    if ((isset($_SERVER['HTTPS']) && (strtolower($_SERVER['HTTPS']) == 'on' || $_SERVER['HTTPS'] == '1')) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && strtolower($_SERVER['HTTP_X_FORWARDED_SSL']) == 'on'))) {
		    	$this->data['protocol'] = 'https';
		    	$this->data['url_link_ssl'] = true;
		    } else {
		    	$this->data['protocol'] = 'http';
		    	if (SC_VERSION < 20) {
		    		$this->data['url_link_ssl'] = 'NONSSL';
		    	} else {
		    		$this->data['url_link_ssl'] = false;
		    	}
		    }

	        if (SC_VERSION > 23) {
		        $this->data['template_engine'] = $this->config->get('template_engine');
	        }

			if ($this->data['protocol'] == 'https') {
	 			$config_url_0 = HTTPS_CATALOG;
			} else {
	 			$config_url_0 = HTTP_CATALOG;
			}

			$this->load->model('setting/store');

			$this->data['stores'][0] = array(
				'store_id' => 0,
				'name' => $this->config->get('config_name'),
				'url' => $config_url_0
			);

			$stores = $this->model_setting_store->getStores();

			foreach ($stores as $result) {
				if ($this->data['protocol'] == 'https' && isset($result['ssl']) && $result['ssl'] != '') {
					$store_url = $result['ssl'];
				} else {
					$store_url = $result['url'];
				}

				$this->data['stores'][$result['store_id']] = array(
					'store_id' => $result['store_id'],
					'name' => $result['name'],
					'url' => $store_url
				);
			}

	        $this->data['controller_path'] = DIR_APPLICATION . 'controller/datafix/';
			$this->data['config_language_id'] = $this->config->get('config_language_id');

	        $this->load_widgets();
	        $this->data['html'] = '';
        }
	}


    public function load_view_settings() {

		if (SC_VERSION < 20) {
			$this->data['column_left'] = '';
		} else {
			if (SC_VERSION > 23) {
				$this->config->set('template_engine', $this->data['template_engine']);
	        }

    		$this->data['header'] = $this->load->controller('common/header');
			$this->data['footer'] = $this->load->controller('common/footer');
			$this->data['column_left'] = $this->load->controller('common/column_left');

		}

    	$this->data['template'] = 'datafix/datafix';

        $this->data = $this->method_widgets(__FUNCTION__, $this->data);

		return $this;
    }

	public function load_view() {

        if (SC_VERSION > 23) {
        	unset($this->language->data['error_warning']);
        }

		if (SC_VERSION < 30) {
			$this->data['template'] = $this->data['template'] . '.tpl';
		}

		if (SC_VERSION < 20) {
			$this->children = array();
            $this->template = $this->data['template'];
			$this->data['html'] = $this->render();

		} else {

            if (SC_VERSION > 23) {
	            $this->config->set('template_engine', 'template');
	        }

			$this->data['html'] = $this->load->view($this->data['template'], $this->data);

            if (SC_VERSION > 23) {
	            $this->config->set('template_engine', $this->data['template_engine']);
	        }
		}
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);

		return $this;
	}



	public function index() {
		if (defined('SC_VERSION')) {
			$this
			->load_model()
			->load_start()
			->load_get_store()
			->load_language()
			->load_language_get()
			->load_url_link()
			->save_settings()
			->load_settings()
			->load_scripts()
			->load_languages()
			->load_currencies()
			->load_layouts()
			->load_custore_groups()
			->load_version()
			->load_setTitle()
			->load_set()
			->install_ocmod_settings()
			->load_ocmod_check()
			->load_tab_options()
			->load_tab_install()
			->load_tab_service()
			->load_tab_doc()
			->load_messages()
			->load_view_settings()
			->load_view()
			->load_view_output();
		}
	}

	public function method_widgets($method, $this_data, $name = '') {
        $this->data = $this_data;
        foreach ($this->data['widgets'] as $nm => $widget) {
            if (($name != '' && $widget == $name) || $name == '') {
	        	if (file_exists($this->data['controller_path'] . $widget . '/' . $widget . '.php')) {
			        $controller_widget = 'controller_datafix_' . $widget . '_' . $widget;
			        if (!is_object($this->$controller_widget)) {
			        	$this->model_datafix_datafix->control('datafix/' . $widget . '/' . $widget);
			        }
			        if (method_exists($this->registry->get($controller_widget), $method)) {
			        	$this->data = $this->$controller_widget->$method($this->data);
			        }
	        	}
        	}
        }
        return $this->data;
	}

    public function set_data($data) {
    	$this->data = $data;
    	return $this;
    }

    public function load_tab_install() {
        if (!isset($this->data['html_tab_install'])) {
        	$this->data['html_tab_install'] = '';
        }

        $this->data['template'] = 'datafix/tab_install';

        $this->load_view();

        $this->data['html_tab_install'] .= $this->data['html'];

    	$this->data = $this->method_widgets(__FUNCTION__, $this->data);
    	return $this;
    }


    public function load_tab_doc() {
        if (!isset($this->data['html_tab_doc'])) {
        	$this->data['html_tab_doc'] = '';
        }

        $this->data['template'] = 'datafix/tab_doc';

        $this->load_view();

        $this->data['html_tab_doc'] .= $this->data['html'];

    	$this->data = $this->method_widgets(__FUNCTION__, $this->data);
    	return $this;
    }

    public function load_tab_options() {

        if (!isset($this->data['html_tab_options'])) {
        	$this->data['html_tab_options'] = '';
        }

        if (!isset($this->data['datafix_settings']['access'])) {
        	$this->data['datafix_settings']['access'] = true;
        }

        $this->data['template'] = 'datafix/tab_options';

        $this->load_view();

        $this->data['html_tab_options'] .= $this->data['html'];

    	$this->data = $this->method_widgets(__FUNCTION__, $this->data);
    	return $this;
    }

    public function load_tab_service() {
        if (!isset($this->data['html_tab_service'])) {
        	$this->data['html_tab_service'] = '';
        }

        $this->data['template'] = 'datafix/tab_service';

        $this->load_view();

        $this->data['html_tab_service'] .= $this->data['html'];

    	$this->data = $this->method_widgets(__FUNCTION__, $this->data);
    	return $this;
    }

    public function load_widgets() {

        $this->data['widgets'] = array();

        $dirs = scandir($this->data['controller_path']);

		foreach ($dirs as $nm => $dir) {
			if (is_dir($this->data['controller_path'] . $dir) && $dir != '.' && $dir != '..') {
				$this->data['widgets'][] = preg_replace('/[^a-zA-Z0-9]/', '', $dir);
			}
		}
        if (!empty($this->data['widgets'])) {
	        foreach ($this->data['widgets'] as $nm => $widget) {
		        $this->language->load('datafix/' . $widget . '/' . $widget);

		        if ($this->language->get('order_' . $widget) != 'order_' . $widget) {
		        	$widgets[(int)$this->language->get('order_' . $widget)] = $widget;
		        } else {
		        	$widgets[] = $widget;
		        }
	        }
	        ksort($widgets);
	        $this->data['widgets'] = $widgets;
        }

        return $this;
    }

	public function load_get_store() {

	    $this->load->model('setting/store');

		if (isset($this->request->get['store_id'])) {
			$this->data['store_id'] = (int) $this->request->get['store_id'];
		} else {
			if (isset($this->request->post['store_id'])) {
				$this->data['store_id'] = (int) $this->request->post['store_id'];
			} else {
				$this->data['store_id'] = 0;
			}
		}

        $flag_store = false;
        foreach ($this->data['stores'] as $store) {
        	if ($store['store_id'] == $this->data['store_id']) {
            	$flag_store = true;
        	}
        }
        if (!$flag_store) $this->data['store_id'] = 0;

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;

	}

    public function load_start() {
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}

    public function load_language() {
		$this->language->load('localisation/currency');
		$this->language->load('setting/store');
		$this->language->load('datafix/datafix');

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);

        $this->data['language'] = $this->language;
		return $this;

    }
	public function load_language_get() {

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['heading_title_datafix'] = $this->language->get('heading_title_datafix');
        $this->data['ico_datafix'] = $this->language->get('ico_datafix');

		$this->data['heading_dev'] = $this->language->get('heading_dev');
        $this->data['datafix_text_datafix_success'] = $this->language->get('text_datafix_success');
        $this->data['entry_datafix_html'] = $this->language->get('entry_datafix_html');
        $this->data['entry_datafix_position'] = $this->language->get('entry_datafix_position');
        $this->data['entry_datafix_copy'] = $this->language->get('entry_datafix_copy');

        $this->data['tab_text_datafix_doc'] = $this->language->get('tab_text_datafix_doc');
		$this->data['tab_text_datafix_options'] = $this->language->get('tab_text_datafix_options');
		$this->data['tab_text_datafix_position'] = $this->language->get('tab_text_datafix_position');
        $this->data['tab_text_datafix_access'] = $this->language->get('tab_text_datafix_access');

		$this->data['tab_text_datafix_main'] = $this->language->get('tab_text_datafix_main');

        $this->data['tab_text_datafix_other'] = $this->language->get('tab_text_datafix_other');
		$this->data['tab_text_datafix_general'] = $this->language->get('tab_text_datafix_general');
		$this->data['tab_text_datafix_list'] = $this->language->get('tab_text_datafix_list');
		$this->data['tab_text_datafix_service'] = $this->language->get('tab_text_datafix_service');

        $this->data['entry_datafix_add'] = $this->language->get('entry_datafix_add');
		$this->data['entry_datafix_name'] = $this->language->get('entry_datafix_name');
		$this->data['entry_datafix_install_update'] = $this->language->get('entry_datafix_install_update');
		$this->data['entry_datafix_widget_status'] = $this->language->get('entry_datafix_widget_status');

        $this->data['entry_datafix_main_description'] = $this->language->get('entry_datafix_main_description');

        $this->data['entry_datafix_store_id_related'] = $this->language->get('entry_datafix_store_id_related');
        $this->data['url_store_id_repated_text'] = $this->language->get('url_store_id_repated_text');

        $this->data['entry_datafix_languages'] = $this->language->get('entry_datafix_languages');
        $this->data['entry_datafix_access'] = $this->language->get('entry_datafix_access');

		$this->data['entry_datafix_layout'] = $this->language->get('entry_datafix_layout');
		$this->data['entry_datafix_position'] = $this->language->get('entry_datafix_position');
		$this->data['entry_datafix_status'] = $this->language->get('entry_datafix_status');
		$this->data['entry_datafix_sort_order'] = $this->language->get('entry_datafix_sort_order');
		$this->data['entry_datafix_copy_rules'] = $this->language->get('entry_datafix_copy_rules');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

        $this->data['error_text_datafix_modify'] = $this->language->get('error_text_datafix_modify');

		$this->data['text_datafix_enabled'] = $this->language->get('text_datafix_enabled');
		$this->data['text_datafix_disabled'] = $this->language->get('text_datafix_disabled');
		$this->data['text_datafix_content_top'] = $this->language->get('text_datafix_content_top');
		$this->data['text_datafix_content_bottom'] = $this->language->get('text_datafix_content_bottom');
		$this->data['text_datafix_column_left'] = $this->language->get('text_datafix_column_left');
		$this->data['text_datafix_column_right'] = $this->language->get('text_datafix_column_right');
		$this->data['text_datafix_multi_empty'] = $this->language->get('text_datafix_multi_empty');

        $this->data['text_datafix_error_name'] = $this->language->get('text_datafix_error_name');

		$this->data['url_text_datafix_modules_text'] = $this->language->get('url_text_datafix_modules_text');
		$this->data['url_text_datafix_datafix_text'] = $this->language->get('url_text_datafix_datafix_text');
		$this->data['url_text_datafix_create_text'] = $this->language->get('url_text_datafix_create_text');
		$this->data['url_text_datafix_delete_text'] = $this->language->get('url_text_datafix_delete_text');
		$this->data['url_text_datafix_delete_sure_text'] = $this->language->get('url_text_datafix_delete_sure_text');

		$this->data['text_datafix_loading_main'] = $this->language->get('text_datafix_loading_main');

		$this->data['text_datafix_cacheremove'] = $this->language->get('text_datafix_cacheremove');
		$this->data['text_datafix_cacheremove_url'] = $this->language->get('text_datafix_cacheremove_url');
		$this->data['text_datafix_cacheremove_fail'] = html_entity_decode($this->language->get('text_datafix_cacheremove_fail'), ENT_QUOTES, 'UTF-8');
		$this->data['text_datafix_cacheremove_succes'] = html_entity_decode($this->language->get('text_datafix_cacheremove_succes'), ENT_QUOTES, 'UTF-8');

		$this->data['text_datafix_ocmodrefresh'] = $this->language->get('text_datafix_ocmod_refresh');
		$this->data['text_datafix_ocmodrefresh_url'] = $this->language->get('text_datafix_ocmodrefresh_url');
		$this->data['text_datafix_ocmodrefresh_fail'] = html_entity_decode($this->language->get('text_datafix_ocmodrefresh_fail'), ENT_QUOTES, 'UTF-8');
		$this->data['text_datafix_ocmodrefresh_success'] = html_entity_decode($this->language->get('text_datafix_ocmodrefresh_success'), ENT_QUOTES, 'UTF-8');

		$this->data['text_datafix_check_ver'] = $this->language->get('text_datafix_check_ver');
		$this->data['text_datafix_server_date_state'] = $this->language->get('text_datafix_server_date_state');
		$this->data['text_datafix_current_version_text'] = $this->language->get('text_datafix_current_version_text');
		$this->data['text_datafix_last_version_text'] = $this->language->get('text_datafix_last_version_text');
		$this->data['text_datafix_update_yes'] = $this->language->get('text_datafix_update_yes');
		$this->data['text_datafix_update_no'] = $this->language->get('text_datafix_update_no');
		$this->data['text_datafix_error_server_connect'] = $this->language->get('text_datafix_error_server_connect');

        $this->data['error_permission'] = $this->language->get('error_permission');
        $this->data['datafix_ocas'] = $this->language->get('datafix_ocas');
        $this->data['datafix_version'] = $this->language->get('datafix_version');
        $this->data['datafix_model'] = $this->language->get('datafix_model');

		$this->data['text_datafix_update_version_begin'] = $this->language->get('text_datafix_update_version_begin');
		$this->data['text_datafix_update_version_end'] = $this->language->get('text_datafix_update_version_end');
        $this->data['text_datafix_new_version'] = $this->language->get('text_datafix_new_version');
        $this->data['text_datafix_new_version_end'] = $this->language->get('text_datafix_new_version_end');

        $this->data['entry_datafix_menu_status'] = $this->language->get('entry_datafix_menu_status');
        $this->data['entry_datafix_menu_order'] = $this->language->get('entry_datafix_menu_order');

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;

	}

	public function load_model() {
		$this->load->model('setting/setting');
	    $this->load->model('localisation/language');
	    $this->load->model('localisation/currency');
	    $this->load->model('localisation/order_status');
	    $this->load->model('design/layout');
	    $this->load->model('datafix/datafix');
	    $this->load->model('datafix/mod');

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}

	public function load_version() {
		$this->data['oc_version'] = str_pad(str_replace('.', '', VERSION), 7, '0');

		$this->data['datafix_version_text'] = $this->language->get('datafix_version');
		$this->data['datafix_version'] = $this->model_datafix_datafix->getSetting('datafix_version');
        if (!$this->data['datafix_version']) {
        	$this->data['datafix_version'] = '*';
        }

		if ($this->data['datafix_version'] != $this->data['datafix_version_text']) {
			$this->data['text_datafix_update'] = $this->language->get('text_datafix_update_text');
		}
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}


	public function load_setTitle() {
		$this->document->setTitle(strip_tags($this->data['heading_title']));
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}

	public function save_settings() {

	    if ($this->request->server['REQUEST_METHOD'] == 'POST' && !$this->validate()) {
			$this->request->post = array();
			$this->session->data['error_warning'] = $this->language->get('error_text_datafix_modify');
			$this->data['error_warning'] = $this->language->get('error_text_datafix_modify');
			return $this;
		}

        if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
            $match_test = true;

				$this->cache->delete('datafix');
                $datafix_settings_store = $this->model_datafix_datafix->getSetting('datafix_settings_' . $this->data['store_id'], $this->data['store_id']);
                if (!empty($datafix_settings_store['multi'])) {
		            foreach ($datafix_settings_store['multi'] as $multi_name => $multi_array) {
		            	$this->model_datafix_datafix->deleteSetting($multi_name, $this->data['store_id']);
		            }
		        }


                if (!empty($this->request->post['datafix_settings_' . $this->data['store_id']]['multi'])) {
		            foreach ($this->request->post['datafix_settings_' . $this->data['store_id']]['multi'] as $multi_name => $multi_array) {

		            	if (!preg_match('/^[a-zA-Z0-9\.\-\_]+$/i', $multi_array['name'])) {
							$this->session->data['error_warning'] = $this->language->get('text_datafix_error_name');
							$this->data['error_warning'] = $this->language->get('text_datafix_error_name');
							$this->data['error_name'] = $multi_array['name'];
	                    	$match_test = false;
		            	}

		            	if (isset($this->request->post['datafix_settings_' . $this->data['store_id']]['multi'][$multi_name])) {
		            		unset($this->request->post['datafix_settings_' . $this->data['store_id']]['multi'][$multi_name]);
		            		if (isset($multi_array['name'])) {
		            			$this->request->post['datafix_settings_' . $this->data['store_id']]['multi'][$multi_array['name']] = $multi_array;
		            		}
		            	}
		            	if (isset($this->request->post[$multi_name])) {
		            		if (isset($multi_array['name'])) {
		            			$this->request->post[$multi_array['name']] = $this->request->post[$multi_name];
		            		}
		            		if ($multi_name != $multi_array['name']) {
		            			unset($this->request->post[$multi_name]);
		            		}
		            	}

	                    if ($match_test && !isset($datafix_settings_store['multi'][$multi_array['name']])) {
	                    	$this->data['new_name']	= $multi_array['name'];
	                    }

		            }
	            } else {
					$this->model_datafix_datafix->deleteSetting('datafix_settings_' . $this->data['store_id'], $this->data['store_id']);
				}

                if ($match_test) {
	            	$this->data['datafix_settings_' . $this->data['store_id']]['datafix_settings_' . $this->data['store_id']] = $this->request->post['datafix_settings_' . $this->data['store_id']];

					$this->model_datafix_datafix->editSetting('datafix_settings_' . $this->data['store_id'], $this->data['datafix_settings_' . $this->data['store_id']], $this->data['store_id']);

					$this->model_datafix_datafix->editSetting('datafix_settings', $this->request->post);

					$this->model_datafix_datafix->editSetting('datafix_widget', $this->request->post, $this->data['store_id']);

	                $this->session->data['success'] = $this->language->get('text_datafix_success');

	                $this->data = $this->method_widgets(__FUNCTION__, $this->data);

	                $this->session->data['success'] = $this->language->get('text_datafix_success');

                    if (isset($this->session->data['error_warning'])) {
                    	unset($this->session->data['error_warning']);
                    }
					if (isset($this->data['error_warning'])) {
						unset($this->data['error_warning']);
					}
                    /*
					if (SC_VERSION < 20) {
						$this->redirect(str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl'])));
					} else {
						$this->response->redirect(str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl'])));
					}
					*/
                }

		}

		return $this;
	}

    public function load_settings() {
		if (!isset($this->data['store_id'])) {
        	$this->load_get_store();
        }

        $this->create_table();

		if (isset($this->request->post['datafix_settings'])) {
			$this->data['datafix_settings'] = $this->request->post['datafix_settings'];
		} elseif ($this->model_datafix_datafix->getSetting('datafix_settings')) {
			$this->data['datafix_settings'] = $this->model_datafix_datafix->getSetting('datafix_settings');
		}

		if (isset($this->request->post['datafix_widget'])) {
			$this->data['datafix_widget'] = $this->request->post['datafix_widget'];
		} elseif ($this->model_datafix_datafix->getSetting('datafix_widget', $this->data['store_id'])) {
			$this->data['datafix_widget'] = $this->model_datafix_datafix->getSetting('datafix_widget', $this->data['store_id']);
		}

		if (isset($this->request->post['datafix_settings_' . $this->data['store_id']])) {
			$this->data['datafix_settings_store'] = $this->request->post['datafix_settings_' . $this->data['store_id']];
		} else {
			$this->data['datafix_settings_store'] = $this->model_datafix_datafix->getSetting('datafix_settings_' . $this->data['store_id'], $this->data['store_id']);
		}

		if (isset($this->request->get['datafix_save'])) {
			$this->data['datafix_save'] = true;
		}


        $this->data = $this->method_widgets(__FUNCTION__, $this->data);
        return $this;
    }

	public function load_scripts() {
		if (file_exists(DIR_APPLICATION . 'view/stylesheet/datafix/datafix.css')) {
			$this->document->addStyle('view/stylesheet/datafix/datafix.css');
		}

		if (file_exists(DIR_APPLICATION . 'view/javascript/jquery/tabs.js')) {
			$this->document->addScript('view/javascript/jquery/tabs.js');
		} else {
			if (file_exists(DIR_APPLICATION . 'view/javascript/datafix/tabs.js')) {
				$this->document->addScript('view/javascript/datafix/tabs.js');
			}
		}
		if (SC_VERSION < 20) {
			$this->document->addStyle('view/javascript/datafix/bootstrap/css/bootstrap.css');
			$this->document->addStyle('view/javascript/datafix/font-awesome/css/font-awesome.css');
		}
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}

    public function load_url_link() {
		$this->data['url_datafix'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl']));
		$this->data['url_add_multi'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix/add_multi', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl']));

		$this->data['url_delete'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix/deletesettings', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl']));
		$this->data['url_options'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl']));
  		$this->data['url_modules'] = str_replace('&amp;', '&', $this->url->link('extension/module', $this->data['token_name'] . '=' . $this->data['token'], $this->data['url_link_ssl']));
		$this->data['cancel'] = str_replace('&amp;', '&', $this->url->link('extension/module', $this->data['token_name'] . '=' . $this->data['token'], $this->data['url_link_ssl']));
		$this->data['action'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->data['token'] . '&store_id=' . $this->data['store_id'], $this->data['url_link_ssl']));

		if (SC_VERSION < 20) {
		     $mod_str = 'datafix/datafix/cacheremove';
		     $mod_str_value = 'mod=1&';
		} else {
		     if (SC_VERSION > 23) {
			     $mod_str = 'marketplace/modification/refresh';
		     } else {
			     $mod_str = 'extension/modification/refresh';
		     }
		     $mod_str_value = '';
		}

		$this->data['url_ocmodrefresh'] = str_ireplace('&amp;', '&', $this->url->link($mod_str, $mod_str_value . $this->data['token_name'].'=' . $this->session->data[$this->data['token_name']], $this->data['url_link_ssl']));
       	$this->data['url_cacheremove'] = str_ireplace('&amp;', '&', $this->url->link('datafix/datafix/cacheremove', $this->data['token_name'].'=' . $this->session->data[$this->data['token_name']], $this->data['url_link_ssl']));
        $this->data['url_main'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix', $this->data['token_name'] . '=' . $this->session->data[$this->data['token_name']], $this->data['url_link_ssl']));
   		$this->data['url_check_ver'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix/check_ver', $this->data['token_name'] . '=' . $this->session->data[$this->data['token_name']], $this->data['url_link_ssl']));
        $this->data['url_create'] = str_replace('&amp;', '&', $this->url->link('datafix/datafix/install_ocmod_widgets', $this->data['token_name'].'=' . $this->session->data[$this->data['token_name']], $this->data['url_link_ssl']));

    	$this->data = $this->method_widgets(__FUNCTION__, $this->data);
    	return $this;
    }

	public function load_languages() {
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		foreach ($this->data['languages'] as $code => $language) {
			$this->data['languages'][$code]['code_short'] = substr($code, 0, 2);

			if (!isset($language['image']) || SC_VERSION > 21) {
            	$this->data['languages'][$code]['image'] = 'language/' . $code . '/' . $code . '.png';
				if (!file_exists(DIR_APPLICATION.$this->data['languages'][$code]['image'])) {
					$this->data['languages'][$code]['image'] = 'view/image/flags/' . $language['image'];
				}
			} else {
                $this->data['languages'][$code]['image'] = 'view/image/flags/' . $language['image'];
				if (!file_exists(DIR_APPLICATION.$this->data['languages'][$code]['image'])) {
					$this->data['languages'][$code]['image'] = 'language/' . $code . '/' . $code . '.png';
				}
			}

			if (!file_exists(DIR_APPLICATION.$this->data['languages'][$code]['image'])) {
				$this->data['languages'][$code]['image'] = '';
			}
		}

        $this->data['config_language_id'] = $this->config->get('config_language_id');
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);

		return $this;
	}

    public function load_currencies() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		$sort_order = array(
			'sort'  => $sort,
			'order' => $order,
		);
		$results = $this->model_localisation_currency->getCurrencies($sort_order);

		foreach ($results as $result) {
			$this->data['currencies'][] = array(
				'currency_id'   => $result['currency_id'],
				'title'         => $result['title'] . (($result['code'] == $this->config->get('config_currency')) ? $this->language->get('text_datafix_default') : null),
				'code'          => $result['code'],
				'value'         => $result['value'],
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified']))
			);
		}

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
    }

    public function load_custore_groups() {

        if (file_exists(DIR_APPLICATION . 'model/sale/customer_group.php')) {
        	$this->load->model('sale/customer_group');
			$model_customer = 'model_sale_customer_group';
		} else {
			$this->load->model('customer/customer_group');
			$model_customer = 'model_customer_customer_group';
		}
		$this->data['customer_groups'] = $this->$model_customer->getCustomerGroups();

       	array_push($this->data['customer_groups'], array( 'customer_group_id' => -1,  'name' => $this->language->get('text_datafix_group_reg') ));
       	array_push($this->data['customer_groups'], array( 'customer_group_id' => -2,  'name' => $this->language->get('text_datafix_group_order') ));
       	array_push($this->data['customer_groups'], array( 'customer_group_id' => -3,  'name' => $this->language->get('text_datafix_group_order_this')));

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
    }

    public function load_layouts() {
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
    }

    public function get_data() {
		return $this->data;
    }

    public function load_messages() {

    	if (SC_VERSION > 23) {
    		unset($this->language->data['error_warning']);
    	}
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['error_warning'])) {
			$this->data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else {
			unset($this->session->data['error_warning']);
			unset($this->data['error_warning']);
		}

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;

	}

    public function load_settings_access() {
		if (!isset($this->data['datafix_settings_store']['access'])) {
			$this->data['datafix_settings_store']['access'] = true;
		}
		return $this;
    }

	public function load_set_menu() {

		if (!isset($this->data['datafix_settings']['menu_status'])) {
			$this->data['datafix_settings']['menu_status'] = false;
		}
		if (!isset($this->data['datafix_settings']['menu_order'])) {
			$this->data['datafix_settings']['menu_order'] = 99;
		}
		if (isset($this->data['datafix_settings']['menu_order']) && $this->data['datafix_settings']['menu_order'] < 1) {
			$this->data['datafix_settings']['menu_order'] = 1;
		}
	}

	public function load_set() {

		if (!isset($this->data['datafix_settings']['status'])) {
			$this->data['datafix_settings']['status'] = false;
		}

		if (!isset($this->data['datafix_settings']['datafix_vars']) || $this->data['datafix_settings']['datafix_vars'] == '') {
			$this->data['datafix_settings']['datafix_vars'] = 'product_id'.PHP_EOL.'manufacturer_id'.PHP_EOL.'blog_id'.PHP_EOL.'record_id'.PHP_EOL.'information_id'.PHP_EOL.'article_id'.PHP_EOL.'page'.PHP_EOL.'limit';

		}

		if (!isset($this->data['datafix_settings']['datafix_two_status'])) {
			$this->data['datafix_settings']['datafix_two_status'] = false;
		}

        $this->load_set_menu();
        $this->load_settings_access();

		$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		return $this;
	}




	public function load_view_output() {
		$this->data = $this->method_widgets(__FUNCTION__, $this->data);

        if (SC_VERSION > 15) {
        	$this->response->setOutput($this->data['html']);
        } else {
			$this->children = array(
				'common/header',
				'common/footer'
			);
	        $this->template = $this->data['template'];
			$this->data['html'] = $this->render();

        	echo $this->data['html'];
        }
		return $this;
	}


	public function validate() {
		$this->language->load('datafix/datafix');
		if (is_callable(array($this->user, 'hasPermission'))) {
			if (!$this->user->hasPermission('modify', 'datafix/datafix')) {
				$this->error['warning'] = $this->language->get('error_text_datafix_modify');
			}
		} else {
			$this->error['warning'] = $this->language->get('error_text_datafix_modify');
		}
		if (!$this->error) {
			return true;
		} else {
			$this->request->post = array();
			return false;
		}
	}
/***************************************/
	public function deletesettings() {
	        $this->load_model();
	        $this->load_get_store();
	        $this->load_languages();
	        $this->load_language();
	        $this->load_language_get();
            $this->load_settings();

	    if (($this->request->server['REQUEST_METHOD'] == 'GET') && $this->validate()) {

            $this->data['html'] = $this->language->get('text_datafix_success');

			$this->model_datafix_datafix->deleteSetting('datafix_settings_' . $this->data['store_id'], $this->data['store_id']);
			$this->model_datafix_datafix->deleteSetting('datafix_version');
            $this->model_datafix_datafix->deleteSetting('datafix_settings');
            $this->model_datafix_datafix->deleteSetting('datafix_widget', $this->data['store_id']);

			$this->data = $this->method_widgets(__FUNCTION__, $this->data);

		} else {

			$this->data['html'] = $this->data['error_text_datafix_modify'];

		}
		$this->response->setOutput($this->data['html']);

		return $this;
	}

	public function create_table() {
		$sql[] = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "setting_datafix` (
		`setting_id` INT(11) NOT NULL AUTO_INCREMENT ,
		`store_id` INT(11) NOT NULL DEFAULT '0' ,
		`codekey` VARCHAR(128) NOT NULL ,
		`value` LONGTEXT NOT NULL ,
		`serialized` TINYINT(1) NOT NULL,
		UNIQUE `setting_id` (`setting_id`),
		INDEX `store_id` (`store_id`),
		INDEX `codekey` (`codekey`)
		) ENGINE = MyISAM CHARSET=utf8 COLLATE utf8_general_ci;";

		foreach ($sql as $qsql) {
			$query = $this->db->query($qsql);
		}
	}

	public function createTables() {
        if (($this->request->server['REQUEST_METHOD'] == 'GET') && $this->validate()) {

            $this->create_table();

			$this->data['datafix_version'] = $this->language->get('datafix_version');

			$setting_version = Array(
				'datafix_version' => $this->data['datafix_version']
			);

			$this->model_datafix_datafix->editSetting('datafix_version', $setting_version);


			if (!$this->data['datafix_settings_store'] && !is_array($this->data['datafix_settings_store'])) {

				$this->data['html'] .= $this->language->get('text_datafix_install_ok');

			} else {
	            $this->data['html'] .= $this->language->get('text_datafix_install_already');
			}

        	$this->data = $this->method_widgets(__FUNCTION__, $this->data);

		} else {
			$this->data['html'] .= $this->data['error_text_datafix_modify'];
		}

		return $this->data['html'];
	}

	public function add_multi() {
	        $this->load_model();
	        $this->load_get_store();
	        $this->load_language();
	        $this->load_language_get();
	        $this->load_settings();
	        $this->load_set();
	        $this->load_custore_groups();
	        $this->load_layouts();
	        $this->load_languages();

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->data['multi_name_row'] = $this->request->post['multi_name_row'];

			if (isset($this->request->post['datafix_widget'])) {
				$this->data['widget'] = $this->request->post['datafix_widget'];
			} else {
				$this->data['widget'] = 'datafix';
			}

            $this->data = $this->method_widgets(__FUNCTION__, $this->data, $this->data['widget']);

            $this->load_view();

		} else {
			$this->data['html'] = $this->data['error_text_datafix_modify'];
		}

		$this->load_view_output();

	}

	public function datafix_menu() {
		if (defined('SC_VERSION') && is_callable(array($this->user, 'hasPermission')) && $this->user->hasPermission('access', 'datafix/datafix')) {
			$this->load_model();
			$this->load_get_store();
			$this->load_settings();
			$this->load_language();
			$this->load_languages();
			$this->load_language_get();
			$this->load_set();
			$this->load_custore_groups();
			$this->load_layouts();
			$this->load_url_link();

			if (isset($this->data['datafix_settings']['menu_status']) && $this->data['datafix_settings']['menu_status']) {

				$this->data['menus'] = array();
				$this->data['menus_children'] = array();

				if (isset($this->data['datafix_settings']['menu_order']) && $this->data['datafix_settings']['menu_order']) {
					$menu_order = $this->data['datafix_settings']['menu_order'];
				} else {
					$menu_order = 999;
				}

				if (isset($this->data['datafix_settings']['status']) && $this->data['datafix_settings']['status']) {
					$this->data['datafix_name_status'] = $this->language->get('text_datafix_datafix_status_on');
				} else {
					$this->data['datafix_name_status'] = $this->language->get('text_datafix_datafix_status_off');
				}

				$text_datafix_loading_main = $this->data['text_datafix_loading_main'];

				$text_datafix_cacheremove = $this->language->get('text_datafix_cacheremove');
				$text_datafix_cacheremove_success = $this->language->get('text_datafix_cacheremove_success');
				$text_datafix_cacheremove_fail = $this->data['text_datafix_cacheremove_fail'];

				$text_datafix_ocmodrefresh = $this->data['text_datafix_ocmodrefresh'];
				$text_datafix_ocmodrefresh_success = $this->data['text_datafix_ocmodrefresh_success'];
				$text_datafix_ocmodrefresh_fail = $this->data['text_datafix_ocmodrefresh_fail'];

				$url_cacheremove = str_ireplace('&amp;', '&', $this->data['url_cacheremove']);
				$url_ocmodrefresh = str_ireplace('&amp;', '&', $this->data['url_ocmodrefresh']);

$this->data['name_cacheremove'] = <<<EOF
$text_datafix_cacheremove<div id="datafix_div_cache_refresh"></div>
EOF;
if ($this->validate()) {
$this->data['menu_url_cacheremove'] = <<<EOF
#" onclick="$.ajax({
	url: '$url_cacheremove',
	dataType: 'html',
	beforeSend: function()
	{
       $('#datafix_div_cache_refresh').html('$text_datafix_loading_main');
	},
	success: function(content) {
		if (content) {
			$('#datafix_div_cache_refresh').html('<span style=\'color:#caeaad\'>$text_datafix_cacheremove_success<\/span>');
			setTimeout('$(\'#datafix_div_cache_refresh\').html(\'\')', 1000);
		}
	},
	error: function(content) {
		$('#datafix_div_cache_refresh').html('<span style=\'color:red\'>$text_datafix_cacheremove_fail<\/span>');
	}
}); return false;" style="
EOF;
} else {
	$this->data['menu_url_cacheremove'] = '#" onclick="return false;" ';
}


$this->data['name_ocmodrefresh'] = <<<EOF
$text_datafix_ocmodrefresh<div id="datafix_div_ocmod_refresh"></div>
EOF;

$this->data['menu_url_ocmodrefresh'] = <<<EOF
#" onclick="
$.ajax({
	url: '$url_ocmodrefresh',
	dataType: 'html',
	beforeSend: function()
	{
       $('#datafix_div_ocmod_refresh').html('$text_datafix_loading_main');
	},
	success: function(content) {
		if (content) {
			$('#datafix_div_ocmod_refresh').html('<span style=\'color:#caeaad\'>$text_datafix_ocmodrefresh_success<\/span>');
			setTimeout('$(\'#datafix_div_ocmod_refresh\').html(\'\')', 1000);
		}
	},
	error: function(content) {
		$('#datafix_div_ocmod_refresh').html('<span style=\'color:red\'>$text_datafix_ocmodrefresh_fail<\/span>');
	}
}); return false;" style="
EOF;

		        $this->data['menus_id'] = 'menu-datafix';

				$this->data['menus_children'][] = array(
					'name'	   => $this->data['datafix_name_status'],
					'href'     => $this->data['url_main'],
					'children' => array()
				);
				$this->data['menus_children'][] = array(
					'name'	   => $this->data['name_cacheremove'],
					'href'     => $this->data['menu_url_cacheremove'],
					'children' => array()
				);
				$this->data['menus_children'][] = array(
					'name'	   => $this->data['name_ocmodrefresh'],
					'href'     => $this->data['menu_url_ocmodrefresh'],
					'children' => array()
				);


				if (SC_VERSION > 23) {
					$this->data['url_main'] = false;
				}

		        if (is_array($this->data['menus']) && $this->data['menus_children']) {
					$this->data['menus'][$menu_order] = array(
						'id'       => $this->data['menus_id'],
						'icon'	   => $this->data['ico_datafix'],
						'name'	   => strip_tags($this->language->get('heading_title')),
						'href'     => $this->data['url_main'],
						'children' => $this->data['menus_children']
					);
				}

		        $this->data['template'] = 'datafix/menu';

				$this->data = $this->method_widgets(__FUNCTION__, $this->data);

		        $this->load_view();

				return $this->data['html'];
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

    public function install_ocmod_settings() {

		if (!isset($this->data['widgets_ocmod']) || empty($this->data['widgets_ocmod'])) {

			$this->data['widgets_ocmod'][] =
			array(
				'file' => DIR_APPLICATION . 'controller/datafix/datafix.ocmod.xml',
				'name' => $this->language->get('ocmod_datafix_name'),
				'id' => $this->language->get('ocmod_datafix_name'),
				'mod' => $this->language->get('ocmod_datafix_mod'),
				'version' => $this->language->get('datafix_version'),
				'author' => $this->language->get('ocmod_datafix_author'),
				'link' => $this->language->get('ocmod_datafix_link'),
				'html' => $this->language->get('ocmod_datafix_html'),
				'status' => 0,
				'switch' => array('all' => array($this->data['datafix_settings']['status']))
			);

			$this->data['widgets_ocmod'][] =
			array(
				'file' => DIR_APPLICATION . 'controller/datafix/datafix_two.ocmod.xml',
				'name' => $this->language->get('ocmod_datafix_two_name'),
				'id' => $this->language->get('ocmod_datafix_two_name'),
				'mod' => $this->language->get('ocmod_datafix_two_mod'),
				'version' => $this->language->get('datafix_version'),
				'author' => $this->language->get('ocmod_datafix_author'),
				'link' => $this->language->get('ocmod_datafix_link'),
				'html' => $this->language->get('ocmod_datafix_two_html'),
				'status' => 0,
				'switch' => array('all' => array($this->data['datafix_settings']['status'], $this->data['datafix_settings']['datafix_two_status']))

			);

			$this->data['widgets_ocmod_menu'][] =
			array(
				'file' => DIR_APPLICATION . 'controller/datafix/datafix_menu.ocmod.xml',
				'name' => $this->language->get('ocmod_datafix_menu_name'),
				'id' => $this->language->get('ocmod_datafix_menu_name'),
				'mod' => $this->language->get('ocmod_datafix_menu_mod'),
				'version' => $this->language->get('datafix_version'),
				'author' => $this->language->get('ocmod_datafix_author'),
				'link' => $this->language->get('ocmod_datafix_link'),
				'html' => $this->language->get('ocmod_datafix_menu_html'),
				'status' => 0,
				'switch' => array('all' => array($this->data['datafix_settings']['status'], $this->data['datafix_settings']['menu_status']),
								  'one' => array($this->data['datafix_settings']['menu_status']))

			);

			$this->data['widgets_ocmod'] = array_merge($this->data['widgets_ocmod'], $this->data['widgets_ocmod_menu']);

			$this->data = $this->method_widgets(__FUNCTION__, $this->data);
		}
        return $this;
	}


	public function install_ocmod_widgets() {
		$this->load_model();
		$this->load_get_store();
		$this->load_settings();
		$this->load_language();
		$this->load_languages();
		$this->load_language_get();
		$this->load_set();
		$this->load_custore_groups();
		$this->load_layouts();

		if (($this->request->server['REQUEST_METHOD'] == 'GET') && $this->validate()) {

                $this->createTables();

                $this->data['html'] .= '<br>';

	            if (SC_VERSION > 23) {
	            	$mod_controller = 'marketplace';
	               	$modification_model = 'setting';
	           	} else {
	               	$mod_controller = 'extension';
	               	$modification_model = 'extension';
	           	}

        		$url_ocmodrefresh = str_replace('&amp;', '&', $this->url->link($mod_controller .'/modification/refresh&' . $this->data['token_name'].'=' . $this->session->data[$this->data['token_name']], '', $this->data['url_link_ssl']));

                $this->install_ocmod_settings();

                $this->data['html'] = $this->install_ocmod($this->data['widgets_ocmod']);


				$this->data['html'] .= <<<EOF
					<script>
						$.ajax({url: '$url_ocmodrefresh',
									dataType: 'html',
									beforeSend: function() {
										$('#div_ocmod_refresh_install').html('LOADING');
									},
									success: function(content) {
										if (content) {
											$('#div_ocmod_refresh_install').html('SUCCESS');
	                                    	setTimeout('delayer()', 2000);
										}
									},
									error: function(content) {
										$('#div_ocmod_refresh_install').html('ERROR');
									}
								});
					</script>

EOF;
                $this->data['html'] = str_replace('LOADING', html_entity_decode($this->data['text_datafix_loading_main'], ENT_QUOTES, 'UTF-8'), $this->data['html']);
                $this->data['html'] = str_replace('SUCCESS', html_entity_decode($this->data['text_datafix_ocmodrefresh_success'], ENT_QUOTES, 'UTF-8'), $this->data['html']);
                $this->data['html'] = str_replace('ERROR', html_entity_decode($this->data['text_datafix_ocmodrefresh_fail'], ENT_QUOTES, 'UTF-8'), $this->data['html']);

        } else {
			$this->data['html'] .= $this->data['error_text_datafix_modify'];
		}
        $this->data = $this->method_widgets(__FUNCTION__, $this->data);

        $this->response->setOutput($this->data['html']);

    }

	public function load_ocmod_check() {
        $this->data['widgets_ocmod_swith'] = false;

		if (isset($this->data['widgets_ocmod']) && !empty($this->data['widgets_ocmod'])) {

			foreach ($this->data['widgets_ocmod'] as $number => $widget) {
	        	$ocmod_status = $this->check_ocmod_switch($widget);

				$mod_mod = $this->model_datafix_mod->getModId($widget['mod']);

			    if ($mod_mod['status'] != $ocmod_status) {

                    $this->data['widgets_ocmod_swith'] = true;

					$this->mod_on_off($widget['mod'], $ocmod_status);

					if ($ocmod_status) {
		            	if (isset($this->session->data['success'])) {
		            		$this->session->data['success'] .= '<br>';
		            	} else {
		            		$this->session->data['success'] = '';
		            	}
		            	$this->session->data['success'] .= $widget['name'] . ' - ' . $this->language->get('text_datafix_ocmod') . ' ' .  $this->language->get('ocmod_datafix_text_on');
		            } else {
		            	if (!isset($this->session->data['error_warning'])) {
		            		$this->session->data['error_warning'] = '';
		            	} else {
		            		$this->session->data['error_warning'] .= '<br>';
		            	}
		            	$this->session->data['error_warning'] .= $widget['name'] . ' - ' . $this->language->get('text_datafix_ocmod') . ' ' . $this->language->get('ocmod_datafix_text_off');
		            }

			    }
			}
		}
		return $this;
	}

	private function check_ocmod_switch($widget) {
		if (isset($widget['switch']['all']) && !empty($widget['switch']['all'])) {
		    foreach($widget['switch']['all'] as $num => $status) {
		    	$swith_all = false;
		    	if ($status) {
		    		$swith_all = true;
		    	} else {
		    		break;
		    	}
		    }
		}

		if (isset($widget['switch']['one']) && !empty($widget['switch']['one'])) {
		    $swith_one = false;
		    foreach($widget['switch']['one'] as $num => $status) {
		    	if ($status) {
		    		$swith_one = true;
		    		break;
		    	}
		    }
		}

		$swith_on = false;
		if (isset($swith_all) && $swith_all) {
			$swith_on = true;
		}

		if (isset($swith_one) && $swith_one) {
			$swith_on = true;
		} else {
			if (isset($swith_one)) {
				$swith_on = false;
			}
		}

		return $swith_on;
	}


	private function install_ocmod($widgets) {
           // array $widget
           // $widget['file'] - full path ocmod file
           // $widget['name'] - {NAME}
           // $widget['mod'] - {MOD}
           // $widget['id'] - {ID}
           // $widget['version'] - {VERSION}
           // $widget['author'] - {AUTHOR}
           // $widget['link'] - link author site
           // $widget['html'] - html output on success install

           	if (SC_VERSION > 23) {
            	$mod_controller = 'marketplace';
               	$modification_model = 'setting';
           	} else {
               	$mod_controller = 'extension';
               	$modification_model = 'extension';
           	}
           	$http_server_array = explode('/', HTTP_SERVER);

	        foreach ($widgets as $number => $widget) {

	        	if (file_exists($widget['file'])) {

                	$mod_content = file_get_contents($widget['file']);

                    $files_extension_ocmod = glob($widget['file'] . '.*');
                     if (!empty($files_extension_ocmod)) {
                     	foreach($files_extension_ocmod as $num => $filename_ocmod) {
                     		$version_filename_ocmod = substr(strrchr($filename_ocmod, '.'), 1);
                     		$version_filename_ocmod_array = explode('_', $version_filename_ocmod);
                     		foreach ($version_filename_ocmod_array as $num_array => $version_oc) {
                     			if (substr(SC_VERSION, 0, 1) == trim($version_oc) || SC_VERSION == trim($version_oc)) {
				                    if (file_exists($filename_ocmod)) {
				                    	$mod_content_version = file_get_contents($filename_ocmod);
				                        $mod_content = str_ireplace('</modification>', $mod_content_version . '</modification>', $mod_content);
				                        $mod_content_version = '';
				                    }
                     			}
                     		}
                     	}
                     }

	            	$mod_content = str_replace('{NAME}', $widget['name'], $mod_content);
	            	$mod_content = str_replace('{ID}', $widget['id'], $mod_content);
	            	$mod_content = str_replace('{MOD}', $widget['mod'], $mod_content);
	            	$mod_content = str_replace('{VERSION}', $widget['version'], $mod_content);
	            	$mod_content = str_replace('{AUTHOR}', $widget['author'], $mod_content);
                    $mod_content = str_replace('{ADMIN}', $http_server_array[3] , $mod_content);

					if (isset($widget['datafix_version']) && $widget['datafix_version'] == 15) {
						$is_15 = true;
					} else {
						$is_15 = false;
					}

                    if (SC_VERSION > 15 && !$is_15) {
		                $this->load->model('datafix/mod');
	    	            $mod_mod = $this->model_datafix_mod->getModId($widget['mod']);

                        if (!empty($mod_mod)) {
                        	$mod_id = $mod_mod['modification_id'];
                        	$widget['status'] = $mod_mod['status'];
                        } else {
                        	$mod_id = false;
                        }

						if (SC_VERSION > 23) {
		                	$mod_ext_id = $mod_mod['extension_install_id'];
		                } else {
		                	$mod_ext_id = false;
		                }

		                $mod_model = 'model_'.$modification_model.'_modification';
		                $this->load->model($modification_model.'/modification');
		                if ($mod_id) {
		                	$this->$mod_model->deleteModification($mod_id);
		                }

		                if (SC_VERSION > 23) {
		                    $this->load->model('setting/extension');
		                    $this->model_setting_extension->deleteExtensionInstall($mod_ext_id);
		                    $mod_ext_id = $this->model_setting_extension->addExtensionInstall($widget['mod'].'.ocmod.zip');
		                }

	                $mod_data['code'] = $widget['mod'];
	                $mod_data['name'] = $widget['name'];
	                $mod_data['id'] = $widget['id'];
	                $mod_data['author'] = $widget['author'];
	                $mod_data['version'] = $widget['version'];
	                $mod_data['link'] = $widget['link'];
	                $mod_data['status'] = $widget['status'];
	                $mod_data['xml'] = $mod_content;
                    $mod_data['extension_install_id'] = $mod_ext_id;

	                $this->$mod_model->addModification($mod_data);

	                } else {
	                	if (is_dir(DIR_SYSTEM . "../vqmod/xml")) {
	                    	file_put_contents(DIR_SYSTEM . "../vqmod/xml/" . $widget['mod'] . ".ocmod.xml", $mod_content);
	                	}
	                }

                    $swith_on = $this->check_ocmod_switch($widget);

                    $this->mod_on_off($widget['mod'], $swith_on);

                    $this->data['html'] .= $widget['html'];
                    if ($swith_on) {
                    	$this->data['html'] .= ' - ' . $this->language->get('ocmod_datafix_text_on');
                    } else {
                    	$this->data['html'] .= ' - ' . $this->language->get('ocmod_datafix_text_off');
                    }

                    $this->data['html'] .= '<br>';

	        	} else {
	        		$this->data['html'] .= $widget['html'] . ' - install error';
	        	}
	        }
            return $this->data['html'];
	}

	private function mod_on_off($modificator, $on = true) {

		if (SC_VERSION > 15) {
            $this->load->model('datafix/mod');
			$mod_mod = $this->model_datafix_mod->getModId($modificator);

            if (isset($mod_mod['modification_id']) && $mod_mod['modification_id']) {

				if (SC_VERSION > 23) {
					$mod_controller = 'marketplace';
				   	$modification_model = 'setting';
				} else {
				   	$mod_controller = 'extension';
				   	$modification_model = 'extension';
				}

			    $mod_id = $mod_mod['modification_id'];
		        $mod_status = $mod_mod['status'];

				if (SC_VERSION > 23) {
					$mod_ext_id = $mod_mod['extension_install_id'];
				} else {
					$mod_ext_id = false;
				}

				$mod_model = 'model_'.$modification_model.'_modification';
				$this->load->model($modification_model.'/modification');

		        if ($on == true) {
		        	$this->$mod_model->enableModification($mod_id);
		        	return true;
		        } else {
		        	$this->$mod_model->disableModification($mod_id);
		        	return false;
		        }

	        } else {
	        	return false;
	        }
		} else {
			if ($on == true) {
				if (is_dir(DIR_SYSTEM . "../vqmod/xml")) {
			    	if (!file_exists(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml")) {
			    		if (file_exists(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_")) {
			    			copy(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_", DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml");
			    			unlink(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_");
			    			return true;
			    		}
			    	} else {
			    		return false;
			    	}
			    }

			} else {
				if (is_dir(DIR_SYSTEM . "../vqmod/xml")) {
			    	if (file_exists(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml")) {
			    		if (file_exists(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_")) {
			    			unlink(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_");
			    		}
                        copy(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml", DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml_");
                        unlink(DIR_SYSTEM . "../vqmod/xml/" . $modificator . ".ocmod.xml");
                        return true;
			    	} else {
			    		return false;
			    	}
			    }
			}
		}
	}
	public function cacheremove($ajax_message = true) {
		if ($this->validate()) {

            if (is_array($ajax_message)) $ajax_message = true;

			$status = false;
			$html = '';

	        $exceptionizer = new PHP_Exceptionizer(E_ALL);
			$this->language->load('datafix/datafix');

            $status = true;

			if (!isset($this->request->get['image'])) {
				$dir_for_clear = DIR_CACHE;
			} else {
				$dir_for_clear = DIR_IMAGE . 'cache/';
			}

			if (isset($this->request->get['mod'])) {
				$dir_root = str_ireplace('/system/', '', DIR_SYSTEM);
  				$dir_for_clear = $dir_root.'/vqmod/vqcache/';

  				if (!is_dir($dir_for_clear)) {
  					$html.= $this->language->get('text_datafix_cacheremove_fail');
  					$status = false;
  				}
			}
            if ($status) {
		        $files = $this->getDelFiles($dir_for_clear, '*', array('index.html', '.htaccess'));
				if ($files) {
					foreach ($files as $file) {
						if (file_exists($file)) {
						    try {
								unlink($file);
								$status = true;
						    }  catch (E_WARNING $e) {
		                     	$status = false;
						    }
						}
					}
				}
			}

	        if ($status) {
	        	$html.= $this->language->get('text_datafix_cacheremove_success');
	        } else {
	        	$html.= $this->language->get('text_datafix_cacheremove_fail');
	        }

		} else {
			$html = $this->language->get('error_text_datafix_modify');
		}

		if (!$ajax_message) {
			$html = '';
		}
		$this->response->setOutput($html);
	}

	private function getDelFiles($dir, $ext = "*", $exp = array()) {
		$files = Array();

        $exceptionizer = new PHP_Exceptionizer(E_ALL);
		try {
		    $handle = opendir($dir);
		    $subfiles = Array();
		    while (false !== ($file = readdir($handle))) {
		      if ($file != '.' && $file != '..') {
		        if (is_dir($dir.'/'.$file)) {

		          $subfiles = $this->getDelFiles($dir.'/'.$file, $ext);
	              $this->delTree($dir.'/'.$file);
		          $files = array_merge($files,$subfiles);
		        } else {
			        $flie_name = $dir.'/'.$file;
			        $flie_name = str_replace('//', '/',$flie_name);
			        if ((substr($flie_name, strrpos($flie_name, '.')) == $ext) || ($ext == '*')) {
						if (!in_array($file, $exp)) {
							$files[] = $flie_name;
						}
					}
		        }
		      }
		    }
		    closedir($handle);
			$status = true;
		}  catch (E_WARNING $e) {
            $status = false;
		}
	    return $files;
	}

	private function delTree($dir) {

		if (function_exists('modification')) {
			require_once(modification(DIR_SYSTEM . 'library/exceptionizer.php'));
		} else {
			require_once(DIR_SYSTEM . 'library/exceptionizer.php');
		}

	    $exceptionizer = new PHP_Exceptionizer(E_ALL);
	    try {
			$files = array_diff(scandir($dir), array('.','..'));
			foreach ($files as $file) {
			  (is_dir("$dir/$file")) ? $this->delTree("$dir/$file") : unlink("$dir/$file");
			}
			return rmdir($dir);
			$status = true;
	    }  catch (E_WARNING $e) {
	       	$status = false;
	    }
	}
    public function check_ver() {
	        $this->load_model();
	        $this->load_get_store();
	        $this->load_settings();
	        $this->load_language();
	        $this->load_languages();
	        $this->load_language_get();
	        $this->load_set();
	        $this->load_custore_groups();
	        $this->load_layouts();


        if (!$this->validate()) {
	        $html = $this->data['error_text_datafix_modify'];
	        $this->response->setOutput($html);
	        return;
        }

        $data_check = $this->datafix_check(0);

    	$text_datafix_currnent_version = $data_check['text_datafix_currnent_version'];
    	$text_datafix_server_version = $data_check['text_datafix_server_version'];
        $text_datafix_server_date = $data_check['datafix_server_response_date'];
        $text_datafix_new_version = $data_check['text_datafix_new_version'];

        $server_ver_array = explode(' ', $text_datafix_server_version);
        $current_ver_array = explode(' ', $text_datafix_currnent_version);
        $server_ver_float = (float)$server_ver_array[0];
		if (is_float($server_ver_float) && $server_ver_float > 0) {
			if ((float)$server_ver_array[0] > (float)$current_ver_array[0]) {
				$text_datafix_update = $this->data['text_datafix_update_yes'];
			} else {
				$text_datafix_update = $this->data['text_datafix_update_no'];
			}
		} else {
			$text_datafix_update = $this->data['text_datafix_error_server_connect'];
		}

    	$html = $this->data['text_datafix_server_date_state'] . ' ' . $text_datafix_server_date . '<br>' .
    			$this->data['text_datafix_current_version_text'] . ' ' . $text_datafix_currnent_version . ' ' . '<br>' .
    			$this->data['text_datafix_last_version_text'] . ' ' . $text_datafix_server_version . ' ' . '<br>' .
    			$text_datafix_update;

	    $this->response->setOutput($html);
    }

	public function datafix_check($days = 7) {
		$data = $this->data;
		$data['datafix_version'] = $this->data['datafix_version'];
	    $data['datafix_model'] = $this->data['datafix_model'];

        $data['datafix_server_response_content'] = $this->model_datafix_datafix->getSetting('datafix_server_response_content');
        $data['datafix_server_response_date'] = $this->model_datafix_datafix->getSetting('datafix_server_response_date');

        $date_current = date('d-m-Y');

        if (!empty($data['datafix_server_response_date'])) {
        	$date_diff = ((strtotime($date_current) - strtotime($data['datafix_server_response_date']))/3600/24);
        } else {
        	$date_diff = $days;
        }

        if ($date_diff >= $days) {

	        $response = $this->server_check();
    	    $data['datafix_server_response_content'] = $response['content'];
        	$data['datafix_server_response_status'] = $response['status'];
        	$data['datafix_server_response_date'] = $date_current;
        }
		if (isset($data['datafix_version']) && isset($data['datafix_model']) && $data['datafix_version'] . ' ' .  $data['datafix_model'] != $data['datafix_server_response_content']) {
        	$data['text_datafix_new_version'] = $this->data['text_datafix_new_version'] . " <span style='color: #000; font-weight: normal;'>(" . $data['datafix_server_response_date'].")</span>" . $data['datafix_server_response_content'] . $this->data['text_datafix_new_version_end'];
		} else {
			$data['text_datafix_new_version'] = '';
		}
    	$data['text_datafix_currnent_version'] = $data['datafix_version'] . ' ' . $data['datafix_model'];
    	$data['text_datafix_server_version'] = $data['datafix_server_response_content'];
        $data['text_datafix_new_version'] = $this->data['text_datafix_update_version_begin']." <span style='font-size: 11px; color: #909090; font-weight: normal;'>(".$data['datafix_server_response_date'].")</span> " . $data['datafix_server_response_content'] . $this->data['text_datafix_update_version_end'];
		$data['datafix_version'] = $datafix_version = $this->data['datafix_version'];

        $this->data = $data;

		return $this->data;
	}


	public function server_check() {

        $this->load->model('setting/setting');
        $data = $this->data;

		$data['datafix_version'] = $this->data['datafix_version'];
	    $data['datafix_model'] = $this->data['datafix_model'];

        $this->model_datafix_datafix->editSetting('datafix_server_response_content', array(''));
	    $this->model_datafix_datafix->editSetting('datafix_server_response_date', array(date('d-m-Y')));

		if (isset($_SERVER['REMOTE_ADDR'])) $ip = $_SERVER['REMOTE_ADDR']; else $ip = '';
	    $store_info = $this->model_setting_setting->getSetting('config', 0);
	    if (isset($store_info['config_email'])) { $email = $store_info['config_email']; } else { $email = ''; }

		$currnet['version'] = $this->data['datafix_version'];
		$current['model'] = $this->data['datafix_model'];
	    $current['language'] = $this->config->get('config_language');
	    $current['ip'] = $ip;
	    $current['email'] = $email;
	    $current['date'] = date('d-m-Y');
	    $currnet['opencart'] = VERSION;
		if ($this->data['url_link_ssl']) {
			$current['server'] = HTTPS_CATALOG;
		} else {
			$current['server'] = HTTP_CATALOG;
		}

		$server['url'] = $this->data['datafix_ocas'];

		$post_data = array('catalog' => $current['server'], 'ver' => $currnet['version'], 'model' => $current['model'], 'email' => $current['email'], 'lang' => $current['language'], 'ip' => $current['ip'], 'date' => $current['date'], 'domen' => $current['server'], 'opencart' => $currnet['opencart']);
		$query = http_build_query($post_data);
		$server['request'] = "Content-Type: application/x-www-form-urlencoded\r\n";
		$server['options'] = array( 'http' =>
		array('method' => 'POST',
		'header' => $server['request'],
		'content' => $query));
		$stream_context = stream_context_create($server['options']);

	    $exceptionizer = new PHP_Exceptionizer(E_ALL);
		try {
            try {
            	$response['content'] = file_get_contents($server['url'], FALSE , $stream_context);
            }  catch (E_WARNING $e) {
				$ch = curl_init($server['url']);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
				$response['content'] = curl_exec($ch);
				curl_close($ch);
	        }

	    	$response['content'] = htmlspecialchars(strip_tags(html_entity_decode($response['content'], ENT_QUOTES, 'UTF-8')), ENT_COMPAT, 'UTF-8');
		    $response['status'] = true;
	        $this->model_datafix_datafix->editSetting('datafix_server_response_date', array(date('d-m-Y')));
   	        $this->model_datafix_datafix->editSetting('datafix_server_response_content', array($response['content']));

		}  catch (E_WARNING $e) {
		 	$response['content'] = '';
		 	$response['status'] = false;
		}
		return $response;
	}

	public function install() {

        $this->create_table();

		$this->load->model('user/user_group');

		$user_groups = $this->model_user_user_group->getUserGroups();

		if (!empty($user_groups)) {
    	    $group = '';
	        $count_modify = 0;
			foreach($user_groups as $num => $user_group) {
				if (SC_VERSION < 21) {
					$permissions = unserialize($user_group['permission']);
				} else {
					$permissions = json_decode($user_group['permission'], true);
				}
	            //Administrator has more access to files. Who has more rights, that and dad
		        if (isset($permissions['modify']) && (count($permissions['modify']) > $count_modify)) {
					$count_modify = count($permissions['modify']);
					$group = (int)$user_group['user_group_id'];
		        }
			}
	        if ($group != '') {
	        	// For the chief administrator who has the most rights
				$this->model_user_user_group->addPermission((int)$group, 'access', 'datafix/datafix');
				$this->model_user_user_group->addPermission((int)$group, 'modify', 'datafix/datafix');
				$this->model_user_user_group->addPermission((int)$group, 'access', 'extension/module/datafix');
				$this->model_user_user_group->addPermission((int)$group, 'modify', 'extension/module/datafix');
				$this->model_user_user_group->addPermission((int)$group, 'access', 'module/datafix');
				$this->model_user_user_group->addPermission((int)$group, 'modify', 'module/datafix');
				if (SC_VERSION > 15) {
	                // For the current user group from which the installation was made
	                if ((int)$group != $this->user->getGroupId()) {
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'datafix/datafix');
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'datafix/datafix');
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/module/datafix');
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/module/datafix');
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'module/datafix');
						$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'module/datafix');
					}
				}
			}
		}
	}

	public function uninstall() {

		if ($this->validate()) {
	        $this->load_model();
	        $this->load_get_store();
	        $this->load_settings();
	        $this->load_language();
	        $this->load_languages();
	        $this->load_language_get();
	        $this->load_set();
	        $this->load_custore_groups();
	        $this->load_layouts();

			$this->load->model('user/user_group');

			$user_groups = $this->model_user_user_group->getUserGroups();

			if (!empty($user_groups)) {
				foreach($user_groups as $num => $user_group) {
					if (SC_VERSION < 21) {
						$permissions = unserialize($user_group['permission']);
					} else {
						$permissions = json_decode($user_group['permission'], true);
					}
					if (SC_VERSION > 15) {
						if (!empty($permissions['access'])) {
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'access', 'datafix/datafix');
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'access', 'extension/module/datafix');
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'access', 'module/datafix');
						}
						if (!empty($permissions['modify'])) {
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'modify', 'datafix/datafix');
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'modify', 'extension/module/datafix');
							$this->model_user_user_group->removePermission((int)$user_group['user_group_id'], 'modify', 'module/datafix');
						}
					}
				}
			}
            $this->install_ocmod_settings();
            foreach($this->data['widgets_ocmod'] as $num => $widget) {
            	$this->data['widgets_ocmod'][$num]['switch'] = array('all' => false);
            }
			$this->load_ocmod_check();
			//$this->install_ocmod_widgets();
		}
	}

}
}

if (!function_exists('printmy')) {
	function printmy($data) {
		print_r('<pre>');
		print_r($data);
		print_r('</pre>');
	}
}