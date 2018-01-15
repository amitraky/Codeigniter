 <div class="centercontent">    
        <div class="pageheader">
            <h1 class="pagetitle">Setting</h1>
             <span class="pagedesc">Welcome to Site Setting</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Setting</a></li>
               
                
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
        	<div id="basicform" class="subcontent">
                                
                    <div class="contenttitle2">
                        <h3>Site Setting</h3>
                    </div><!--contenttitle-->

                    <br />
                    <?php echo get_msg()?>
					<form class="stdform stdform2" method="post" action="<?php echo base_url("admin/setting")?>">
                    <?php foreach($rows as $row){?>
                    	<p>
                        	<label><?php echo $row->m00_name; ?></label>
                            <span class="field"><input  type="text" value="<?php echo $row->m00_value ?>" name="config[<?php echo $row->m00_name; ?>]" id="firstname2" class="smallinput" <?php echo $row->m00_disable?>  />
                            
                            </span>
                        </p>
                        <?php } ?>
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">Submit Button</button>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>
					
                    <br />

            </div><!--subcontent-->
            
            <!--subcontent-->
            
            
            
            
            
            
            
            
            
            	
                    

            </div>
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->