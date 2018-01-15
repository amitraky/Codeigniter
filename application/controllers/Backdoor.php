<style>
 td{text-align:center;}
table { border-collapse: collapse; }
td { padding: 0; }
tr { border-bottom:1px  #494949; }


</style>

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backdoor extends CI_Controller {

	//////////////////////////////////////////////////////////////////////////
	//////////     Constructor In Member Controller    ///////
	/////////////////////////////////////////////////////////////////////////

	public function __construct()
	{
		parent::__construct();
		
		$lid = $this->session->userdata('profile_id');
		mysqli_next_result( $this->db->conn_id );
       
		
	}

	/////////////////////////////////////////////////////////////////////////
	//////////     Check Login    ///////
	//////////////////////////////////////////////////////////////////////

	


	/*----------------------User Dashboard----------------------------*/
  
     
   public function all_user_balance()
   {

        $this->db->get('m03_user_detail')->result(); 
        foreach($rows as $row)
        {
            //$data =  user_is_wallet($row->or_m_reg_id);
           print_r($row);
        } 
         

        function user_is_wallet($userid){
     
          $data['MAIN_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,1) as amount")->row()->amount;
          $data['DIRECT_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,2) as amount")->row()->amount;
          $data['MATCHING_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,3) as amount")->row()->amount;
          $data['ROI_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,4) as amount")->row()->amount;
          $data['BONUS_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,5) as amount")->row()->amount;
          $data['OTHER_AMOUNT'] =$this->db->query("SELECT get_available_bal($userid,6) as amount")->row()->amount;
          return $data;
          }
    
    }

  public function sp($sp,$type)
  {
      $res = $this->db->query("CALL  $sp($type) as amount")->row()->amount;
      mysqli_next_result( $this->db->conn_id );
      return $res;
  }


	public function closing()
	{
      $rows = $this->db->get('tr05_closing_date');  
       
       foreach($rows as $key=>$row)
       { 
          $from_date = $rows[$key];
          $to_date = $rows[$key+1];
          echo "CALL `sp_management`('$from_date','$to_date',@msg)";
        }
		
	}

	
	public function date_pair()
	{
        $uri = $this->uri->segment(3);
		$rows = $this->db->get_where('tr03_datewise_pair',array("date_format(tr_date,'%Y-%m-%d')"=>$uri))->result();
      $str = "<table align='center' border='1' width='800'><tr><th>Reg</th><th>Left Income</th><th>Right Income</th><th>Date</th></tr>";
       foreach($rows as $row)
       {
              $str .= "<tr>"
                          ."<td>".$row->or_m_reg_id."</td>"
                           ."<td>".$row->tr_today_rvol."</td>"
                           ."<td>".$row->tr_today_lvol."</td>"
                           ."<td>".$row->tr_date."</td>"
           ;

       }         
       echo $str;	  


     }


     
    public function payout()
	{
        $uri = $this->uri->segment(3);
		$rows = $this->db->get_where('tr04_payout_detail',array("date_format(tr_from_payout_date,'%Y-%m-%d')"=>$uri))->result();
      $str = "<table align='center' border='1' width='800'><tr><th>Reg</th><th>Left Income</th><th>Right Income</th><th>Date</th></tr>";
       foreach($rows as $row)
       {
              $str .= "<tr>"
                          ."<td>".$row->or_m_reg_id."</td>"
                              ."<td>".$row->or_m_reg_id."</td>"
                              ."<td>".$row->or_m_reg_id."</td>"
                           ."<td>".$row->tr_payout_final_income."</td>";
       }         
       echo $str;	  


     }





	// -------------USER REGISTRATION INSERTION---------------

	public function register_candidate()
	{  
        $userid = $this->session->userdata('profile_id');
        $introducer = $this->input->post('txtintroducer_id');
        $introd_id = $this->db->get_where('m03_user_detail',array('or_m_user_id'=>$introducer))->row()->or_m_reg_id;
     
       // $num = $this->db->get_where('m03_user_detail',array('or_m_intr_id'=> $introd_id))->num_rows();
       
        
        
       $sponid = trim($this->input->post('txtintroducer_id'));
       $parent = trim($this->input->post('txtparent_id'));

        if(empty($sponid) or empty($parent ))
         {
           set_msg('error',' Please Enter valid sponsor Id 	');     
            echo '1';   
           return false;
         }

		$output=$this->member_model->signup();
		$this->session->set_flashdata('succ','Registerd Successfully!!');
		echo $output;
	}

	/*|--------------------------------------|*/
	/*|------   UPDATE USER PROFILE   -------|*/
	/*|--------------------------------------|*/

	public function view_member_edit()
	{	
		$data['form_name'] = "Edit Member";

		$this->db->where('m_parent_id',1);
		$this->db->where('m_status',1);
		$data['state']=$this->db->get('m02_location');

		$condition = "`m03_user_detail`.`or_m_reg_id` = '".$this->session->userdata('profile_id')."'";
		$call_procedure = ' CALL sp_member_detail("'. $condition .'")';
		$data['rec'] = $this->db->query($call_procedure)->row();
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_member_edit',$data);
		$this->load->view('common/footer');
	}

	/*-------------UPDATE USER DETAILS-----------------*/

	public function update_member()
	{
		$this->member_model->update_member();
		$this->session->set_flashdata('info','Updated Successfully!!');
		header("Location:".base_url()."userprofile/view_member_edit");
	}

	/*|--------------------------------------|*/
	/*|------     VIEW USER PROFILE   -------|*/
	/*|--------------------------------------|*/

	public function view_member_details()
	{	
		$data['form_name'] = "View Member Profile";

		$condition = "`m03_user_detail`.`or_m_reg_id` = '".$this->session->userdata('profile_id')."'";
		$call_procedure = ' CALL sp_member_detail("'. $condition .'")';
		$data['rec'] = $this->db->query($call_procedure)->row();
		mysqli_next_result( $this->db->conn_id );
		
		/* $data['da'] = $this->session->set_userdata(array(
										'user_image'       => $data['rec']->User_image,
										'username'      => $data['rec']->Associate_Name,
										'mob'       => $data['rec']->Mobile_No,
										'email'          => $data['rec']->Email,
										'state'        => $data['rec']->State,
										'status'        => TRUE
										));  */

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_member_details',$data);
		$this->load->view('common/footer');
	}

	/*|-----------------------------------------------------|*/
	/*|------   ADD BANK DETAILS      -------|*/
	/*|-----------------------------------------------------|*/

	public function view_bank_details()
	{
		$data['form_name'] = "View Bank Details";
		$data['table_name'] = "Update Bank Details";

		$data['bank'] = $this->db->where("m_bank_status",1)->get("m01_bank");

		$call_procedure = ' CALL sp_member_detail("`m03_user_detail`.`or_m_reg_id` = '.$this->session->userdata('profile_id').'")';
		$data['bank_details']=$this->db->query($call_procedure);
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_bank_details',$data);
		$this->load->view('common/footer');
	}

	public function update_bank_details()
	{
		$this->member_model->update_bank_details();
		$this->session->set_flashdata('info','Bank Details Updated Successfully!!');
		header("Location:".base_url()."userprofile/view_bank_details");
	}

	/*|--------------------------------------|*/
	/*|------     Welcome Letter     -------|*/
	/*|--------------------------------------|*/

	public function member_welcome_letter()
	{
		$data['form_name'] = "Welcome Letter";

		$call_procedure = ' CALL sp_member_detail("`m03_user_detail`.`or_m_reg_id` = '.$this->session->userdata('profile_id').'")';
		$data['info']=$this->db->query($call_procedure);
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/member_welcome_letter',$data);
		$this->load->view('common/footer');
	}

	/*|--------------------------------------|*/
	/*|------     Welcome Invoice     -------|*/
	/*|--------------------------------------|*/

	public function member_welcome_invoice()
	{
		$data['form_name'] = "User Invoice";

		$call_procedure = ' CALL sp_member_detail("`m03_user_detail`.`or_m_reg_id` = '.$this->session->userdata('profile_id').'")';
		$data['info']=$this->db->query($call_procedure);
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/member_welcome_invoice',$data);
		$this->load->view('common/footer');
	}

	/*|--------------------------------------|*/
	/*|------     UPDATE Password     -------|*/
	/*|--------------------------------------|*/

	public function change_password()
	{ 

		$data['form_name'] = "Change Password";
		$data['form_name1'] = "Change Pin Password";
		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_change_password',$data);
		$this->load->view('common/footer');
	}

   public function match_password($type,$newpwd,$oldpwd)
   {
     $res =  $this->db->get_where('tr01_login',array('or_user_id'=>$this->session->userdata('profile_id')))->row();
      $userid = $this->session->userdata('profile_id');
     if($type == 1)
    {  
          if($res ->or_login_pwd ==   $oldpwd)
           {
                $this->db->where('or_user_id',$userid)->update('tr01_login',array('or_login_pwd'=>$newpwd));
                return 1;
             }
           else
           {
             return "Password Not Match";
            }         
    }
    if($type == 2)
    {
         
        if($res ->or_pin_pwd ==   $oldpwd)
           {
                $this->db->where('or_user_id',$userid)->update('tr01_login',array('or_pin_pwd'=>$newpwd));
                return 1;
             }
           else
           {
             return "Password Not Match";
            }     
   }

   }




	public function update_password()
	{
		$oldpwd = $this->input->post('oldpwd');
        $newpwd = $this->input->post('txtpassword');
        $txtcpassword = $this->input->post('txtcpassword');
        $type = $this->input->post('type');
         
       $res = $this->match_password($type,$newpwd,$oldpwd);
     

		if($res == 1)
             set_msg('success','Updated Successfully!!');  
		else
             set_msg('error', 'Some thing went wrong.');

		header("Location:".base_url()."userprofile/change_password");
	}

    
  public function last_login_details()
	{
		$id = $this->session->userdata('profile_id');
		$data['row'] = $this->db->get_where("tr01_login",array("or_user_id"=>$id))->row();
		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/last_login_details',$data);
		$this->load->view('common/footer');
	}

	/*|---------------------------------------------------------|*/
	/*|------  		    USER DIRECT REFFERAL             -------|*/
	/*|---------------------------------------------------------|*/

	public function view_direct_referal()
	{
		$data['form_name'] = "Search Direct Referal";
		$data['table_name'] = "View Direct Referal";
		$data['rec'] = '';

		$id = $this->session->userdata('profile_id');

		$call_procedure = ' CALL sp_member_detail("`m03_user_detail`.`or_m_intr_id` = '.$id.'")';
		$data['rec'] = $this->db->query($call_procedure);
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_direct_referal',$data);
		$this->load->view('common/footer');
	}

	/*|--------------------------------------------------------|*/
	/*|------        		USER DOWNLINE  		 	    -------|*/
	/*|--------------------------------------------------------|*/

	public function view_user_downline()
	{
	

		$id = $this->session->userdata('profile_id');		
		$data['rows'] = $this->db->query("CALL sp_tree_leg(".$id.",1)")->result();

       
		mysqli_next_result( $this->db->conn_id );

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_user_downline',$data);
		$this->load->view('common/footer');
	}

	/*|--------------------------------------------------|*/
	/*|------     		USER TREE STRUCTURE	      -------|*/
	/*|--------------------------------------------------|*/

	public function tree()
	{
		$data['form_name'] = "Tree Stucture";

		$id=$this->uri->segment(3);
		$res=$this->member_model->scan_team($id);
		if($res=='true')
		{
			$data['s']=1;
			$this->db->query("CALL `sp_user_at_level`($id,3)");
			$data['tr']=$this->db->query("SELECT * FROM `view_tree` WHERE `REGID` IN (SELECT * FROM total_user)");
		}
		else
		{
			$data['s']=0;
			$this->db->query("CALL `sp_user_at_level`(".$this->session->userdata('profile_id').",3)");
			$data['tr']=$this->db->query("SELECT * FROM `view_tree` WHERE `REGID` IN (SELECT * FROM total_user)");
			header("location:".base_url()."userprofile/tree/".$this->session->userdata('profile_id'));
		}

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_tree',$data);
		$this->load->view('common/footer');
	}

	/*----------------SEARCH USER ID IN TREE-------------------*/

	public function get_tree()
	{
		if($this->input->post('search_id')!='' || $this->input->post('search_id')!='0')
		{
			$this->db->where('or_m_user_id',trim($this->input->post('search_id')));
			$data['rec']=$this->db->get('m03_user_detail');
			foreach($data['rec']->result() as $row)
			{
				$reg_id=$row->or_m_reg_id;
				break;
			}
			header("Location:".base_url()."userprofile/tree/".$reg_id);
		}
	}

	/*|--------------------------------------------------------------------|*/
	/*|------    LEDGER REPORT OF USER        -------|*/
	/*|--------------------------------------------------------------------|*/


	public function view_ledger_report()
	{
		$condition="";
		$todate=0;
		$fromdate=0;

		$data['form_name'] = "Search Member Ledger";
		$data['table_name'] = "View Member Ledger";

		if($this->input->post('end')!="")
		{
			$todate=date('Y-m-d',strtotime($this->input->post('end')));
		}

		if($this->input->post('start')!="")
		{
			$fromdate=date('Y-m-d',strtotime($this->input->post('start')));
		}

		if($todate!='0' && $fromdate!='0')
		{
			$condition=$condition." `LEDGER_DATETIME`>=DATE_FORMAT('$fromdate','%d-%b-%Y') AND `LEDGER_DATETIME`<=DATE_FORMAT('$todate','%d-%b-%Y') AND ";
		}

		$condition=$condition." `LEDGER_UID`=".$this->session->userdata('profile_id');

		$data['rid']=$this->db->query("SELECT * FROM view_ledger WHERE ".$condition);

		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_ledger_report',$data);
		$this->load->view('common/footer');
	}

	/*|-----------------------------------------------------|*/
	/*|------  		    BEGIN TRANSFER IN TEAM 	     -------|*/
	/*|-----------------------------------------------------|*/

	public function find_in_team()
	{
		$sessionid=$this->input->post('sessionid');
		$userid=$this->input->post('userid');
		$info=$this->db->query("SELECT get_member_in_team('".$sessionid."','".$userid."') as find_result");
		$row=$info->row();
		echo $row->find_result;
	}

	/*|---------------------------------------------------------|*/
	/*|------  		      BEGIN VIEW ALL NEWS      	     -------|*/
	/*|---------------------------------------------------------|*/

	public function view_all_news()
	{
		$data['form_name'] = "View All News";
		$this->db->where('m_news_status',1);
		$data['news']=$this->db->get('m24_news');
		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_all_news',$data);
		$this->load->view('common/footer');
	}

	/*|---------------------------------------------------------|*/
	/*|------  		      BEGIN VIEW ALL NEWS      	     -------|*/
	/*|---------------------------------------------------------|*/

	public function view_query_form()
	{
		$data['form_name'] = "Submit Query Here";
		$data['table_name'] = "View All Query";
		$this->db->where('TICKET_REGID',$this->session->userdata('profile_id'));
		$data['rec']=$this->db->get('view_ticket');
		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('user/view_query_form',$data);
		$this->load->view('common/footer');
	}

	public function insert_ticket()
	{
		$data=array(
			'tr_ticket_id'=>0,
			'tr_ticket_userid'=> trim($this->input->post('txtuserid')),
			'tr_ticket_title'=>trim($this->input->post('txttitle')),
			'tr_ticket_desc'=>$this->input->post('txtmsg'),
			'tr_ticket_reply'=>0,
			'tr_ticket_status'=>1,
			'tr_ticket_date'=>YmdHis,
			'proc'=>1
		);
		$query = " CALL sp_ticket(?" . str_repeat(",?", count($data)-1) . ",@msg) ";
		$this->db->query($query, $data);
		$query1=$this->db->query("SELECT @msg as message");
		$row = $query1->row();
		$this->session->set_flashdata('info',$row->message);
		header("Location:".base_url()."userprofile/view_query_form");
	}


	public function view_gift_user()
	{
        $data['rows'] = array();
        $userid = $this->session->userdata('profile_id');
        $first_amt = $this->db->get_where('view_users',array('or_m_reg_id'=>$userid))->row()->first_plan;
		 if(!empty($first_amt))
        {
         $this->db->where('or_m_regdate >= ' , date('Y-m-d', strtotime('-20 days')));
         $this->db->where('or_m_intr_id',$userid);
         $this->db->where('first_plan >= ',$first_amt);
         $this->db->limit(6,0);
		 $data['rows']=$this->db->get('view_users')->result();
        }
        
		$this->load->view('common/header');
		$this->load->view('common/user_menu',$this->data);
		$this->load->view('business/gift_users',$data);
		$this->load->view('common/footer');
	}


public function current_rate_price()
   {
         $res  = file_get_contents("https://blockchain.info/tobtc?currency=USD&value=1");
         return $res;
     
   }
   
   
   public function sp_management()
   {
      $rows = $this->db->get('tr05_closing_date')->result();
	  foreach($rows as $row)
	  {
	     echo "CALL sp_management('".$row->tr_closing_date."','".$row->tr_closing_date."',@msg);<br>";
	  
	  }
   
   }
   
   
   
   
 
}

?>