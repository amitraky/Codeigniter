<?php

class User extends CI_Controller
{
    
	private $userid =  null;
	
    public function __construct()
    {
        parent::__construct();
		$this->logged_in();
		$this->load->model('User_model','User');
    }
///////////////////////////////////////////////////////////private members///////////////////////////////////	
	private function logged_in()
	{
	  $row = @array_filter($this->session->userdata['logged_in']);
	  if( empty($row) )
	  {
		set_msg('info','Wrong Directory access');  
	    redirect('Auth');
	  }
	  if( $row['user_type'] != 2 )
	  {
		set_msg('info','Invalid access');  
	    redirect('Auth');
	  }
	
	  $this->userid = $row['user_id'];
	   
	}
	
	private function user_model($fx,$param1=null,$param2=null,$param3=null,$param4=null)
	{
	  return $this->User->$fx($param1,$param2,$param3,$param4); 
	}
    
    private function post($name)
    {
        if(empty($name))
        {
           return false;
        }
        return $this->input->post($name);
    }
	
	
	 private function upload_image($file_name,$height=null,$width=null,$path=null,$i=null)
	 {  
			//  upload an image options
			if(empty($upload_path))
			{
			  $upload_path='assets/uploaded/';
			}
			
			//print_r($_FILES);
			$file = $_FILES[$file_name]['name'];
			$exe = @end(explode('.',$file));
			$config = array();
			$config['upload_path'] = $upload_path;
			$config['allowed_types'] = 'jpg|gif|png|jpeg|JPG|PNG';
			$config['max_size']      =   "5000";
            $config['file_name']     = time().'.'.$exe;
			$this->load->library('upload',$config);			
			$this->upload->initialize($config);
			
		    if ( ! $this->upload->do_upload($file_name))
             {
                        $error =  $this->upload->display_errors();
						echo $error;die;
            }
           else
           {
              $file = $this->upload->data();
			  $this->resize_image($file['file_name'],$height,$width,$path,$i);
			  
			  if($i == 55)
			  { 
			    $this->resize_image($file['file_name'],95,95,$path.'thumbs/',66);
			  }
			 
			  //unlink($config['upload_path'].$file['file_name']);
			  return $file['file_name'];  
           }			
			
		}
	
	 private function resize_image($file,$height=300,$width=300,$path,$i=null)
	 {
		   
			$config1['image_library'] = 'gd2';
			$config1['source_image']  = 'assets/uploaded/'.$file;
			$config1['new_image']  = 'assets/uploaded/'.$path;
			$config['create_thumb'] = TRUE;
			$config1['width']	 = $width;
			$config1['height']	= $height;
			$this->load->library('image_lib', $config1); 
			$this->image_lib->initialize($config1);
			$this->image_lib->resize();
			$this->image_lib->clear(); 
	}
		
///////////////////////////////////////////////////////////PUblic members///////////////////////////////////
    public function index($data = null)
    {
        if (empty($data)) {
            $data['page'] = 'Dashboard';
        }
        
        $this->load->view('User/index', $data);
    }
    
	
	 public function dashboard()
    {
      $this->index(array('page'=>'Dashboard'));
	   
    }
	
	 public function sell()
    {
      $data['page'] = 'sell';
     
      $data['sends'] = $this->user_model('get_where','m06_currency_type',array('m6_type'=>1,'m6_status'=>1));
      $data['reciveds'] = $this->user_model('get_where','m06_currency_type',array('m6_type'=>2,'m6_status'=>1));
      $this->index($data);
	   
    }
	
	 public function buy()
    {
      $data['page'] = 'Buy';
      $data['sends'] = $this->user_model('get_where','m06_currency_type',array('m6_type'=>1,'m6_status'=>1));
      $data['reciveds'] = $this->user_model('get_where','m06_currency_type',array('m6_type'=>2,'m6_status'=>1));
 
      $this->index($data);
	   
    }
		 public function exchange()
    {
      $data['page'] = 'Exchange';
      $data['rows'] = $this->user_model('get_where','m06_currency_type',array('m6_type'=>3,'m6_status'=>1));

      $this->index($data);
	   
    }

    public function do_transaction()
     {
      

          $act = $this->post('act');
  
        $data['tr06_user_id'] = $this->userid;
        $data['tr06_invoice_id'] = time();
       

       $data['tr06_from_currency'] = $this->post('send_currency');
        $data['tr06_from_amount']  = $this->post('send_amount');
         $data['tr06_to_currency']  = $this->post('recive_currency');
          $data['tr06_to_amount']  = $this->post('recive_amount');
          $data['tr06_email']  = $this->post('email');
           $data['tr06_pm_id']  = $this->post('pm_id');
          $data['tr06_mobile']  = $this->post('mobile');
       
            $data['tr06_type'] = $act;
            $data['tr06_date'] = date('Y-m-d H:i:s');
            $data['tr06_status'] = 0;

         $res =   $this->user_model('insert','tr06_currency_ledger',$data);
              set_msg('success','Transaction success !'); 
        redirect("User/buy");     
       }
  



