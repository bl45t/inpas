<?php
$_['datafix_version'] = '2.0';
$_['datafix_model'] = 'SEO DATAFIX';

if (!defined('SC_VERSION')) define('SC_VERSION', (int)substr(str_replace('.','',VERSION), 0,2));

if (SC_VERSION > 22) {
	if (file_exists(DIR_APPLICATION. 'controller/module/datafix.php')) {
		@unlink(DIR_APPLICATION. 'controller/module/datafix.php');
	}
}
if (SC_VERSION < 22) {
	if (file_exists(DIR_APPLICATION. 'controller/extension/module/datafix.php')) {
		@unlink(DIR_APPLICATION. 'controller/extension/module/datafix.php');
	}
	$files_extension_module = glob(DIR_APPLICATION. 'controller/extension/module/*.*');
	if (!$files_extension_module && is_dir(DIR_APPLICATION. 'controller/extension/module')) {
    	rmdir(DIR_APPLICATION. 'controller/extension/module');
	}
}