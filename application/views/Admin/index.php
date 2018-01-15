<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login Page | <?php echo SITE_NAME?></title>
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.default.css" type="text/css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.custom.css" type="text/css" />
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/general.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/tables.js"></script>

<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.alerts.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/elements.js"></script>

<!--script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.flot.min.js"></script-->
<!--script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.flot.resize.min.js"></script-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery.slimscroll.js"></script>
<!--script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/dashboard.js"></script-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom/forms.js"></script>

<!--[if IE 9]>
    <link rel="stylesheet" media="screen" href="css/style.ie9.css"/>
<![endif]-->
<!--[if IE 8]>
    <link rel="stylesheet" media="screen" href="css/style.ie8.css"/>
<![endif]-->
<!--[if lt IE 9]>
	<script src="<?php echo base_url()?>assets/http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<script> function base_url(url=null){return '<?php echo base_url('')?>'+url;} 

</script>
<style>
r{
     color: #f00;
    font-size: 14px;
    margin: 0px 5px 17px 5px;
}



.label-danger {
    background-color:#eb574c;
}
.label-info {
    background-color:#03a9f4;
}

.label-success {
    background-color:#367e39;
}

.label-pending {
    background-color:#ff9800;
}

.label {
    display: inline;
    padding: .3em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}
</style>

 


</head>
<body class="withvernav">

<div class="bodywrapper">
    <div class="topheader">
        <div class="left">
            <h1 class="logo">Hubs<span>Wallet</span></h1>
            <span class="slogan">Admin Panel</span>
            
            <!--search-->
            
            <br clear="all" />
            
        </div><!--left-->
        
        <div class="right">
        	<div class="notification">
                <a class="count" href="ajax/notifications.html"><span>9</span></a>
        	</div>
            <div class="userinfo">
           
            	<img src="<?php echo base_url('assets/uploaded/photo/'.$this->session->userdata['logged_in']['photo'])?>" alt="" />
                <span><?php echo $this->session->userdata['logged_in']['name'] ?></span>
            </div><!--userinfo-->
            
            <div class="userinfodrop">
            	<div class="avatar">
                	<a href="#"><img src="<?php echo base_url('assets/uploaded/photo/thumbs/'.$this->session->userdata['logged_in']['photo'])?>" alt="" /></a>
                    <div class="changetheme">
                    	Change theme: <br />
                    	<a class="default"></a>
                        <a class="blueline"></a>
                        <a class="greenline"></a>
                        <a class="contrast"></a>
                        <a class="custombg"></a>
                    </div>
                </div><!--avatar-->
                
                <div class="userdata">
                	<h4><?php echo $this->session->userdata['logged_in']['logid'] ?></h4>
                    <span class="email"><?php $this->session->userdata['logged_in']['email'] ?></span>
                    <ul>
                    	<li><a href="<?php echo base_url('Admin/profile')?>">Edit Profile</a></li>
                        <li><a href="<?php echo base_url('Admin/profile')?>">Account Settings</a></li>
                        <li><a href="<?php echo base_url('Admin/Helps')?>">Helps</a></li>
                        <li><a href="<?php echo base_url('Auth/logout')?>">Sign Out</a></li>
                    </ul>
                </div><!--userdata-->
            </div><!--userinfodrop-->
        </div><!--right-->
    </div><!--topheader-->
    
    
    <div class="header">
    	<ul class="headermenu">
        	<li class="current"><a href="<?php echo base_url('Admin/dashboard')?>"><span class="icon icon-flatscreen"></span>Dashboard</a></li>
           
        </ul>
        
        <div class="headerwidget">
        	<div class="earnings" style="    min-width: 300px;">

            	<div class="one_half" style="margin-right:-15%">
                	<h4>Today's Buy</h4>
                    <h2>$0.00</h2>
                </div><!--one_half-->
 <div class="one_half" style="margin-right:-37%">
                	<h4>Today's Sell</h4>
                    <h2>$0.00</h2>
                </div><!--one_half-->

                <div class="one_half last alignright" style="margin-right:-25%">
                	<h4>Today's Exchange</h4>
                   <h2>$0.00</h2>
                </div><!--one_half last-->
                  
            </div><!--earnings-->


        </div><!--headerwidget-->
        
        
    </div><!--header-->
       <?php $uri = $this->uri->segment(2)?>
    <div class="vernav2 iconmenu">
    	<ul>
        	<li class="<?php if($uri=='dashboard')echo 'current'; ?>"><a href="<?php echo base_url('Admin/dashboard')?>" class="editor">Dashboard</a></li>
            
             <li class="<?php if($uri=='country'||$uri=='currency'||$uri=='currency_rate'||$uri=='transaction_type')echo 'current'; ?>"><a href="#master" class="elements">Master</a>
            	<span class="arrow"></span>
            	<ul id="master">
               		<li class="<?php if($uri=='country')echo 'current'; ?>"><a href="<?php echo base_url('Admin/country')?>">Country</a></li>
                    <li class="<?php if($uri=='currency')echo 'current'; ?>"><a href="<?php echo base_url('Admin/currency')?>">Currency Master</a></li>
                    <li class="<?php if($uri=='currency_rate')echo 'current'; ?>"><a href="<?php echo base_url('Admin/currency_rate')?>">Currency Rate</a></li>
                     <li class="<?php if($uri=='transaction_type')echo 'current'; ?>"><a href="<?php echo base_url('Admin/transaction_type')?>">Transaction Type</a></li>
                </ul>
            </li>
            
            <li class="<?php if($uri=='users' || $uri=='registration')echo 'current'; ?>"><a href="#users" class="widgets">Users</a>
            	<span class="arrow"></span>
            	<ul id="users" >
                    <li class="<?php if($uri=='registration')echo 'current'; ?>"><a href="<?php echo base_url('Admin/registration')?>">Registration</a></li>
               		<li class="<?php if($uri=='users')echo 'current'; ?>"><a href="<?php echo base_url('Admin/users')?>">All User</a></li>
                </ul>
            </li>
            
            <li class="<?php if($uri=='sell'||$uri=='buy'||$uri=='exchange'||$uri=='invoice')echo 'current'; ?>"><a href="#transactions" class="widgets">Transaction</a>
            	<span class="arrow"></span>
            	<ul id="transactions" >
               		<li class="<?php if($uri=='sell')echo 'current'; ?>"><a href="<?php echo base_url('Admin/sell')?>">Sell</a></li>
                    <li class="<?php if($uri=='buy')echo 'current'; ?>"><a href="<?php echo base_url('Admin/buy')?>">Buy</a></li>
                    <li class="<?php if($uri=='exchange')echo 'current'; ?>"><a href="<?php echo base_url('Admin/exchange')?>">Exchange</a></li>
                </ul>
            </li>
            
             <li class="<?php if($uri=="setting") echo "current"; ?>"><a href="<?php echo base_url('Admin/setting')?>" class="widgets">Setting</a></li>
            <li  class="<?php if($uri=="profile")  echo "current"; ?>"><a href="<?php echo base_url('Admin/profile')?>" class="widgets">Edit Profile</a></li>
            
             
        </ul>
        <a class="togglemenu"></a>
        <br /><br />
    </div><!--leftmenu-->
<?php $this->load->view("Admin/".$page); ?>