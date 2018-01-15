 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Exchange Currency</h1>
            <span class="pagedesc">Welcome to Exchange Currency</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Exchange</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	<?php echo get_msg()?>
         <div id="basicform" class="subcontent">
            
              <div class="contenttitle2">
                	<h3>Exchange Currency Summary</h3>
                </div><!--contenttitle-->
                  <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                           
                           <th class="head0">Sr.No</th>
                            <th class="head1">Invoice ID</th>
                            <th class="head0">From Currency</th>
                              <th class="head0">To Currency</th>
                              <th class="head0">From Amount</th>
                              <th class="head0">To Amount</th>
                             <th class="head1">Transaction Status</th>
                           <th class="head1">Transaction Date</th>
                            <th class="head1">Action </th>
                        </tr>
                    </thead>
                    <tfoot>
                         <tr>
                           
                           <th class="head0">Sr.No</th>
                            <th class="head1">Transaction ID</th>
                            <th class="head0">From Currency</th>
                              <th class="head0">To Currency</th>
                              <th class="head0">From Amount</th>
                              <th class="head0">To Amount</th>
                             <th class="head1">Transaction Status</th>
                           <th class="head1">Transaction Date</th>
                             <th class="head1">Action </th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1; foreach($rows as $row){?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->tr06_invoice_id;?></td>
                           <td><?php echo $row->tr06_from_currency;?></td>
                            <td><?php echo $row->tr06_to_currency;?></td>
                           <td><?php echo $row->tr06_from_amount;?></td>
                             <td><?php echo $row->tr06_to_amount;?></td>
                            <td><?php  txt_status($row->tr06_status);?></td>
                           <td><?php echo $row->tr06_date;?></td>
                          <td><a href="<?php echo base_url('admin/invoice/'.$row->tr06_id)?>" style="color:green">Invoice</a> | <a  onclick="curreny_status('<?php echo $row->tr06_id ?>')" style="color:blue">Edit</a></td>

                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->


<div id="popups" style="display:none">
  <div id="popup_overlay" style="position: absolute; z-index: 99998; top: 0px; left: 0px; width: 100%; height: 2795px; background: rgb(255, 255, 255); opacity: 0.01;"></div>
  <div id="popup_container" class="ui-draggable" style="position: fixed; z-index: 99999; padding: 0px; margin: 0px; min-width: 25%; max-width: 330px; top: 63.5px; left: 34%">
    <h1 id="popup_title" style="cursor: move;">Update Order Status</h1>
    <div id="popup_content" class="alert">
      <div id="popup_panel">
       <form id="popupsfrm" class="" method="post" action="<?php echo base_url('admin/currency_action_perform')?>" novalidate="novalidate">
                    	<p>
                        	<label>PM-ID</label>
                            <span class="field"><input type="text" name="pmid" id="pmid" class="longinput" readonly></span>
                        </p>
                        
                        <p>
                        	<label>Mobile</label>
                            <span class="field"><input type="text" name="mobile" id="mobile" class="longinput" readonly></span>
                        </p>
                         <p>
                        	<label>Email</label>
                            <span class="field"><input type="text" name="email" id="email" class="longinput" readonly></span>
                        </p>
                       
                        <br>
                     <p>
                        	<label>Description</label>
                            <span class="field">
                                <textarea  id="description" name="description" class="longinput"></textarea>
                            </span> 
                        </p>
                <br>

                     <p>
                        	<label>Status</label>
                            <span class="formwrapper">
                            	<input type="radio" name="status" value="0" checked/> Pending &nbsp; &nbsp;
                            	<input type="radio" name="status" value="1" /> Success &nbsp; &nbsp;
                                <input type="radio" name="status"  value="2" /> Reject &nbsp; &nbsp;
                            </span>
                            </span>
                        </p>
                        
                        <br>
                        
                        <p class="stdformbutton">
                                                   <input type="button" value="&nbsp;Cancel&nbsp;"  class=" radius2" id="popup_cancel" onclick="jQuery('#popups').hide();">
                            <input type="hidden" name="id" id="id"  /> 
                               <input type="hidden" name="page" id="page" value="exchange"   /> 
                        	<button class="submit radius2" id="popup_ok">Submit</button>
                        </p>
                    </form>
       </form>
      </div>
    </div>
  </div>
</div>