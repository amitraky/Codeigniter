 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Currency  Rate</h1>
            <span class="pagedesc">Welcome to Currency Rate</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Currency Rate Summary</a></li>
                 <li><a href="#updatepayment">Update Currency Rate</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
            
         <div id="basicform" class="subcontent">
              <?php echo get_msg()?>
              <div class="contenttitle2">
                	<h3>Today's Currency Rate Summary</h3>
                </div><!--contenttitle-->
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                            <th class="head0">Sr.No</th>
                            <th class="head0">Type</th>
                            <th class="head1">Charge</th>
                            <th class="head1">Date</th>
                            <th class="head1">Status</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                         
                            <th class="head0">Sr.No</th>
                            <th class="head0">Type</th>
                            <th class="head1">Charge</th>
                            <th class="head1">Date</th>
                            <th class="head1">Status</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1; foreach($rows as $row){?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->m07_currency_name;?></td>
                            <td><?php echo $row->m07_charge;?></td>
                            <td><?php echo $row->m07_date;?></td>
                            <td><?php  echo $row->m07_status==1?'Active':'Inactive';?></td>
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
       
       
            
            
            <div id="updatepayment" class="subcontent" style="display: none">
            	 <div class="contenttitle2">
                	<h3>Update Payment Summary</h3>
                </div>
                    <form id="currencyRate" class="stdform stdform2" method="post" action="<?php echo base_url('Admin/currency_rate')?>" enctype="multipart/form-data">
                       <p>
                        	<label>Select Currency Type</label>
                            <span class="field">
                                  <select  name="currency_type" id="currency_type"  style="opacity: 0;" onchange="updateCurencyfRate(this.value)">
                                   <option value="">Select Status</option>
                                   <?php $sr=1; foreach($currency_type as $row){?>                                   
                                    <option value="<?php echo $row->m6_id?>"><?php echo $row->m6_name; ?></option>
                                    <?php } ?>
                                </select>
                                </span>
                        </p>
                        
                        
                    	<p>
                        	<label>Currency Name</label>
                            <span class="field"><input type="text" name="name"  id="name" class="longinput" placeholder="Auto fill  Currency name"/></span>
                        </p>

                     	<p>
                        	<label>Currency Rate</label>
                            <span class="field"><input type="text" name="rate"  id="rate" class="longinput" placeholder="Please Enter Currency Rate"/></span>
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