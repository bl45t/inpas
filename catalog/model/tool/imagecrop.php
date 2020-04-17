<?php
// class for image crop
// author: cmd@krovatka.su

class ModelToolImagecrop extends Model {
	
	function resize ($filename, $newWidth, $newHeight, $rgb = 0xFFFFFF, $quality = 100, $cute_borders = false, $degrees = false, $c = array()) 
	{

		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		}
		
		$info = pathinfo($filename);
		$extension = $info['extension'];
		$old_image = $filename;
		$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $newWidth . 'x' . $newHeight . '.' . $extension;
		
		if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {

			$path = '';
			
			$directories = explode('/', dirname(str_replace('../', '', $new_image)));
			
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}		
			}
			
			if ($this->img_tpl_resize(
						DIR_IMAGE . $filename, 
						DIR_IMAGE . $new_image, 
						$newWidth, 
						$newHeight, 
						$rgb, 
						$quality, 
						$cute_borders, 
						$degrees, 
						$c) === false) {
			
				return 'error on creating thumbnail!';
				
			}
		}
		

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return HTTPS_SERVER . 'image/' . $new_image;
		} else {
			return HTTP_SERVER . 'image/' . $new_image;
		}

	}
	
	function img_tpl_resize($filePath, $dest, $width, $height, $rgb, $quality, $cute_borders = false, $degrees = false, $c = array()) 
	{
	
		$size = getimagesize($filePath);
		
		if ($size === false) {
			return false;
		}
	 
		$format = strtolower(substr($size['mime'], strpos($size['mime'], '/') + 1));
		$icfunc = 'imagecreatefrom'.$format;
	 
		if (function_exists($icfunc) === false) {
			return false;
		}
			
		// this shit can have bugs
		if (!empty($c) and count($c) == 4) {
			(int)$size[0] 		= $c['x2'] - $c['x1'];
			(int)$size[1]		= $c['y2'] - $c['y1'];
			(int)$left_slide 	=  $c['x1'];
			(int)$top_slide 	=  $c['y1'];
			$new_left 			= 0 - $c['x1'];
			$new_top 			= 0 - $c['y1'];
		} else {
			(int)$left_slide 	= 0;
			(int)$top_slide 	= 0;
		}
		
		$x_ratio = $width  / $size[0];
		$y_ratio = $height / $size[1];	
		
			if ($height == 0) { 
			
			# is height = 0, then thumbnail use width
	 
			$y_ratio = $x_ratio;
			$height  = $y_ratio * $size[1];
	 
		} elseif ($width == 0) { 
		
			# is width = 0, then thumbnail use height
	 
			$x_ratio = $y_ratio;
			$width   = $x_ratio * $size[0];
	 
		}
		
		$ratio       = max($x_ratio, $y_ratio);
		$use_x_ratio = ($x_ratio == $ratio);
		$new_width   = $use_x_ratio  ? $width  : floor($size[0] * $ratio);
		$new_height  = !$use_x_ratio ? $height : floor($size[1] * $ratio);
	 
		
		if ($cute_borders === true) {
			$new_left    = $use_x_ratio  ? 0 : floor(($width - $new_width)   / 2);
			$new_top     = !$use_x_ratio ? 0 : floor(($height - $new_height) / 2);
		
			$isrc  = $icfunc($filePath);
			$idest = imagecreatetruecolor($width, $height);
		} else {
			$new_left    = $use_x_ratio  ? 0 : floor(($width - $new_width)   / 2);
			$new_top     = !$use_x_ratio ? 0 : floor(($height - $new_height) / 2);
		
			$isrc  = $icfunc($filePath);
			$idest = imagecreatetruecolor($width, $height);
		}	
		
		imagefill($idest, 0, 0, $rgb);
		imagecopyresampled($idest, $isrc, $new_left, $new_top, $left_slide, $top_slide, $new_width, $new_height, $size[0], $size[1]);
		
		if (is_numeric($degrees)) {
			$idest = imagerotate($idest, $degrees, 0);
		}
		
		if (imagejpeg($idest, $dest, $quality) === false) {
			return false;
		}
		imagedestroy($isrc);
		imagedestroy($idest);
	 
		return true;
	}

}

?>