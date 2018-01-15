

<body class="loginpage">

	<div class="loginbox">
    	<div class="loginboxinner">
        	
            <div class="logo">
            	<h1><span>Hubs</span>Wallet</h1>
                <p>Login Panel</p>
            </div><!--logo-->
            
            <br clear="all" /><br />
            
            <div class="nousername">
				<div class="loginmsg">The password you entered is incorrect.</div>
            </div><!--nousername-->
             <?php echo get_msg(); ?>
            <div class="nopassword">
				<div class="loginmsg">The password you entered is incorrect.</div>
                <div class="loginf">
                    <div class="thumb"><img alt="" src="<?php echo base_url()?>assets/images/thumbs/avatar1.png" /></div>
                    <div class="userlogged">
                        <h4></h4>
                        <a href="<?php echo base_url("Auth")?>">Not <span></span>?</a> 
                    </div>
                </div><!--loginf-->
            </div><!--nopassword-->
           
            <form id="login" action="<?php echo base_url("Auth/login_process")?>" method="post">
            	
                <div class="username">
                	<div class="usernameinner">
                    	<input type="text" name="username" id="username" />
                    </div>
                </div>
                
                <div class="password">
                	<div class="passwordinner">
                    	<input type="password" name="password" id="password" />
                    </div>
                </div>
                
                <button>Sign In</button>
                
                <div class="keep"><span style="text-align:center"><input type="checkbox" /> Keep me logged in</span>
                <span style="margin-left: 76px;cursor:pointer" onClick="window.location='<?php echo base_url('Auth/registration')?>'">Create Account</span></div>
            
            </form>
            
        </div><!--loginboxinner-->
    </div><!--loginbox-->


</body>

</html>
