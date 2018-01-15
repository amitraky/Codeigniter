<?php

class Admin extends CI_Controller
{
    private $userid =  null;
	
    public function __construct()
    {
        parent::__construct();
		$this->logged_in();
		$this->load->model('Admin_model','Admin');
    }

////////////////////////////////////////////////////////////private FUNCTION////////////////////////////////////////////////    
	private function logged_in()
	{
	  $row = @array_filter($this->session->userdata['logged_in']);
	  if( empty($row) )
	  {
		set_msg('info','Wrong Directory access');  
	    redirect('Auth');
	  }
	  if( $row['user_type'] != 1 )
	  {
		set_msg('info','Invalid access');  
	    redirect('Auth');
	  }
	  
	  
	  $this->userid = $row['user_id'];
	   
	}
	
	private function admin_model($fx,$param1=null,$param2=null,$param3=null,$param4=null)
	{
	  return $this->Admin->$fx($param1,$param2,$param3,$param4); 
	}
	
	private function post($name)
	{
	  if(empty($name))
	    $value = 'Enter Fields name';
	  else
	   $value = $this->input->post($name);
	   
	   return $value;
	  
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
		
	 
		
		
  
	
////////////////////////////////////////////////////////////MASTER MANAGEMENT////////////////////////////////////////////////    

	public function country($data = null)
	{
		$data['rows'] = $this->admin_model("country");
		$data['page'] = 'country';
		
		$act = $this->post('act');
		
		
		//add new country system
		if(!empty($act))
		{ 
		   $udata['m_loc_name'] = $this->post('name');
		   $udata['m_status'] = $this->post('status');	   
		}
		
		//add new country system
		if($act == '1')
		{ 
		   $udata['m_parent_id'] = 0; 
		   $this->admin_model('insert','m02_location',$udata);
           redirect("Admin/country");
		}
		//update country system
		if($act == '2')
		{
		   $id = $this->post('id'); 
		   $this->admin_model('update','m02_location',$udata,'m_loc_id',$id);
           redirect("Admin/country");
		}
		
		$this->index($data);
	}
		
    public function currency($data = null)
	{
		$data['rows'] = $this->admin_model("payment_type");
		$data['page'] = 'Currency_type';
		
		$act = $this->post('act');
		
		//add new currency system
		if(!empty($act))
		{ 
		   $udata['m6_name'] = $this->post('name');
		   $udata['m6_description'] = $this->post('description');
		   $udata['m6_status'] = $this->post('status'); 	
           $udata['m6_type'] = $this->post('type'); 
           $udata['m6_account_number'] = $this->post('account_id');
           $udata['m6_account_name'] = $this->post('m6_account_name');
		   $file = null;
		   if(!empty($_FILES['userfile']['name']))
		   {
		    $file = $this->upload_image('userfile',30,30,'currency/');
		   }
		   if(empty($file))
		   {
		     $udata['m6_icon']= $this->post('file'); 
		   }
		   else
		   {
		     $udata['m6_icon']= $file;
		   }
		}
		
		
		
		//add new payment system
		if($act == '1')
		{ 
		   $this->admin_model('insert','m06_currency_type',$udata);
		   set_msg('success','add payment type success');
		   redirect('Admin/currency');
		}
		
		//update payment system
		if($act == '2')
		{
		   $id = $this->post('id'); 
		   $this->admin_model('update','m06_currency_type',$udata,'m6_id',$id);
		   set_msg('success','update information success');
		   redirect('Admin/currency');
		} 
		$this->index($data);
	}
		
	 	
	
////////////////////////////////////////////////////////////ADMIN MANAGEMENT////////////////////////////////////////////////    
	
	
    public function index($data = null)
    {
        if (empty($data)) {
            $data['page'] = 'Dashboard';
        }
        
        $this->load->view('Admin/index', $data);
    }
    
	
	
	public function dashboard($data = null)
    {

      $data['page']   = 'Dashboard';
      $data['rows'] = $this->admin_model('dashboard'); 
      $this->index($data);
	   
    }
	
	 public function users()
     {
	   $data['page'] = 'all_user';
	   $data['rows'] = $this->admin_model('all_users'); 
       $this->index($data);
     }
	
	
	
	public function profile()
    {
      $data['page'] = 'Profile';
	  $userid = $this->uri->segment(3);
	  if(empty($userid))
	  {
	    $userid = $this->userid;
	  }
	  
	  $udate  = array();
	  
	  $act = $this->post('act');
	  
	  if($act == 1)
	  {
	    $udate['or_m_name'] = $this->post('name');
		$udate['or_m_status'] = $this->post('status');
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
		$this->admin_model('update','tr01_login',$udate,'or_user_id',$userid);
		$udate = array();
	  }
	  
	// print_r($udate);die;
	  
	  if(!empty($udate))
	  {
	    $userid = $this->post('id'); 
		$this->admin_model('update','m03_user_detail',$udate,'or_m_reg_id',$userid);
	    set_msg('success','profile update success');
		redirect('admin/profile');
	  }
	  
	  
	  $data['rows'] = $this->admin_model('get_where','m02_location',array('m_parent_id'=>'0'));
	  $data['row'] = $this->admin_model('profile',$userid);	
      $this->index($data);
	   
    }
	
	
	
	
	
	public function setting()
    {
      $data['page'] = 'Setting';
	  $data['rows'] = $this->admin_model('get','m00_setconfig');
	  
	   $config = $this->post('config');
	  if(!empty($config ))
	  {
	   foreach($config as $key=>$conf)
	   {
	    $this->admin_model('update','m00_setconfig',array('m00_value'=>$conf),'m00_name',$key);
	   }
	    set_msg('success','profile update success');
	  }
	  
      $this->index($data);
	   
    }
	
	public function sell()
	{

   	    $data['rows'] = $this->admin_model('get_where','view_currency_ledger',array('tr06_type'=>2));
		$data['page'] = 'sell'; 
		$this->index($data);
	}
	
	public function buy()
	{
		$data['rows'] = $this->admin_model('get_where','view_currency_ledger',array('tr06_type'=>1));
		$data['page'] = 'buy'; 
		$this->index($data);
	}
	
	public function exchange()
	{
		$data['rows'] = $this->admin_model('get_where','view_currency_ledger',array('tr06_type'=>3));
		$data['page'] = 'exchange'; 
		$this->index($data);
	}


public function invoice()
	{
        $id = $this->uri->segment(3);
		$data['row'] = $this->admin_model('get_where_row','view_currency_ledger',array('tr06_id'=>$id));
		$data['page'] = 'Invoice'; 
		$this->index($data);


	}

public function transaction_type()
	{
		$data['rows'] = $this->admin_model('get_where','m08_transaction_type');
		$data['page'] = 'transaction_type'; 
		$this->index($data);
	}
	
public function currency_action_perform()
{
   $id = $this->post('id');
      $page = $this->post('page');   
        if(!empty($id))
       {
         
         $status = $this->post('status');
         $desc = $this->post('description');
         $this->admin_model('update','tr06_currency_ledger',array('tr06_status'=>$status,'tr06_description'=>$desc),'tr06_id',$id);
        set_msg('success','status update success');
       }
      
       redirect("admin/$page");

}
    	public function curreny_status()
	{
        $id = $this->post('id');
		$row= $this->admin_model('get_where_row','view_currency_ledger',array('tr06_id'=>$id));
        echo json_encode($row);
	}	




	public function registration()
	{
		$data['page'] = 'registration'; 
        $data['rows'] = $this->admin_model('get_where','m02_location',array('m_status'=>1));
		$row = $this->post('1');
		$this->index($data);
	}
	
public function currency_rate()
	{
		$data['page'] = 'currency_rate'; 
        $act = $this->post('act');
        
// add new currency rate
        if(!empty($act))
        {
             $udata = array(
                                           'm07_transaction_type'=>$this->post('trasaction'),
                                           'm07_currency'=>$this->post('currency_type'),
                                           'm07_charge'=>$this->post('rate'),
                                           'm07_date'=>date('Y-m-d H:i:s'),
                                           'm07_status'=>$this->post('status')
                                          );

        }


        if($act == 1)
        {
            $this->admin_model('insert','m07_currency_rate',$udata);
         }


        if($act == 2)
        { 
                

            $this->admin_model('update','m07_currency_rate',$udata,'m07_currency',$this->post('currency_type'));
         }

	    $data['rows']= $this->admin_model('get_where','view_currency_rate');
        $data['currency_type']= $this->admin_model('get_where','view_currencys');
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
            $redirect = "admin/registration";
        }
		else 
		{
			$this->load->model('Auth_model','Auth');
			$res = $this->Auth->add_account('admin');
            set_msg('success','You have successfully Registered');
            $redirect = "admin/registration";
	    }
		
		redirect($redirect);
	}
	
 //////////////////////////////////////////////////////////ajax//////////////////////////////////////////////////
 
   
   public function ajax_money_master()
	{
	 $id = $_REQUEST['id'];
	 $cnd = array('m07_currency'=>$id);
     $row =  $this->db->get_where('view_currency_rate',array('m07_currency'=>$id))->row();
      echo json_encode($row);	 
	}

public function ajax_money_master_account()
	{
	 $id = $_REQUEST['id'];
	 $cnd = array('m6_id'=>$id);
     $row =  $this->db->get_where('m06_currency_type',array('m6_id'=>$id))->row();
      echo json_encode($row);	 
	}

	
	public function ajax_county_master()
	{
	 $id = $_REQUEST['id'];
	 $cnd = array('m_loc_id'=>$id);
	 $row = $this->admin_model('get_where_row','m02_location',$cnd);
	 echo json_encode($row);	 
	}
 
 
 
 
		
   
    
    
    
}
?>