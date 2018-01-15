<?php
class Auth_model extends CI_Model
{
    
    
    // Insert registration data in database
    public function registration_insert($data)
    {
        
        // Query to check whether username already exist or not
        $condition = "user_name =" . "'" . $data['user_name'] . "'";
        $this->db->select('*');
        $this->db->from('user_login');
        $this->db->where($condition);
        $this->db->limit(1);
        $query = $this->db->get();
        if ($query->num_rows() == 0) {
            
            // Query to insert data in database
            $this->db->insert('user_login', $data);
            if ($this->db->affected_rows() > 0) {
                return true;
            }
        } else {
            return false;
        }
    }
    
    // Read data using username and password
    public function login($data)
    {
        
        $condition = "or_login_id =" . "'" . $data['username'] . "' AND " . "or_login_pwd =" . "'" . $data['password'] . "'";
        $this->db->select('*');
        $this->db->from('view_all_users');
        $this->db->where($condition);
        $this->db->limit(1);
        $query = $this->db->get();
        
        if ($query->num_rows() == 1) {
            return true;
        } else {
            return false;
        }
    }
    
    // Read data from database to show data in admin page
    public function read_user_information($username)
    {
        
        $condition = "or_login_id =" . "'" . $username . "'";
        $this->db->select('*');
        $this->db->from('view_all_users');
        $this->db->where($condition);
        $this->db->limit(1);
        $query = $this->db->get();
        
        if ($query->num_rows() == 1) {
            return $query->row();
        } else {
            return false;
        }
    }
	
	
	public function email_check($email){
 
	  $this->db->select('*');
	  $this->db->from('user');
	  $this->db->where('user_email',$email);
	  $query=$this->db->get();
	 
	  if($query->num_rows()>0){
		return false;
	  }else{
		return true;
	  }
      
    }
	
	
	public function create_account()
	{
            $data   = array(
                'or_m_user_id' => $this->input->post('username'),
                'or_m_designation' =>0,
				'or_m_name' => $this->input->post('name'),
				'or_m_dob' => 0,
				'or_m_gurdian_name' =>0,
				'or_member_joining_date' => 0,
				'or_m_gender' =>1,
				'or_m_email' => $this->input->post('email'),
				'or_m_landline_no' => 0,
				'or_m_mobile_no' =>0,
				'or_m_address' =>0,
				'or_m_pincode' =>0,
				'or_m_country' => $this->input->post('country'),
				'or_m_state' =>0,
				'or_m_userimage' => 0,
				'or_m_city' => 0,
				'or_m_status' =>0,
				'or_m_intr_id' => $this->input->post('referal'),
				'or_m_intr_name' =>0,
				'or_m_aff_id' => 0,
				'or_m_position' => $this->input->post('leg'),
				'm_pin_id' => 0,
				'or_m_regdate' =>0,
				'or_m_n_name' => 0,
				'or_m_n_age' => 0,
				'or_m_n_relation' => 0,
				'or_m_b_ifscode' => 0,
				'or_m_b_cbsacno' => 0,
				'or_m_b_name' => 0,
				'or_m_b_branch' => 0,
				'or_m_b_pancard' => 0,
				'or_m_b_adhar' =>0,
				'or_login_pwd' => $this->input->post('password'),
				'or_pin_pwd' => $this->input->post('password'),
				'or_reg_from' => 1,
				'proc'=>1,
				'msg'=>1
				
            );
		    return $data;
	    
	}
	
	
	
	
	public function add_account($data)
	{   
	   
	   $data = $this->create_account();
	   $array =  array_filter($data);
      
       $referral = $this->input->post('referal'); 	   
       $row = $this->db->get_where('m03_user_detail',array('or_m_email'=>$referral))->num_row();
       if(empty($row))
       {
            return false;
        }


	   if(empty( $array))
	   {
	    return false;
	   }
	  
	   $sql = " CALL sp_member(?" . str_repeat(",?", count($data)-1) . ",@msg) ";
	   $this->db->query($sql, $data);
	 
	   $id=$this->db->query("SELECT @msg as message")->row()->message;
	   $row = $this->db->get_where('view_all_users',array('or_m_user_id'=>$id));
	   $num_rows = $row->num_rows();
	   if($num_rows == 1)
	   {
	     return $row;
	   }
	   else
	    return false;
	   
	   
	}
	  

  public function country()
  {
   return $this->db->get_where('m02_location',array('m_parent_id'=>0))->result();
   }
	
	
    
    
}