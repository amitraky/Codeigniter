 <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">All Users</h1>
            <span class="pagedesc">Welcome to Users</span>
            
            <ul class="hornav">
                <li class="current"><a href="#basicform">Users</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        	
         <div id="basicform" class="subcontent">
            
              <div class="contenttitle2">
                	<h3>All User Summary</h3>
                </div><!--contenttitle-->
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable2">
                   
                    <thead>
                        <tr>
                           
                           <th class="head0">Sr.No</th>
                            <th class="head1">Login ID</th>
                            <th class="head0">Name</th>
                            <th class="head1">Date</th>
                               <th class="head0">Email</th>
                            <th class="head1">Mobile</th>
                             <th class="head0">Status</th>
                            <th class="head1">Referral</th>
                             <th class="head0">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                         
                            <th class="head0">Sr.No</th>
                            <th class="head1">Login ID</th>
                            <th class="head0">Name</th>
                            <th class="head1">Date</th>
                            <th class="head0">Email</th>
                            <th class="head1">Mobile</th>
                            <th class="head0">Status</th>
                            <th class="head1">Referral</th>
                            <th class="head0">Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    <?php $sr=1; foreach($rows as $row){?>
                        <tr class="gradeX">
                            <td><?php echo $sr++;?></td>
                            <td><?php echo $row->or_m_user_id;?></td>
                           <td><?php echo $row->or_m_name;?></td>
                            <td><?php echo $row->or_m_regdate;?></td>
                            <td><?php echo $row->or_m_email;?></td>
                            <td><?php echo $row->or_m_mobile_no;?></td>
                           <td><?php echo $row->or_m_status==1?'Active':'Incative';?></td>
                             <td><?php echo $row->or_m_intr_name;?></td>
                             <td class="head0"><a href="<?php echo base_url('Admin/profile/'.$row->or_m_reg_id)?>" style="color:red">Edit</a></td>
                        </tr>
                        <?php } ?>
                       
                    </tbody>
                </table>
        
        </div><!--contentwrapper-->
            
            <!--subcontent-->
        
        </div><!--contentwrapper-->
        
	</div><!-- centercontent -->