	 public function buy_transaction()
    {
      $data['page'] = 'Buy_transaction';
      $data['rows'] = $this->user_model('get_where','view_currency_ledger',array('tr06_user_id'=>$this->userid,'tr06_type'=>1));
      $this->index($data);
	   
    }

		 public function sell_transaction()
    {
      $data['page'] = 'Sell_transaction';
      $data['rows'] = $this->user_model('get_where','view_currency_ledger',array('tr06_user_id'=>$this->userid,'tr06_type'=>2));
      $this->index($data);
	   
    }

 public function exchange_transaction()
    {
      $data['page'] = 'Exchange_transaction';
      $data['rows'] = $this->user_model('get_where','view_currency_ledger',array('tr06_user_id'=>$this->userid,'tr06_type'=>3));
      $this->index($data);
	   
    }



	
	
	 public function currency_rate()
    {
          $data['rows'] = $this->user_model('get_where','view_currency_rate',array('m07_status'=>1));
   
          $data['page'] = 'Currency_rate'; 
         $this->index($data);
    }
	
	
	
	public function profile()
    {
      $data['page'] = 'Profile';
	  
	  $udate  = array();
	  
	  $act = $this->post('act');
	  
	  if($act == 1)
	  {
	    $udate['or_m_name'] = $this->post('name');
		$udate['or_m_email'] = $this->post('email');
	  }
	  
	  if($act == 2)
	  {
		$file = $this->post('file');  
		$file2 = $this->post('file2');
		$photo = array();
		if(!empty($_FILES['userfile']['name']))
		   {
		    $file = $this->upload_image('userfile',28,28,'photo/',55);
		   } 
		    
	    $udate['or_m_userimage'] = $file;
		$udate['or_m_userimage2'] = $file;
	  }
	  
	  if($act == 3)
	  {
	    $udate['or_m_country'] = $this->post('country');
	  }
	  
	  if($act == 4)
	  {
		
		$new_pass =   $this->post('new_pass');
		$c_pass =  $this->post('c_pass');
		
		if(!empty($c_pass))
		{
			if($new_pass == $c_pass)
			{
			   $udate['or_login_pwd'] = $new_pass;
			}
		
		}
		
		$pin_pass = $this->post('pin_new_pass');
		$c_pin_pass = $this->post('pin_c_pass');
		
		if(!empty($pin_pass))
		{
			if($c_pin_pass == $pin_pass)
			{
			  $udate['or_pin_pwd'] = $pin_pass;
			}
	    }
		
		
		if(!empty($udate))
		$this->user_model('update','tr01_login',$udate,'or_user_id',$this->userid);
		$udate = array();
	  }
	  
	// print_r($udate);die;
	  
	  if(!empty($udate))
	  {
		$this->user_model('update','m03_user_detail',$udate,'or_m_reg_id',$this->userid);
	    set_msg('success','profile update success');
		redirect('user/profile');
	  }
	  
	  
	  $data['rows'] = $this->user_model('get_where','m02_location',array('m_parent_id'=>'0'));
	  $data['row'] = $this->user_model('profile',$this->userid);	
      $this->index($data);
	   
    }
	
	
	 public function referral_list()
    {
	   $data['page'] = 'Referral_list';
	   $data['rows'] = $this->user_model('referral',$this->userid);	
       $this->index($data);
	   
    }
	
	 public function help($data = null)
    {
      $this->index(array('page'=>'Help'));
	   
    }
	
	
	
	
	public function registration()
	{
		$data['page'] = 'registration'; 

	   $data['rows'] = $this->user_model("get_where",'m02_location',array('m_status'=>'1'));
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
		    set_msg('error','Fill all Required fields');
            $redirect = "user/registration";
        }
		else 
		{
			$this->load->model('Auth_model','Auth');
			$res = $this->Auth->add_account('admin');
            set_msg('success','You have successfully Registered');
            $redirect = "user/registration";
	    }
		redirect($redirect);
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
    
   
  public function currency_details()
  { 
   $id = $this->input->post('c_id');
   $row =   $this->db->get_where('view_currency_rate',array('m07_currency'=>$id))->row();
   echo json_encode($row);
 }
    
    
    
}
?>