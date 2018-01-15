<?php

class Front extends CI_Controller
{
  
	
    public function __construct()
    {
        parent::__construct();
    }
	
	 public function index($data = null)
    {
        if (empty($data)) {
            $data['page'] = 'Home';
        }
        
        $this->load->view('Front/index', $data);
    }
	
	public function home()
     {
	   $data['page'] = 'Home';
       $this->index($data);
     }
	
public function soon()
     {
	   $data['page'] = 'Soon';
       $this->index($data);
     }

	
public function plan()
     {
	   $data['page'] = 'Plan';
       $this->index($data);
     }
	

    
}
?>