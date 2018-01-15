<?php

class Auth extends CI_Controller
{
    
    public function __construct()
    {
        parent::__construct();
		$this->load->model('Auth_model','Auth');
    }
    
    public function index($data = null)
    {
        if (empty($data)) {
            $data['page'] = 'Login';
        }
        
	
        $this->load->view('Auth/index', $data);
    }
    
    public function check_sms()
    {
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->database();
        $mob = '9044592446';
        $msg = "TestingFinal";
        $this->crud_model->send_sms($mob, $msg);
    }
    
    public function login_process()
    {
		 
		 
        $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
        
        if ($this->form_validation->run() == FALSE) {
            if (isset($this->session->userdata['logged_in'])) {
                 redirect("User/dashboard");
            } else {
				set_msg('error','Invalid Username or Password');
                redirect("Auth");
            }
        } else {
            $data   = array(
                'username' => $this->input->post('username'),
                'password' => $this->input->post('password')
            );
            $result = $this->Auth->login($data);
            if ($result == TRUE) {
                
                $username = $this->input->post('username');
                $row   = $this->Auth->read_user_information($username);
                if ($row != false) {
                    $session_data = array(
					    'user_id' =>$row->or_user_id,
                        'logid' => $row->or_m_user_id,
                        'email' => $row->or_m_email,
						'name' => $row->or_m_name,
						'user_type' => $row->or_user_type,
                        'photo' => $row->or_m_userimage
                    );
					
					if($row->or_user_type == 1)
					{
					   $dashboard = 'Admin/dashboard';
					}
					elseif($row->or_user_type == 2)
					{
					   $dashboard = 'User/dashboard';
					}
					else
					{
						 set_msg('error','Invalid User');  
						 redirect("Auth/index");	
					} 
					// Add user data in session
					$this->session->set_userdata('logged_in', $session_data);
                    redirect($dashboard); 
                }
            } else {                
				set_msg('error','Invalid Username or Password');
               redirect("Auth");
            }
        }
        
    }
	
	
	public function registration()
	{
   
      $data['page'] = 'Registration';
      $data['rows'] = $this->db->get('m02_location',array('m_status'=>1))->result();
      $data['rows'] = $this->Auth->country();     
	  $this->index($data);
	}
	
	
	public function create_account()
	{
		$this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
	    $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
		$this->form_validation->set_rules('referal', 'Referal', 'trim|required|xss_clean');
              
        

        if ($this->form_validation->run() == FALSE) {
                set_msg('error','Please fill all mandatory fields');
                 redirect('Auth/registration');
               // $this->load->view('Auth/index',array('page'=>'Registration'));
           
        }
		else 
		{
			$res = $this->Auth->add_account('Front');
           if($res == false)
           {
               echo set_msg('error','Invalid verification');
           }
            echo set_msg('success','You have successfully Registered');
            redirect("Auth/registration");
	    }
	}
	
	
	
	
	
	
	
	
    
    // Logout from admin page
    public function logout()
    {
        
        // Removing session data
        $sess_array = array(
            'username' => ''
        );
		
        $this->session->unset_userdata('logged_in');
		set_msg('success','Successfully Logout');
        $this->index(array('page' => 'Login'));
		
		redirect('Auth');
    }
	
	
	
///////////////////////////////////AJAX PART///////////////////////////////////////////	
	
	 public function check_referal()
   {
	     $logid = $this->input->post('referal');
		
         $res= $this->db->get_where('m03_user_detail',array('or_m_user_id'=>$logid));
		 		 
		 $num_rows = $res->num_rows();	 
		
		 if($num_rows  == 1)
		 { 
		  echo 1;
		 }
		 else
		 {
		   echo 0;
		 }
     
   }
	
    
    
    
}
?>