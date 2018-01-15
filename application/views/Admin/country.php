 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">All Country</h1>
            <span class="pagedesc">Welcome to Country</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">All Country</a></li>
                <li><a href="#addcountry">Add Country</a></li>
                <li><a href="#updatecountry">Update Country</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
            
         <div id="basicform" class="subcontent">
            
              <div class="contenttitle2">
                	<h3>All Country Summary</h3>
                </div><!--contenttitle-->
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                           <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head1">Status</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                         
                            <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head1">Status</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1; foreach($rows as $row){?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->m_loc_name;?></td>
                           <td><?php echo $row->m_status==1?'Active':'Inactive';?></td>
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        <div id="addcountry" class="subcontent" style="display: none">
            	  <div class="contenttitle2">
                	<h3>Add Country </h3>
                </div>
                    <form id="insertcountry" class="stdform stdform2" method="post" action="<?php echo base_url('Admin/country')?>">
                    	<p>
                        	<label>Name</label>
                            <span class="field"><input type="text" name="name"  id="name" class="longinput" /></span>
                        </p>
                       
                       
                        <p>
                        	<label>Status</label>
                            <span class="field">
                                  <select id="overviewselect" name="status" style="opacity: 0;">
                                    <option value="">Select Status</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select></span>
                        </p>
                       
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">Submit Button</button>
                           <?php echo form_hidden('act', '1'); ?>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>

            </div>
            
            
            <div id="updatecountry" class="subcontent" style="display: none">
            	  <div class="contenttitle2">
                	<h3>Update Country </h3>
                </div>
                    <form id="upadtecountry" class="stdform stdform2" method="post" action="<?php echo base_url('Admin/country')?>">
                    
                    
                        <p>
                        	<label>Select Payment Type</label>
                            <span class="field">
                                  <select id="country" name="country" onchange="updateCountryMaster(this.value)" style="opacity: 0;">
                                   <option value="">Select Status</option>
                                   <?php $sr=1; foreach($rows as $row){?>                                   
                                    <option value="<?php echo $row->m_loc_id?>"><?php echo $row->m_loc_name?></option>
                                    <?php } ?>
                                </select>
                                
                                </span>
                        </p>
                        
                        
                    	<p>
                        	<label>Name</label>
                            <span class="field"><input type="text" name="name"  id="name" class="longinput" /></span>
                        </p>
                       
                       
                        <p>
                        	<label>Status</label>
                            <span class="field">
                                  <select id="status" name="status" style="opacity: 0;">
                                    <option value="">Select Status</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select>
                                <i style="color:red" id="cStatus"></i>
                                </span>
                        </p>
                       
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">update Button</button>
                            <input type="hidden" id="id" name="id" />
                            <input type="reset" class="reset radius2" value="Reset Button" />
                              <?php echo form_hidden('act', '2'); ?>
                        </p>
                    </form>

            </div>
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->