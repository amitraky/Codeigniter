<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login Page | <?php echo SITE_NAME?></title>
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.default.css" type="text/css" />
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.uniform.min.js"></script>

<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.validate.min.js"></script>


<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/index.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/general.js"></script>
<!--[if IE 9]>
    <link rel="stylesheet" media="screen" href="css/style.ie9.css"/>
<![endif]-->
<!--[if IE 8]>
    <link rel="stylesheet" media="screen" href="css/style.ie8.css"/>
<![endif]-->
<!--[if lt IE 9]>
	<script src="<?php echo base_url()?>assets/http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<?php 

$this->load->view("Auth/".$page); ?>