<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {

	/////////////////////////////////////////////////////////////////////////
	//////////     Constructor In Member Controller    ///////
	//////////////////////////////////////////////////////////////////////

	public function __construct()
	{
		parent::__construct();
		$this->_is_logged_in();
	}
	
	
	private function _is_logged_in() 
	{
		if($this->session->userdata('user_type') == '')
		{
		  redirect('auth/logout');
		}
	}



   public function   view_user_plan()
   {
          $userid = $this->input->post('id');
          $rows =  $this->db->get_where("view_topup_request",array("tr10_mem_uid"=>$userid,'circle_status'=>1))->result();
          $str = null;
        $table = '<table class="table table-condensed m-0" border="1">
            <thead>
              <tr>
                <th>Sr.</th>
                <th>Package</th>
                <th>Amount</th>
                 <th>ROI</th>
                <th>Requ Date</th>
                 <th>Appro Date</th>
               <th>Status</th>
              </tr>
            </thead>
            <tbody>';
          $i=0;
         foreach($rows as $row)
         {
              $status = $row->tr10_mem_status==1?'Active':'Pending';
              $str .= '<tr><td>'.++$i.'</td><td>'.$row->tr10_type.'</td><td>'.$row->m_pack_fee.'</td><td>'.$row->circle_growth_rate.'</td><td>'.$row->tr10_mem_txn_date.'</td><td>'.$row->tr10_mem_txn_approve_date.'</td><td>'.$status.'</td></tr>';
         }   
         echo $table.$str.'  </tbody></table>';
  
    }
	
	
		
	 public function   view_user_profile()
   {
          $userid  = $this->input->post('id');
          $data= $this->db->query("CALL sp_member_detail(' `m03_user_detail`.`or_m_reg_id` = $userid')")->row_array();
          mysqli_next_result( $this->db->conn_id );
          echo json_encode($data);
 
    }

     public function   update_user_profile()
       {
          $userid  = $this->input->post('user_id');
           $data['or_m_name']  = $this->input->post('name');
          $data['or_m_email']  = $this->input->post('emailid');
          $data['or_m_mobile_no']  = $this->input->post('mobile');

          $login['or_login_pwd']   = $this->input->post('pass');
          $login['or_pin_pwd']   = $this->input->post('txn_pass');
         
          $data = array_filter($data);   
           
     
  if(!empty($data))
          $this->db->where("or_m_reg_id",$userid)->update("m03_user_detail",$data);
       
          $data = array_filter($login);      
         
           if(!empty($data))
              $this->db->where("or_user_id",$userid)->update("tr01_login",$login);
     redirect("Report/members");
        }


        public function   update_user_status()
       {
          $st  = $this->uri->segment(3);
          $userid  = $this->uri->segment(4);

          $this->db->where("or_m_reg_id",$userid)->update("m03_user_detail",array("or_m_status"=>$st));
        redirect("Report/members");
        
        }

 public function   check_pass()
       {
          $userid  = $this->session->userdata('profile_id');
         $pass  = $this->input->post('pass');

          $num = $this->db->get_where("tr01_login",array("or_user_id"=>$userid,'or_pin_pwd'=>$pass));
         print_r($num);
        
        }


public function current_rate_price()
   {
         $res  = file_get_contents("https://blockchain.info/tobtc?currency=USD&value=1");
         echo $res;
     
   }
	
	
	
	
	
}