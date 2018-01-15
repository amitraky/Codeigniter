<!DOCTYPE html>
<html lang="en">


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hubs Wallet</title>

    <!-- Favicon -->
    <link href="<?php echo base_url()?>assets/front/images/favicon.png" rel="icon">
  

    <!-- Bootstrap CSS -->
    <link href="<?php echo base_url()?>assets/front/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php echo base_url()?>assets/front/css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="<?php echo base_url()?>assets/front/css/responsive.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="<?php echo base_url()?>assets/front/https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="<?php echo base_url()?>assets/front/https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">



    <!-- Main Header start -->
    <header class="main-herader">
        <!-- Header topbar start -->
        <div class="header-topbar">
            <div class="topbar-arrow"></div>
            <div class="container">
               <!-- <div class="row">
                    <div class="col-lg-4 col-md-3 col-sm-3 col-xs-4 full-wd600 pull-left">
                        <div class="header-topbar-col text-center600">
                            <p class="res-mb-10"><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="#.">info@hubswallet.com</a>
                            </p>
                        </div>
                    </div>
                   
                
               
                    <div class="col-lg-5 col-md-5 col-sm-3 col-xs-4 full-wd600 pull-right">
                        <div class="header-topbar-col text-right text-center600">
                            <div class="register-link">
                                <a href="javascript:void(0);">Login</a>/<a href="javascript:void(0);">Register</a>
                            </div>
                        </div>
                    </div>
                    
                </div>-->
            </div>
        </div>

        <!-- Header navbar start -->
        
        <div class="header-navbar">
          <div class="container-fluid">
          <div class="mainhead">
          
                <div class="row">
                <div class="col-md-3  pull-left"> <a  href="index-one.html"><img src="<?php echo base_url()?>assets/front/images/logo.png" alt="logo">
                                </a></div>
                    <div class="col-md-6">
                        <nav class="navbar navbar-default">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                               
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations="zoomIn">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown active">
                                          <a href="<?php echo base_url('Front')?>">Home</a>
                                       
                                    </li>
                                    <li><a href="<?php echo base_url('Front/soon')?>">About</a></li>
                                     <li><a href="<?php echo base_url('Front/soon')?>">Sell</a></li>
                                    <li><a href="<?php echo base_url('Front/soon')?>">Buy</a></li>
                                   
                                    <li><a href="<?php echo base_url('Front/soon')?>">Exchange</a></li>
                                     <li><a href="<?php echo base_url('Front/plan')?>">Price</a></li>
                                      <li><a href="<?php echo base_url('Front/soon')?>">FAQ</a></li>
                                     
                                        
                                   
                                   
                                
                                  
                                </ul>
                            </div>
                        </nav>
                    </div>
                    
                    
                    
                    <div class="col-md-3 col-xs-12 nev-area">
                       <ul class="sign">
					<li><a href="<?php echo base_url("Auth");?>" class="btn btn-1"><i class="fa fa-key"></i> Log In</a></li>
					<li><a href="<?php echo base_url("Auth/registration");?>" class="btn btn-2"><i class="fa fa-sign-in"></i> Sign Up</a></li>
				</ul>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </header>

<?php  $this->load->view("Front/".$page); ?>
<section class="brand-sec">
        <div class="container">

        <div class="row">
            <div class="brnd">

                <div class="col-md-11 col-md-offset-1">

                    <div class="col-md-2 br1">
                        <img src="<?php echo base_url()?>assets/front/images/brand/1.png" class="img-responsive"></div>
                    <div class="col-md-2 br1">
                        <img src="<?php echo base_url()?>assets/front/images/brand/2.png"  class="img-responsive"></div>

                    <div class="col-md-2 br1">
                        <img src="<?php echo base_url()?>assets/front/images/brand/4.png"  class="img-responsive"></div>

                    <div class="col-md-2 br1">
                        <img src="<?php echo base_url()?>assets/front/images/brand/6.png"  class="img-responsive"></div>
                        <div class="col-md-2 br1">
                        <img src="<?php echo base_url()?>assets/front/images/brand/7.png"  class="img-responsive"></div>
                </div>

            </div>
        </div>

    </div>
    </section>
     <section>
        <div class="container-fluid footer-top">
            <div class="row">
                <div class="col-md-4 footer-top-left">
                <img src="<?php echo base_url()?>assets/front/images/logo.png">
          
                <h4  class="h4email"> contact@hubswallet.com</h4>
                   
                </div>
                 <div class="col-md-8 footer-top-right">
                 <div class="contact-form col-default">
                   <h4 class="ctnh4"> CONTACT US</h4>
                        <div id="form-messages"></div>
                        <form id="ajax-contact" method="post" action="#.">
                          <div class="col-md-6">
                        
                            <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required>
                            
                             <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                            </div>
                            
                             <div class="col-md-6">
                           
                           
                            <textarea class="form-control textarea-hight-full" id="message" name="message" rows="5" placeholder="Message" required></textarea>
                             <button class="btn btn-default simple-default-btn pull-right" type="submit">Sent Message</button>
                             </div>
                           
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
    </section>
    <!-- Brand End -->
    <!-- Copyright start from here -->
    <section class="copyright">
        <div class="container">
            <div class="row">
                <p>Copyright ©2017 <a href="javascript:void(0);" target="_blank">Hubs Wallet</a> All Rights Reserved</p>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="<?php echo base_url()?>assets/front/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php echo base_url()?>assets/front/js/bootstrap.min.js"></script>

    <!-- All Included JavaScript -->
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/bootstrap-dropdownhover.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jquery-scrolltofixed-min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jquery.pogo-slider.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/slick.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jarallax.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jquery.countup.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jquery.waypoints.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/css3-animate-it.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/featherlight.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/featherlight.gallery.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/jquery.filterizr.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/dyscrollup.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/VideoPlayerPopUp.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/tab-animation.js"></script>


    <!-- Custom Js -->
    <script type="text/javascript" src="<?php echo base_url()?>assets/front/js/main.js"></script>

</body>


</html>