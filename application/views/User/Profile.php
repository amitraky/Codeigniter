 <div class="centercontent">    
        <div class="pageheader">
            <h1 class="pagetitle">Profile</h1>
             <span class="pagedesc">Welcome to Profile Setting</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Basic</a></li>
                <li><a href="#validation">Profile Pic</a></li>
                <li><a href="#address">Address</a></li>
                <li><a href="#ip_address">IP address</a></li>
                 <li><a href="#password">Password</a></li>
                
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
        	<div id="basicform" class="subcontent">
                                
                    <div class="contenttitle2">
                        <h3>Basice Profile</h3>
                    </div><!--contenttitle-->

                    <br />
                 
                  <?php echo get_msg(); ?>
                    
					<form id="basiec" class="stdform stdform2" method="post" action="<?php echo base_url('User/profile')?>">
                    	<p>
                        	<label>Name</label>
                            <span class="field"><input type="text" value="<?php echo $row->or_m_name ?>" name="name" id="name" class="longinput" /></span>
                        </p>
                        
                        <p>
                        	<label>Username</label>
                            <span class="field"><input type="text" value="<?php echo $row->or_m_user_id ?>" name="username" id="username" class="longinput" readonly="readonly" /></span>
                        </p>
                        
                        <p>
                        	<label>Email</label>
                            <span class="field"><input type="text" value="<?php echo $row->or_m_email ?>" name="email" id="email" class="longinput" /></span>
                        </p>
                        
                       
                        <p>
                        	<label>Referral</label>
                            <span class="field"><input type="text" value="<?php echo $row->or_m_intr_name ?>"  readonly class="longinput" /></span>
                        </p>
                        
                        
                        <p>
                        	<label>User Status</label>
                            <span class="field">
                             <?php if($row->or_m_status == 1)echo "<b style='color:green'>Active</b>"; else echo "<b style='color:red'>Inactive</b>";?></b>
                                </span>
                        </p>
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">update Button</button>
                            <input type="hidden" id="id" name="id"  value="<?php echo $row->or_m_reg_id?>" />
                            <input type="hidden" id="act" name="act"  value="1" />
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                        
                      
                    </form>
					
                    <br />

            </div><!--subcontent-->
            
            <div id="validation" class="subcontent" style="display: none">
            	  <div class="contenttitle2">
                        <h3>Upload photo</h3>
                    </div><!--contenttitle-->
                    <form class="stdform stdform2" method="post" action="<?php echo base_url('User/profile')?>" enctype="multipart/form-data">
                    	<p>
                        	<label>Upload Photo</label>
                            <span class="field">
                            <input type="file" name="userfile" id="userfile" class="longinput" />
                             <input type="hidden" id="file" name="file"  value="<?php echo $row->or_m_userimage?>" />
                              <input type="hidden" id="file" name="file"  value="<?php echo $row->or_m_userimage2?>" />
                            </span>
                        </p>
                        
                        <p>
                        	<label>Current Photo</label>
                            <span class="field">
                            <img src="<?php echo base_url()?>assets/uploaded/photo/<?php echo $row->or_m_userimage?>" alt="">
                            <img src="<?php echo base_url()?>assets/uploaded/photo/thumbs/<?php echo $row->or_m_userimage2?>" alt="">
                        </p>
                        
                       
                        
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">update Button</button>
                            <input type="hidden" id="id" name="id"  value="<?php echo $row->or_m_reg_id?>" />
                            <input type="hidden" id="act" name="act"  value="2" />
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>

            </div><!--subcontent-->
            
            
            <div id="address" class="subcontent" style="display: none">
            	  <div class="contenttitle2">
                        <h3>Country </h3>
                    </div><!--contenttitle-->
                    <form class="stdform stdform2" method="post" action="<?php echo base_url('User/profile')?>">
                    	<p>
                        	<label>Country</label>
                            <span class="field">
                           
                                  <select id="country" name="country" style="opacity: 0;">
                                   <?php foreach($rows as $r){?>
                                    <option value="<?php echo $r->m_loc_id ?>" <?php if($r->m_loc_id == $row->or_m_country)echo "selected";?> ><?php echo $r->m_loc_name ?></option>
                                    <?php } ?>
                                </select>
                                </span>
                        </p>
                        <!--p>
                        	<label>State</label>
                            <span class="field"><input type="text" name="state" id="state" class="longinput" /></span>
                        </p>
                       
                        <p>
                        	<label>City</label>
                            <span class="field"><input type="text" name="city" id="city" class="longinput" /></span>
                        </p>
                        <p>
                        	<label>Pin code</label>
                            <span class="field"><input type="text" name="pincode" id="pincode" class="longinput" /></span>
                        </p>
                        <p>
                        	<label>Address</label>
                            <span class="field"><input type="text" name="address" id="address" class="longinput" /></span>
                        </p-->
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">update Button</button>
                            <input type="hidden" id="id" name="id"  value="<?php echo $row->or_m_reg_id?>" />
                            <input type="hidden" id="act" name="act"  value="3" />
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>

            </div>
            
            
            <div id="ip_address" class="subcontent" style="display:none">
            	
                  <div class="contenttitle2">
                        <h3>IP Addresss</h3>
                    </div><!--contenttitle-->
                    <form class="stdform stdform2" method="post" action="<?php echo base_url('User/profile')?>">
                    	<p>
                        	<label>Current Login IP</label>
                            <span class="field"><input readonly type="text" name="c_ip" id="c_ip" class="longinput"  value="<?php echo $_SERVER['REMOTE_ADDR']?>"/></span>
                        </p>
                        <p>
                        	<label>Old Login IP</label>
                            <span class="field"><input readonly type="text" name="o_ip" id="o_ip" class="longinput" /></span>
                        </p>
                       
                       
                    </form>

            </div>
            
               <br clear="all" />
             <div id="password" class="subcontent" style="display:none">
            	  <div class="contenttitle2">
                        <h3>Login Password</h3>
                    </div><!--contenttitle-->
                     <br clear="all" />
                    <form id="updatepwd" class="stdform stdform2" method="post" action="<?php echo base_url('User/profile')?>">
                    	
                        <p>
                        	<label>New Password</label>
                            <span class="field"><input type="password" name="new_pass" id="new_pass" class="longinput" /></span>
                        </p>
                       
                       <p>
                        	<label>Confirm Password</label>
                            <span class="field"><input type="password" name="c_pass" id="c_pass" class="longinput" /></span>
                        </p>
                      
                      <div class="contenttitle2">
                        <h3>Master Password</h3>
                      </div><!--contenttitle-->   
                    
                        <p style=" border-top: 1px solid #ddd !important;">
                        	<label>Master New Password</label>
                            <span class="field"><input type="password" name="pin_new_pass" id="pin_new_pass" class="longinput" /></span>
                        </p>
                       
                       <p>
                        	<label>Master Confirm Password</label>
                            <span class="field"><input type="password" name="pin_c_pass" id="pin_c_pass" class="longinput" /></span>
                        </p>
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">update Button</button>
                            <input type="hidden" id="id" name="id"  value="<?php echo $row->or_m_reg_id?>" />
                            <input type="hidden" id="act" name="act"  value="4" />
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>

            </div>
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->