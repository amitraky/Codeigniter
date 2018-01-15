 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">All Currecy's</h1>
            <span class="pagedesc">Welcome to Currency's  Type</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">All Currency's  Type</a></li>
                <!--li><a href="#addcountry">Add Currency's  Type</a></li-->
                 <li><a href="#updatepayment">Update Currency's Type</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
            
         <div id="basicform" class="subcontent">
              <?php echo get_msg()?>
              <div class="contenttitle2">
                	<h3>All Currency's Summary</h3>
                </div><!--contenttitle-->
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                            <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head0">Description</th>
 <th class="head1">Type</th>
                            <th class="head1">Icon</th>

                            <th class="head1">Status</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head0">Description</th>
  <th class="head1">Type</th>
                            <th class="head1">Icon</th>
                            <th class="head1">Status</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1;$type='Sell'; foreach($rows as $row){    if($row->m6_type ==1)   $type='Buy';   if($row->m6_type == 2)$type='Sell';   if($row->m6_type == 3)$type='Exchange';?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->m6_name;?></td>
                           <td><?php echo $row->m6_description;?></td>
                              <td><?php echo $type;?></td>
                           <td> <img src="<?php echo base_url('assets/uploaded/currency/').$row->m6_icon;?>" style="    margin: 0px 0 0 38px;" id="imgcurren"/></td>          
                           <td><?php echo $row->m6_status==1?'Active':'Inactive';?></td>
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        <div id="addcountry" class="subcontent" style="display: none">
            	<div class="contenttitle2">
                	<h3>Add Currency</h3>
                </div>
               
                    <form  id="paymentMaster" class="stdform stdform2" method="post" action="<?php echo base_url('Admin/currency')?>" enctype="multipart/form-data">
                    
                         
                           <p>
                                <label>Transaction Type</label>
                                <span class="field">
                                      <select id="type" name="type"  style="opacity: 0;">
                                        <option>Select type</option>
                                        <option value="2">Sell</option>
                                        <option value="1">Buy</option>
                                         <option value="1">Exchange</option>
                                    </select>
                                 
                                 </span>
                            </p>
                        
                        
                    	<p>
                        	<label>Name</label>
                            <span class="field"><input type="text" name="name"  id="name" class="longinput" /></span>
                        </p>
                        <p>
                        	<label>Description</label>
                            <span class="field"><textarea cols="80" rows="5" name="description" class="longinput"></textarea></span>
                        </p>
                       
                        <p>
                        	<label>Status</label>
                            <span class="field">
                                  <select id="status" name="status"  style="opacity: 0;">
                                    <option>Select Status</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                   </select>
                            </span>
                        </p>
                       
                       <p>
                        	<label>Upload icon</label>
                            <span class="field"><input type="file" name="userfile"  id="userfile" class="longinput" /></span>
                        </p>
                        
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">Submit Button</button>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                             <?php echo form_hidden('act', '1'); ?>
                        </p>
                    </form>

            </div>
            
            
            <div id="updatepayment" class="subcontent" style="display: none">
            	 <div class="contenttitle2">
                	<h3>Update Currency Summary</h3>
                </div>
                    <form id="updatepaymentMaster" class="stdform stdform2" method="post" action="<?php echo base_url('Admin/currency')?>" enctype="multipart/form-data">
                       <p>
                        	<label>Select Currency Type</label>
                            <span class="field">
                                  <select id="overviewselect" name="select" style="opacity: 0;" onchange="updatePaymentMaster(this.value)">
                                   <option value="">Select Status</option>
                                   <?php $sr=1; foreach($rows as $row){?>                                   
                                    <option value="<?php echo $row->m6_id?>"><?php echo $row->m6_name?></option>
                                    <?php } ?>
                                </select>
                                
                                </span>
                        </p>
                        
                       
                        
                        
                        
                    	<p>
                        	<label>Name</label>
                            <span class="field"><input type="text" name="name"  id="name" class="longinput" /></span>
                        </p>

                        <p>
                        	<label>Description</label>
                            <span class="field"><textarea cols="80" rows="5" name="description" id="description" class="longinput"></textarea></span>
                        </p>
                       
                        <p>
                        	<label>Status</label>
                            <span class="field">
                                  <select id="status" name="status" style="opacity: 0;">
                                    <option value="">Select Status</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select><i style="color:red" id="cStatus"></i></span>
                                
                        </p>
                       
                         <p>
                        	<label>Upload icon</label>
                            <span class="field">
                            <input type="file" name="userfile"  id="userfile" class="longinput" />
                            <input type="hidden" id="file" name="file"/>
                            <img src="" style="    margin: 0px 0 0 38px;" id="imgcurren"/></span>
                        </p>
                        


 <div class="contenttitle2">
                	<h3>Account  Summary</h3>
                </div>


                    	<p>
                        	<label>Account ID</label>
                            <span class="field"><input type="text" name="account_id"  id="account_id" class="longinput" /></span>
                        </p>



                    	<p>
                        	<label>Account Name</label>
                            <span class="field"><input type="text" name="account_name"  id="account_name" class="longinput" /></span>
                        </p>

                       




                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">Submit Button</button>
                            <input type="hidden" id="id" name="id"/>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                             <?php echo form_hidden('act', '2'); ?>
                        </p>
                    </form>

            </div>
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->