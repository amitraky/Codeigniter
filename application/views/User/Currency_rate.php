 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Doller Rate</h1>
            <span class="pagedesc">Welcome to Doller Rate</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Doller</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="basicform" class="contentwrapper">
        	
        <div class="contenttitle2 nomargintop">
                            <h3>Today's Dollar Rate Summary</h3>
                        </div><!--contenttitle-->
                        
                       
                           <br clear="all" />
                        <br clear="all" />
                        <div class="contenttitle2 nomargintop">
                            <h3>Exchange Charge</h3>
                        </div><!--contenttitle-->
                        <table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb">
                           
                            <thead>
                                <tr>                             
                                
                                    <th class="head0">Type</th>
                                    <th class="head1">Charge</th>
                                </tr>
                            </thead>
                          
                            <tbody>
                                <?php 
foreach($rows as $row){

if($row->m6_type == 3  ){
           ?>
                                <tr>
                                    <td><?php echo $row->m07_currency_name?>   </td>
                                    <td><?php echo $row->m07_charge?></td>
                                </tr>
                               <?php }} ?>
                               
                            </tbody>
                        </table>
                        <br />
                       <div class="contenttitle2 nomargintop">
                            <h3>Buy Rate</h3>
                        </div><!--contenttitle-->
                        
                        
                          <table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb overviewtable2">
                           
                            <thead>
                                <tr>                             
                                
                                    <th class="head0">Type</th>
                                    <th class="head1">Charge</th>
                                </tr>
                            </thead>
                          
                            <tbody>
                               <?php foreach($rows as $row){
if($row->m6_type == 1  ){
           ?>
                                <tr>
                                    <td><?php echo $row->m07_currency_name?>   </td>
                                    <td><?php echo $row->m07_charge?></td>
                                </tr>
                               <?php }} ?>
                               
                            </tbody>
                        </table>
                        <!-- widgetbox -->  
                        <br />   
       <div class="contenttitle2 nomargintop">
                            <h3>Sell Rate</h3>
                        </div><!--contenttitle-->
                        
                        
                          <table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb overviewtable2">
                           
                            <thead>
                                <tr>                             
                                
                                    <th class="head0">Type</th>
                                    <th class="head1">Charge</th>
                                </tr>
                            </thead>
                          
                            <tbody>
                            <?php foreach($rows as $row){
if($row->m6_type == 2  ){
           ?>
                                <tr>
                                    <td><?php echo $row->m07_currency_name?>   </td>
                                    <td><?php echo $row->m07_charge?></td>
                                </tr>
                               <?php }} ?>

                            </tbody>
                        </table>
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->