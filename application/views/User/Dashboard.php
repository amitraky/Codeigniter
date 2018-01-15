
<div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">Dashboard</h1>
            <span class="pagedesc">&nbsp;</span>
            
            <ul class="hornav">
                <li class="current"><a href="#updates">Updates</a></li>
                <li><a href="#activities">Activities</a></li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
        
        	<div id="updates" class="subcontent">
                    <div class="notibar announcement">
                        <a class="close"></a>
                        <h3>Announcement</h3>
                        <p>Welcome to Your Dashboard!</p>
                    </div><!-- notification announcement -->
                    
                    <!--two_third dashboard_left -->
                    <div class="notibar danger_announcement">
                        <a class="close"></a>
                        <h3>Attention !</h3>
                        <p>Text Here !</p>
                    </div>
                    
                    
                    <div class="notibar">
                       <br />

                        <h3 style="color: #ef7203;"><span style="color:green">Referral Link : </span><?php echo base_url('Auth/registration?id=').$this->session->logged_in['email']?></h3>
                       
                    </div>
                    
                    
                    <!--one_third last-->
                  <div class="two_third dashboard_left">
                    
                    	<ul class="shortcuts">
                        	<li><a href="#" class="money"><span>Buy Currency </span></a></li>
                            <li><a href="#" class="money"><span>Sell Currency </span></a></li>
                            <li><a href="#" class="money"><span>Exchange Currency </span></a></li>
                        </ul>
                        
                        <br clear="all">
                    
                      
                        <table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb overviewtable2">
                            <thead>
                                <tr>
                                     <th class="head1">Sr.</th>
                                    <th class="head1">Date</th>
                                    <th class="head0">Transaction Type</th>
                                    <th class="head1">Sent Gateway</th>
                                    <th class="head0">Receive Gateway</th>
                                    <th class="head1">Amount</th>
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
                                    <th class="head1">Amount</th>
                                    <th class="head1">Status</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td class="center">0</td>
                                    <td class="center">0</td>
                                      <td class="center">0</td>
                                </tr>
                              
                            </tbody>
                        </table>
                        
                    </div>  
                    
            </div><!-- #updates -->
            
            <div id="activities" class="subcontent" style="display: none;">
            	&nbsp;
            </div><!-- #activities -->
        
        </div><!--contentwrapper-->
        
        <br clear="all" />
        
       <br /><br /> 
	</div><!-- centercontent -->
    
    
</div><!--bodywrapper-->

</body>