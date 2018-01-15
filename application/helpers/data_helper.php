<?php 

// remove all blank value in array
function array_filters($data=array())
{
	return array_filter($data);  
}

// remove all dublicacy
function array_uniques($data=array())
{
	return array_unique($data);	
}

function home_page()
{
	redirect(base_url()); 
}

function login_page()
{
	redirect(base_url()); 
}

//set session data here 
function set_session($key,$value)
{
	$CI =& get_instance();	
	$CI->session->set_userdata($key,$value);
}

//set session data here 
function get_session($key)
{
	$CI =& get_instance();		
	return $CI->session->userdata($key);
}

function view($page,$data=null)
{
	$CI =& get_instance();
	$CI->load->view($page,$data);
}

function uri($segment)
{
	$CI =& get_instance();
	return  $CI->uri->segment($segment);
}

function baseurl($url=null)
{
	return  base_url($url);
}

function post($name)
{    
	$CI =& get_instance();
	return ($CI->input->post($name));
}

function user_status($status)
{
	if($status == 'Active')
		button('success',$status);
	if($status == 'Deactive')
		button('default',$status);
	if($status == 'Pending')
		button('warning',$status);
	if($status == 'Reject')
		button('danger',$status);	
}

// t1_1_userid = 1,$field = t1_1_email
function get_user_field($field,$where)
{
	$CI = &get_instance();
	$res = $CI->db->query("select * from view_all_member where $where ");
	if($res->num_rows()>0)
	{
		return $res->row()->$field;
	}
	else
	{
		return 0;
	}
}

function news_status($id)
{ 
	$CI =  &get_instance();
	$CI->db->where('to', $id); 


	$res = $CI->db->get_where("tr100_inbox",array('read_status'=>'Pending'))->num_rows();
	return $res;

}

function get_tot_users()
{
	$CI=&get_instance();
	$nums = $CI->db->get('view_users')->num_rows();
	return $nums;
}


/***********************************************VIEW PART**********************************************************/	
//set flashdata message
function set_msg($key,$value)
{
	$CI =& get_instance();	
	$msg = 'Plz set message';
	if($key == 'error')
	{
		$msg =  '<div class="notibar msgerror"><a class="close"></a><p>'.$value.' </p></div>' ;  
	}

	if($key == 'success')
	{   
		$msg =  '<div class="notibar msgsuccess"><a class="close"></a><p>'.$value.' </p></div>' ;  
     
	}


	if($key == 'warning')
	{
		$msg =   $msg =  '<div class="notibar msgalert"><a class="close"></a><p>'.$value.' </p></div>' ;;
	}

	if($key == 'info')
	{
		$msg =   $msg =  '<div class="notibar msginfo"><a class="close"></a><p>'.$value.' </p></div>' ;;
	}			  

	$CI->session->set_flashdata($key, $msg);

}

function get_msg()
{

	$CI =& get_instance();	

	if(($CI->session->flashdata('error')))
	{
		echo $CI->session->flashdata('error');  
	}

	if(($CI->session->flashdata('success')))
	{
		echo $CI->session->flashdata('success'); 
	}

	if(($CI->session->flashdata('warning')))
	{
		echo $CI->session->flashdata('warning'); 
	}

	if(($CI->session->flashdata('info')))
	{
		echo $CI->session->flashdata('info'); 	
	}
}

function button($type,$value)// default ,primary ,success, info,warning, danger
{
	echo '<button type="button" class="btn btn-round btn-'.$type.'">'.$value.'</button>';
}

function action($link=null,$type,$title=null)
{
	echo "<a href='$link' class='btn btn4 btn_$type' title='$title'></a>";
}

function status($status)
{
	if($status == 'Success')
	{	
		echo "<button class='stdbtn btn_orange' style='height:28px;'>$status</button>";
	}
	if($status == 'Reject')
	{	
		echo "<button class='stdbtn btn_red' style='height:28px;'>$status</button>";
	}

	if($status == 'Pending' )
	{	
		echo "<button class='stdbtn btn_yellow' style='height:28px;'>$status</button>";
	}

	if($status == 'Active' )
	{	
		echo "<button class='stdbtn btn_blue' style='height:28px;'>$status</button>";
	}
	if($status == 'Deactive'  )
	{	
		echo "<button class='stdbtn btn_black' style='height:28px;'>$status</button>";
	}	  
}

function txt_status($status)
{
	if($status == '0' )
	{	
		echo '<i class="status_pending")"><b>Pending</b></i>';
	}

	if($status == '1' )
	{	
		echo '<i class="status_active"><b>Active</b></i>';
	}

	if($status == '2')
	{	
		echo '<i class="status_deactive"><b>Deactive</b></i>';
	}	  

	if($status == '3')
	{	
		echo '<i class="status_reject")"><b>Reject</b></i>';
	}	  
}

function get_banks($id=null)
{
	$CI =& get_instance();
	$banks = $CI->db->get('m01_bank')->result();
	$option = '';
	foreach($banks as $bank)
	{
		if($id == $bank->m_bank_id)		 	
			$option.= '<option value="'.$bank->m_bank_id.'" selected>'.$bank->m_bank_name.'</option>';
		else
			$option.= '<option value="'.$bank->m_bank_id.'">'.$bank->m_bank_name.'</option>';
	}
	echo $option;		
}

function get_state($id=null)
{
	$CI =& get_instance();
	$locations = $CI->db->where('m_parent_id',1)->get('m02_location')->result();
	$option = '';
	$selected='';
	foreach($locations as $location)
	{
		if($id == $location->m_loc_id)		 	
			$option = '<option value="'.$location->m_loc_id.'" selected>'.$location->m_loc_name.'</option>';
		else
			$option.= '<option value="'.$location->m_loc_id.' '.$selected.'">'.$location->m_loc_name.'</option>';
	}
	echo $option;		
}

function get_city($id=null)
{
	$CI =& get_instance();
	$locations = $CI->db->where('m_parent_id >',1)->get('m02_location')->result();
	$option = '';
	$selected='';
	foreach($locations as $location)
	{
		if($id == $location->m_loc_id)		 	
			$option = '<option value="'.$location->m_loc_id.'" selected>'.$location->m_loc_name.'</option>';
		else
			$option.= '<option value="'.$location->m_loc_id.' '.$selected.'">'.$location->m_loc_name.'</option>';
	}
	echo $option;		
}	

function input($leble,$type,$name,$id=null,$value=null,$attr1=null,$attr2=null)
{
	echo "<p><label>$leble</label>
                            <span class='field'><input type='$type' name='$name' id='$id' class='smallinput' value='$value' $attr1,$attr2 /></span>
                        </p>";
}


function submit($name)
{
	echo '<p class="stdformbutton"><button class="submit radius2">'.$name.'</button></p>';
}
?>