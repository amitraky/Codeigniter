 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Buy Currency</h1>
            <span class="pagedesc">Welcome to Buy Currency</span>
            
            <ul class="hornav">
                <li class="current"><a href="#step1">Buy Currency INFORMATION</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
  <?php echo get_msg(); ?>
            <form id="transactionforms" class="stdform stdform2" method="post" action="<?php echo base_url("User/do_transaction")?>">
            
            <div id="step1" class="subcontent">
                                
                    <div class="contenttitle2">
                        <h3>SENDER INFORMATION</h3>
                    </div><!--contenttitle-->
                    <br />
					
                    	<p style="border-top:1px solid #ddd ">
                        	<label>Send Currency</label>
                            <span class="field">
							<select name="send_currency" id="send_currency" onchange="curencyDetails(this.value,'S')">
                            	<option >Choose One</option>
                               <?php foreach($reciveds as $r){?>
                                     <option value="<?php echo $r->m6_id; ?>"><?php echo $r->m6_name ; ?></option>
                               <?php } ?>
                            </select>
      
                            </span>
                        </p>
                        
                      
                      <p>
                        	<label>Amount(USD)</label>
                                 <span class="field"><input type="text" name="send_amount" id="send_amount" class="smallinput" placeholder="Enter amount in USD"/><br>
                            </span>
                        </p>
                       
                        
                        <div class="contenttitle2">
                           <h3>Reciver Information</h3>
                       </div>
                       
                        <p style="border-top:1px solid #ddd ">
                        	<label>Recive Currency </label>
                            <span class="field">
							<select name="recive_currency" id="recive_currency" onchange="curencyDetails(this.value,'R')">
                            	<option>Choose One</option>
                                 <?php  foreach($sends as $s){?>
                                  <option value="<?php echo $s->m6_id; ?>"><?php echo $s->m6_name; ?></option>
                            <?php } ?>
                            </select>
                            </span>
                        </p>
                        
                      
                      <p>
                        	<label>Amount(BDT)</label>
                            <span class="field"><input type="text" name="recive_amount"   id="recive_amount"   class="smallinput" /></span>
                        </p>
                       
       
                                
                    <div class="contenttitle2">
                        <h3>ACCOUNT INFORMATION</h3>
                    </div><!--contenttitle-->

                    <br />
                    
                    	
                            <p style="border-top:1px solid #ddd ">
                        	<label>Account Number</label>
                            <span class="field"><b style="    color: green;    font-size: 15px;" id="accountid">*******************</b><br>
    
                           </span>
                        </p>

   
                      
                      <p>
                        	<label>Account Name</label>
                            <span class="field"><b style="    color: green;    font-size: 15px;" id="account_name">*********************</b><br>
    
                           </span>
                        </p>
                 
                          <p>
                        	<label>PM ID</label>
                            <span class="field"><input type="text" name="pm_id" id="pm_id"   class="smallinput" placeholder="Enter PM ID"/><br>
    
                           </span>
                        </p>
      
                          <p>
                        	<label>Contact Number</label>
                            <span class="field"><input type="text" name="mobile" id="mobile" class="smallinput" placeholder="Contact Number"/><br>
    
                           </span>
                        </p>
                     
                           <p>
                        	<label>&nbsp;</label>
                            <span class="field"><input type="checkbox" name="terms" id="terms" class="smallinput" /> I agree to the terms of service and privacy policy<br>
    
                           </span>
                        </p>
                     
                        
                        
                       
                        
                        
                        <p class="stdformbutton">
                           <input type="reset" class="reset radius2" value="Reset Button" />
                        	<button class="submit radius2">Submit Button</button>
                            <input type="hidden" id="act" name="act"  value="1" />
                            
                        </p>
                        
                      
					
                    <br />

            </div>
            </form>
            <!--subcontent-->
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->

<script>
function curencyDetails(id,type)
{
	 if(id == null)
	 {
	   return false;
	 }

	jQuery.ajax({
	  url: base_url('User/currency_details'),
	  type: "POST",
	  data: {c_id : id},
	  success: function(res)
	  {
		  var n = JSON.parse(res);

	  if(type=='S')
         {
	      jQuery('#accountid').html(n.m6_account_number);
	   	  jQuery('#account_name').html(n.m6_account_name);
       	 jQuery('#send_amount').val(n.m07_charge);
          }
 if(type=='R')
         {
           var se = jQuery('#send_amount').val();
        	 jQuery('#recive_amount').val((n.m07_charge)*se)
          }


	  }
	});
}
</script>