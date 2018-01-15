<style>
#country{
    padding: 8px 10px;
    border: 0;
    font-size: 14px;
    width: 330px;
    box-shadow: none;
    color: #666;
    font-family: 'RobotoCondensed', Arial, Helvetica, sans-serif;
}
.loginbox .username input {
    padding: 8px 10px;}

.loginbox .username input{
    width: 90%;
}
</style>
<body class="loginpage">

	<div class="loginbox">
    	<div class="loginboxinner">
        	
            <div class="logo">
            	<h1><span>Hubs</span>Wallet</h1>
                <p>Registration Panel</p>
            </div><!--logo-->
            
          
             <?php echo get_msg();?>
            <form id="registration" action="<?php echo base_url("Auth/create_account")?>" method="post">
            	
                <div class="username">
                	<div class="usernameinner">
                    	<input type="text" name="name" id="name" placeholder="Name"/>
                    </div>
                </div>
                
                 <div class="username">
                	<div class="passwordinner">
                    	<input type="text" name="username" id="username" onchange="check_username()" />
                       <span id="usernamemsg" style="color:red"></span>
                    </div>
                </div>
                
                
                <div class="username">
                	<div class="passwordinner">
                    	<input type="text" name="email" id="email"  placeholder="email"/>
                    </div>
                </div>
                
                
                <div class="username">
                	<div class="passwordinner">
                    	<input type="text" name="confirm_email" id="confirm_email"  placeholder="confirm email"/>
                    </div>
                </div>
                
                
                <div class="username">
                	<div class="passwordinner">
                    	<input type="password" name="password" id="password" />
                    </div>
                </div>
                
                
                <div class="username">
                	<div class="passwordinner">
                    	<input type="password" name="confirm_password" id="confirm_password"  placeholder="confirm Password"/>
                    </div>
                </div>
                
                
                <div class="username">
                	<div class="passwordinner">
                    	<input type="text" name="referal" id="referal" value="<?php echo $_GET['id']?>" placeholder="Referral Link" onBlur="return check_referal()" readonly/>
                        <span id="referamsg" style="color:red"></span>
                    </div>
                </div>
                
                
                 <div class="username">
                	<div class="passwordinner">
                       <select name="country" id="country">
                        <option value="">Select Country</option>
                      <?php foreach($rows as $row){?>
                        <option value="<?php echo $row->m_loc_id ?>"><?php echo $row->m_loc_name ?></option>
                       <?php } ?>
                       </select>
                    </div>
                </div>
                
               
                
                <button>Create Account</button>
                
                <div class="keep" style="cursor:pointer" onClick="window.location='<?php echo base_url('Auth/index')?>'">Already Account</span>
            
            </form>
            
        </div><!--loginboxinner-->
    </div><!--loginbox-->


<script>

function check_referal()
{
 
	 var refer = jQuery('#referal').val();
 jQuery.ajax({
  url: "<?php echo base_url("Auth/check_referal")?>",
  cache: false,
  type:'post',
  data:{'referal':refer},
  success: function(data){
    if(data == 0)
	{  
	   jQuery("#referal").val(" ");  
	   jQuery("#referamsg").html("&nbsp;&nbsp;Please Enter valid referal id");
	}
	else
	{
	   jQuery("#referamsg").html("");
	}
	
	
	
  }
});

}



function check_username()
{
 
	 var refer = jQuery('#username').val();
  jQuery.ajax({
  url: "<?php echo base_url("Auth/check_referal")?>",
  cache: false,
  type:'post',
  data:{'referal':refer},
  success: function(data){
    if(data == 1)
	{  
	   jQuery("#username").val(" ");  
	   jQuery("#usernamemsg").html("&nbsp;&nbsp;This Username is already taken");
	}
	else
	{
	   jQuery("#usernamemsg").html("");
	}
	
	
	
  }
});

}

</script>


</body>

</html>