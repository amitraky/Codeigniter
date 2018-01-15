 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle"> Transaction  Type</h1>
            <span class="pagedesc">Welcome to Transaction  Type</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">All Transaction  Type</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
            
         <div id="basicform" class="subcontent">
              <?php echo get_msg()?>
              <div class="contenttitle2">
                	<h3>All Transaction Summary</h3>
                </div><!--contenttitle-->
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                           <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head0">Description</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                         
                            <th class="head0">Sr.No</th>
                            <th class="head1">Name</th>
                            <th class="head0">Description</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1; foreach($rows as $row){?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->m08_title;?></td>
                           <td><?php echo $row->m08_description;?></td>
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        

        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->