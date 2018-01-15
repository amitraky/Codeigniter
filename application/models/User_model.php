<?php
class User_model extends CI_Model
{
	
    public function profile($id)
	{
	  $result = $this->db->get_where('view_all_users',array('or_m_reg_id'=>$id))->row();
	  return $result;
	}
	
	public function referral($id)
	{
	  $result = $this->db->get_where('view_all_users',array('or_m_intr_id'=>$id))->result();
	  return $result;
	}

public function currency()
	{
	  $result = $this->db->get_where('m6_payment_type',array('m6_status'=>1))->result();
	  return $result;
	}
///////////////////////////////////////////////////////////database part///////////////////////////////////////////////////	
	
	public function db($fx,$table,$param1=null,$param2=null)
	{
	  return $this->db->$fx($table,$param1,$param2);
	}
	
	public function insert($table,$idata)
	{
	  $this->db('insert',$table,$idata);
	}
	
	public function update($table,$udata,$filed,$value)
	{ 
	  
	   $res = $this->db->where($filed,$value)->update($table,$udata);
	  return $res;
	}
	
	public function get($table,$cnd)
	{
	  $res = $this->db('get',$table,$cnd)->result();
	  return $res;
	}
	
	public function get_row($table,$cnd)
	{
	  $res = $this->db('get',$table,$cnd)->result();
	  return $res;
	}
	
	public function get_where($table,$cnd)
	{
	  $res = $this->db('get_where',$table,$cnd)->result();
	  return $res;
	}
	public function get_where_row($table,$cnd)
	{
	  $res = $this->db('get_where',$table,$cnd)->row();
	  return $res;
	}
	
		
}