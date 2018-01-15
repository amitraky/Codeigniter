        
    <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Dashboard</h1>
            <span class="pagedesc">&nbsp;</span>
            
            <ul class="hornav">
                <li class="current"><a href="#updates">Dashboard Summary</a></li>
                <li><a href="#activities">Activities</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        
        	<div id="updates" class="subcontent">
                    <!-- notification announcement -->
                    
                    <!--two_third dashboard_left -->
                    
                    
                   
                  <div class="two_third dashboard_left">
<div class="contenttitle2 nomargintop">
                            <h3>Total Currency Transaction</h3>
                        </div>
                    	<ul class="shortcuts">
                         <?php foreach($rows['thumbs'] as $row){
                           if($row->tr06_type == 1){
                               ?>
                        	<li><a href="#" class="money"><span><b style="color:#ff8316">$<?php echo $row->from_amt.'/$'.$row->to_amt?></b><br />Total Buy Currency </span></a></li>
                        <?php }elseif($row->tr06_type == 2){?>
                            <li><a href="#" class="money"><span><b style="color:#ff8316">$<?php echo $row->from_amt.'/$'.$row->to_amt?></b><br />Total Sell Currency </span></a></li>
                          <?php } else{?>
                            <li><a href="#" class="money"><span><b style="color:#ff8316">$<?php echo $row->from_amt.'/$'.$row->to_amt?></b><br />Total Exchange Currency </span></a></li>
                          <?php } }?>
                        </ul>
                        
                        <br clear="all">

                    <div class="contenttitle2 nomargintop">
                            <h3>Pending Transaction</h3>
                        </div>
                      
                        <table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb overviewtable2">
                            <thead>
                                  <tr>
                                    <th class="head1">Sr.</th>
                                    <th class="head1">Date</th>
                                    <th class="head0">Transaction Type</th>
                                    <th class="head1">Sent Gateway</th>
                                    <th class="head0">Receive Gateway</th>
                                    <th class="head1">From Amount</th>
                                    <th class="head1">To Amount</th>
                                    <th class="head1">Status</th>
                                </tr>
                            </thead>
                            <tfoot>
                                 <tr>
                                    <th class="head1">Sr.</th>
                                    <th class="head1">Date</th>
                                    <th class="head0">Transaction Type</th>
                                    <th class="head1">Sent Gateway</th>
                                    <th class="head0">Receive Gateway</th>
                                    <th class="head1">From Amount</th>
                                    <th class="head1">To Amount</th>
                                    <th class="head1">Status</th>
                                </tr>
                            </tfoot>
                            <tbody>
                       <?php $i=1; foreach($rows['table'] as $row){

$type = 'Buy';
if($row->tr06_type == 2)
$type = 'Sell';
if($row->tr06_type == 32)
$type = 'Exchange';
?>
                                <tr>
                                    <td><?php echo $i++;?></td>
                                    <td><?php echo $row->tr06_date?></td>
                                    <td><?php echo $type?></td>
                                    <td><?php echo $row->tr06_from_currency?></td>
                                    <td><?php echo $row->tr06_to_currency?></td>
                                    <td >$<?php echo $row->tr06_from_amount?></td>
                                    <td >$<?php echo $row->tr06_to_amount?></td>
                                     <td ><?php echo txt_status($row->tr06_status)?></td>
                                </tr>
                        <?php } ?>
                              
                            </tbody>
                        </table>
                        
                    </div>  
                    
            </div><!-- #updates -->
            
            <div id="activities" class="subcontent" style="display: none;">
            	&nbsp;
            </div><!-- #activities -->
        <div class="one_third last dashboard_right">
                    
                        <div class="contenttitle2 nomargintop">
                            <h3>Total Transaction </h3>
                        </div><!--contenttitle-->
                    
                 
                    	<ul class="toplist">
                       <?php foreach($rows['status'] as $row){?>
                        	<li>
                            	<div>
                                	<span class="three_fourth">
                                    	<span class="left">
                                    		<span class="title"><a href="#"><?php trasaction_status($row->tr06_status)?> Transaction</a></span>
                                        	<span class="desc">Hubswallet.com</span>
                                    	</span><!--left-->
                                    </span><!--three_fourth-->
                                    <span class="one_fourth last">
                                    	<span class="right">
                                        	<span class="h3">$<?php echo $row->from_amt?></span>
                                        </span><!--right-->
                                    </span><!--one_fourth-->
                                    <br clear="all">
                                </div>
                            </li> 
                             <?php }?>
                        
                        </ul>
                        
			
                      
                        
                      
        </div><!--contentwrapper-->
        
        <br clear="all" />
        
       <br /><br /> 
	</div><!-- centercontent -->
    
    
</div><!--bodywrapper-->

</body>