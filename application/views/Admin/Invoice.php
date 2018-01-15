<style>
@media print {
  body * {
    visibility: hidden;
  }
  #centercontent * {
    visibility: visible;
    margin:0 0 0 -50px !important;
    padding:-200px !important
  }
 




}




</style> 

<div class="centercontent" id="centercontent">
    <?php 
$type = null;
if($row->tr06_type == 1)
$type = 'Buy Currency';
if($row->tr06_type == 2)
$type = 'Sell Currency';
if($row->tr06_type == 3)
$type = 'Exchange Currency';
?>
        <div class="pageheader notab">
            <h1 class="pagetitle">Invoice (Client View)</h1>
            <span class="pagedesc">This is a Invoice</span>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper invoicewrapper">
        	
          <div class="one_half">
            
              <div class="invoice_logo"><img src="<?php echo base_url()?>assets/front/images/logo.png" alt=""></div>
              
              <table cellpadding="0" cellspacing="0" class="table invoicefor">
               	  <tbody><tr>
                   	  <td width="30%">Invoice For:</td>
                      <td width="70%"><strong><?php echo $row->or_m_name."(".$row->or_m_user_id.")"?></strong></td>
                  </tr>
               
                	<tr>
                	  <td>Transaction  Type:</td>
                	  <td><?php echo $type ?></td>
              	  </tr>
               <tr>
                	  <td>Transaction Status:</td>
                	  <td><?php  txt_status($row->tr06_status) ?></td>
              	  </tr>
           <tr>
                	  <td>Payment Mobile:</td>
                	  <td><?php  echo ($row->tr06_mobile) ?></td>
              	  </tr>

                <tr>
                	  <td>Payment Email:</td>
                	  <td><?php  echo ($row->tr06_email) ?></td>
              	  </tr>

              </tbody></table>
            </div><!--one_half-->
            
			<div class="one_half last">
            <table cellpadding="0" cellspacing="0" class="table" id="from">
               	  <tbody><tr>
                   	  <td width="30%">From:</td>
                      <td width="70%">
                      	<strong> Hubs Wallet.</strong> <br>
                        201 Something St., Something Town, <br>
                        YT 242, Country 6546 <br>
                        Tel No: 324 445-4544 <br>
                        Email: contact@hubswallet.com
                      </td>
                  </tr>
              </tbody></table>
           
              <table cellpadding="0" cellspacing="0" class="table invoiceinfo"  id="invoices">
               	  <tbody><tr>
                   	  <td width="30%">Invoice ID:</td>
                      <td width="70%"><strong><?php echo $row->tr06_invoice_id?></strong></td>
                  </tr>
              <tr>
                   	  <td width="30%">PM ID:</td>
                      <td width="70%"><strong><?php echo $row->tr06_pm_id?></strong></td>
                  </tr>
               	  <tr>
               	    <td>Request Date:</td>
               	    <td><strong><?php echo $row->tr06_date?></strong></td>
           	    </tr>
                <tr>
               	    <td>Today :</td>
               	    <td><strong><?php echo date('Y-m-d')?></strong></td>
           	    </tr>
                	
              </tbody></table>
            </div><!--one_half-->
            
            <br clear="all">
            
            <table cellpadding="0" cellspacing="0" border="0" class="stdtable invoicetable">
                    <thead>
                        <tr>
                            <th class="head0">Type</th>
                            <th class="head0">From Currency</th>
                            <th class="head0">To Currency</th>
                            <th class="head0">From Amount</th>
                            <th class="head0">To Amount</th>
                        </tr>
                    </thead>
                    <tbody>
           
                        <tr>
                          <td><?php echo  $type?></td>
                           <td><?php echo  $row->tr06_from_currency?></td>
                            <td><?php echo  $row->tr06_to_currency?></td>
                            <td>$<?php echo  $row->tr06_from_amount?></td>
                            <td>$<?php echo  $row->tr06_to_amount?></td>
                        </tr>
                      
                        
                    </tbody>
                </table>
                                
                <table cellpadding="0" cellspacing="0" border="0" class="invoicetable">
                    <colgroup>
                        <col class="con0" width="80%">
                        <col class="con1" width="20%">
                  </colgroup>
                    <tbody>
                        <tr>
                            <td class="right" style="border-right: 1px solid #ddd; padding-right: 10px; ">
                            	Total Amount <br>
                              
                            </td>
                            <td class="right"><strong>$<?php echo $row->tr06_to_amount?></strong></td>
                        </tr>
                      <tr>
                            <td class="right" style="border-right: 1px solid #ddd; padding-right: 10px; ">
                            	Total Amount Due: <br>
                              
                            </td>
                            <td class="right"><strong>$<?php echo $row->tr06_to_amount?></strong></td>
                        </tr>
                    </tbody>
          </table>
			
          <div class="amountdue">
          	
            <a href="" onclick="printDiv()">Print Invoice</a>
          </div>
          
			
           <div>Authorized Officer</div>                            
      </div><!--contentwrapper-->
        
	</div>

            </div><!--subcontent-->
            
            <!--subcontent-->
            
            
            </div>
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->


<script>
function printDiv() 
{

  var divToPrint=document.getElementById('centercontent');

  var newWin=window.open('','Print-Window');

  newWin.document.open();

  newWin.document.write('<html><body onload="window.print()"> <style>body{}table{  width:90%;  margin: 21px;} table tr td{border:1px solid red;margin:10px 10px 10px 10px;}table tr th{border:1px solid;margin:10px 10px 10px 10px;}table tr td:first-child {text-align: right;background: #fcfcfc;}table tr td { padding: 7px 10px;border: 1px solid #ddd;}</style>'+divToPrint.innerHTML+'</body></html>');

  newWin.document.close();

  setTimeout(function(){newWin.close();},10);

}
</script>