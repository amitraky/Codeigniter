<?php
	
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Backdoor extends CI_Controller{
		
		public function __construct()
		{
			parent::__construct();			
	    } 

#############################################  Data m18_plan_booking  edit #########################
        public function edit_booking_date()
		{  
         // This system has closed
			$this->db->free_db_resource();		
            $data['rows'] =$this->db->query('SELECT plan_book_id,or_m_member_id AS Member_id,or_m_name AS Member_Name ,or_member_joining_date AS join_date,(SELECT p_planname FROM `p01_plan_type`  WHERE plan_type = p_plantype_id) AS Plan_TYPE,plan_contract_id AS Contract_ID, plan_amount,plan_consideration_amount,plan_consideration_amount,plan_book_date,maturity_date,total_paid_ins AS Paid_installment,(SELECT SUM(m_amount) FROM `tr10_project_payment` WHERE m_project_id = plan_book_id) AS total_paid_amount FROM `m18_plan_booking`  LEFT JOIN `m09_member_detail` ON(`m09_member_detail`.or_m_reg_id = `m18_plan_booking`.customer_id)  limit 700,1000 ')->result();
			$this->load->view('report/edit_plan_booking',$data);
		}

		public function update_plan_booking()
		{
		echo "<pre>"; die;
		$rows =  $_REQUEST['data'];

			foreach($rows['book_date'] as $key=>$row)
			{
			   $maturity_date = $rows['maturity_date'][$key];
			   $res = $this->db->where('plan_book_id',$key)->update('m18_plan_booking',array('plan_book_date'=>$row,'maturity_date'=>$maturity_date));

			}

		}

		#############################################  Data tr10_project_payment  edit #########################

public function project_payment()
		{  
         // This system has closed
			$this->db->free_db_resource();		
            $data['rows'] =$this->db->query('SELECT plan_book_id,or_m_member_id AS Member_id,or_m_name AS Member_Name ,or_member_joining_date AS join_date,(SELECT p_planname FROM `p01_plan_type`  WHERE plan_type = p_plantype_id) AS Plan_TYPE,plan_contract_id AS Contract_ID, plan_amount,plan_consideration_amount,plan_consideration_amount,plan_book_date,maturity_date,total_paid_ins AS Paid_installment,(SELECT SUM(m_amount) FROM `tr10_project_payment` WHERE m_project_id = plan_book_id) AS total_paid_amount FROM `m18_plan_booking`  LEFT JOIN `m09_member_detail` ON(`m09_member_detail`.or_m_reg_id = `m18_plan_booking`.customer_id)  limit 700,1000 ')->result();
			$this->load->view('report/edit_plan_booking',$data);
		}

		public function update_plan_booking()
		{ die;
		echo "<pre>";
		$rows =  $_REQUEST['data'];

			foreach($rows['book_date'] as $key=>$row)
			{
			   $maturity_date = $rows['maturity_date'][$key];
			   $res = $this->db->where('plan_book_id',$key)->update('m18_plan_booking',array('plan_book_date'=>$row,'maturity_date'=>$maturity_date));

			}

		}


		#############################################  Data tr11_account_ledger  edit #########################


public function account_ledger()
		{  
         // This system has closed
			$this->db->free_db_resource();		
            $data['rows'] =$this->db->query('SELECT or_m_member_id AS Member_ID, or_m_name ,or_member_joining_date AS Join_date ,m_acc_credit AS Credit,m_acc_debit AS Debit ,m_acc_date Txns_date  FROM `tr11_account_ledger` LEFT JOIN `m09_member_detail` ON(`m09_member_detail`.`or_m_reg_id` = `tr11_account_ledger`.`or_m_reg_id`)  limit 700,1000 ')->result();
			$this->load->view('report/edit_plan_booking',$data);
		}

		public function update_plan_booking()
		{
		echo "<pre>"; die;
		$rows =  $_REQUEST['data'];

			foreach($rows['book_date'] as $key=>$row)
			{
			   $maturity_date = $rows['maturity_date'][$key];
			   $res = $this->db->where('plan_book_id',$key)->update('m18_plan_booking',array('plan_book_date'=>$row,'maturity_date'=>$maturity_date));

			}

		}
	}		
?>	