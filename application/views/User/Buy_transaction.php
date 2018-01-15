 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Buy  Currency Summary</h1>
            <span class="pagedesc">Welcome to Buy Currency Summary</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Buy  Currency Summary</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
         <div id="basicform" class="subcontent">
            
              <div class="contenttitle2">
                	<h3>Buy Currency Summary</h3>
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
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->