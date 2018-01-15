<div class="centercontent">
  <div class="pageheader">
    <h1 class="pagetitle">Registration</h1>
    <span class="pagedesc">Welcome to User Registration</span>
    <ul class="hornav">
      <li class="current"><a href="#basicform">User Registration</a></li>
    </ul>
  </div>
  <!--pageheader-->
  
  <div id="contentwrapper" class="contentwrapper">

    
<div id="basicform" class="subcontent">
      <div class="contenttitle2">
        <h3>User Registration</h3>
      </div>
      <!--contenttitle--> 
      <?php echo get_msg()?>
      <br />
                    <form id="form1" class="stdform stdform2" method="post" action="<?php echo base_url('admin/create_account')?>">
                    	<p>
          <label>Name
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="name" id="name"  class="smallinput" placeholder="Enter Full Name">
          </span> </p>
        <p>
			  <label>Username
				<r>*</r>
			  </label>
			  <span class="field">
			  <input type="text"  name="username" id="username" class="smallinput"  placeholder="Enter Username"  onchange="check_checkuser()" autocomplete="off">
               <span style="color:red" id="usernameid"></span>
			  </span> 
        </p>
        <p>
          <label>Email
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="email" id="email" class="smallinput" placeholder="Enter email id">
          </span> </p>
        <p>
          <label>Confirm Email
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="confirm_email" id="confirm_email" class="smallinput" placeholder="Enter Confirmed">
          </span> </p>
        <p>
          <label>Password
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="password" id="password" class="smallinput" placeholder="Enter Password">
          </span> </p>
        <p>
          <label>Confirm Password
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="confirm_password" id="confirm_password" class="smallinput" placeholder="Confirm Password">
          </span> </p>
        <p>
          <label>Referral
            <r>*</r>
          </label>
          <span class="field">
          <input type="text"  name="referal" id="referal" class="smallinput" onblur=" check_referal()"  placeholder="Enter Referral" autocomplete="off">
         <span id="referamsg" style="color:red"></span>
          </span> </p>


        <p>
          <label>Country
            <r>*</r>
          </label>
          <span class="field">
            <select name="country" id="country">
                        <option value="" >Select Country</option>
                      <?php foreach($rows as $row){?>
                        <option value="<?php echo $row->m_loc_id ?>" class="smallinput"><?php echo $row->m_loc_name ?></option>
                       <?php } ?>
                       </select>
          </span> </p>
      


        <p class="stdformbutton">
          <button class="submit radius2">Submit Button</button>
          <input type="hidden"  name="act" id="act" value="1">
          <input type="reset" class="reset radius2" value="Reset Button">
        </p>
                    </form>

            </div><!--subcontent-->
    
    <!--subcontent--> 
    
  </div>
</div>
<!--contentwrapper-->

</div>
<!-- centercontent --> 
<script>
function check_referal()
{
 
	 var refer = jQuery('#referal').val();
 jQuery.ajax({
  url: base_url('Auth/check_referal'),
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

function check_checkuser()
{
 
	 var refer = jQuery('#username').val();

 jQuery.ajax({
  url: base_url('Auth/check_referal'),
  cache: false,
  type:'post',
  data:{'referal':refer},
  success: function(data){
    if(data == 1)
	{  
	   jQuery("#username").val(" ");  
	   jQuery("#usernameid").html("&nbsp;&nbsp;Please Enter valid referal id");
	}
	else
	{
	   jQuery("#usernameid").html("");
	}
	
	
	
  }
});

}
</script>