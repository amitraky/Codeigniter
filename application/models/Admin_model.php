<?php
class Admin_model extends CI_Model
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
	
	public function all_users()
	{
	  $result = $this->db->get_where('view_all_users')->result();
	  return $result;
	}
	
	public function user($id)
	{
	  $result = $this->db->get_where('view_all_users',array('or_m_intr_id'=>$id))->result();
	  return $result;
	}
	public function country($id)
	{
	  $result = $this->db->get_where('m02_location',array('m_parent_id'=>0))->result();
	  return $result;
	}
	
   public function payment_type($id)
	{
	  $result = $this->db->get_where('m06_currency_type')->result();
	  return $result;
	}
	
	public function sell()
	{
	  $result = $this->db->get_where('m06_currency_type')->result();
	  return $result;
	}
	
	public function buy()
	{
	  $result = $this->db->get_where('m06_currency_type')->result();
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

  public function dashboard()
  {
    $sql = "SELECT tr06_type,SUM(tr06_from_amount) as from_amt, SUM(tr06_to_amount) as to_amt FROM `tr06_currency_ledger` GROUP BY tr06_type";
    $data['thumbs'] = $this->db('query',$sql)->result();

    $sql2 = "SELECT tr06_type,tr06_status,tr06_date,tr06_from_currency,tr06_to_currency,tr06_from_amount , tr06_to_amount FROM `view_currency_ledger` where   tr06_status = '0'";
    $data['table'] = $this->db('query',$sql2)->result();
    
    $sql3 = "SELECT tr06_status,sum(tr06_from_amount) as from_amt, sum(tr06_to_amount) to_amt FROM `view_currency_ledger` group by   tr06_status";
    $data['status'] = $this->db('query',$sql3)->result();

     return  $data;
  }
  
	
	

}