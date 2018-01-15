/*
 * 	Additional function for forms.html
 *	Written by ThemePixels	
 *	http://themepixels.com/
 *
 *	Copyright (c) 2012 ThemePixels (http://themepixels.com)
 *	
 *	Built for Amanda Premium Responsive Admin Template
 *  http://themeforest.net/category/site-templates/admin-templates
 */

jQuery(document).ready(function(){
	
	///// FORM TRANSFORMATION /////
	jQuery('input:checkbox, input:radio, select, input:file').uniform();


	///// DUAL BOX /////
	var db = jQuery('#dualselect').find('.ds_arrow .arrow');	//get arrows of dual select
	var sel1 = jQuery('#dualselect select:first-child');		//get first select element
	var sel2 = jQuery('#dualselect select:last-child');			//get second select element
	
	sel2.empty(); //empty it first from dom.
	
	db.click(function(){
		var t = (jQuery(this).hasClass('ds_prev'))? 0 : 1;	// 0 if arrow prev otherwise arrow next
		if(t) {
			sel1.find('option').each(function(){
				if(jQuery(this).is(':selected')) {
					jQuery(this).attr('selected',false);
					var op = sel2.find('option:first-child');
					sel2.append(jQuery(this));
				}
			});	
		} else {
			sel2.find('option').each(function(){
				if(jQuery(this).is(':selected')) {
					jQuery(this).attr('selected',false);
					sel1.append(jQuery(this));
				}
			});		
		}
	});
	
	
	///// payment master validation /////
	jQuery("#paymentMaster").validate({
		rules: {
			name: "required",
		    userfile : "required"	,
			 status: {
                         required: true
                }	
			
		},
		messages: {
			userfile: "Please upload file for icon "
		}
	});
	
	
	///// payment master validation /////
	jQuery("#updatepaymentMaster").validate({
		rules: {
			name: "required"
		}
		
	});
	
	///// payment master validation /////
	jQuery("#insertcountry").validate({
		rules: {
			name: "required",
			status: "required"
		}
		
	});
	///// payment master validation /////
	jQuery("#upadtecountry").validate({
		rules: {
			name: "required"
		}
		
	});
	
	
	
	///// Profile   VALIDATION /////
	jQuery("#basiec").validate({
		rules: {
			name: "required",
			username: "required",
			email: {
				required: true,
				email: true,
			}
		}
		
		
		
	});
	var new_pass = email =  pin_new_pass  = null;
	
	
	///// Profile   VALIDATION /////
	jQuery("#updatepwd").validate({
		rules: {
			new_pass: "required",
			c_pass: {
				required: true,
				equalTo: new_pass,
			},
			pin_new_pass: "required",
			pin_c_pass: {
				required: true,
				equalTo: pin_new_pass,
			}
			
		}
		
		
		
	});
	///// FORM VALIDATION /////
	jQuery("#form1").validate({
		rules: {
			name: "required",
			
			username: "required",		
			country: "required",
            email: "required",
           confirm_email: "required",
		    password: "required",
            referals: "required",
            confirm_password: "required"
			
		},
		
			
		messages: {		
			referal: "This Referral id is not found "
		}
		
		
		
	});	
	
///// FORM VALIDATION /////
		
	
	
	///// TAG INPUT /////
	
	//jQuery('#tags').tagsInput();

	
	///// SPINNER /////
	
	//jQuery("#spinner").spinner({min: 0, max: 100, increment: 2});
	
	
	///// CHARACTER COUNTER /////
	
	/*jQuery("#textarea2").charCount({
		allowed: 120,		
		warning: 20,
		counterText: 'Characters left: '	
	});*/
	
});

/////////////////////////////////////////////////////ajax management/////////////////////////////////////////////////
function updatePaymentMaster(id_numb)
{
	 if(id_numb == null)
	 {
	   return false;
	 }

	jQuery.ajax({
	  url: base_url('admin/ajax_money_master'),
	  type: "POST",
	  data: {id : id_numb},
	  success: function(res)
	  {
		  var n = JSON.parse(res);
		  var st = 'Active';
		  var p_type = 'Buy';
		 var frm = '#updatepaymentMaster '; 
	    jQuery(frm+'#name').val(n.m6_name);
		jQuery(frm+'#description').val(n.m6_description);
		if(n.m6_status == 0) st= 'Inactive'; 
		jQuery(frm+'#cStatus').html(st);
		jQuery(frm+'#id').val(n.m6_id);
		jQuery(frm+'#file').val(n.m6_icon);
		if(n.m6_type == 2) p_type= 'Sell'; 
		jQuery(frm+'#pay_type').html(p_type);
		jQuery(frm+'#imgcurren').attr('src',base_url('assets/uploaded/currency/'+n.m6_icon));
	  }
	});
}
function updateCountryMaster(id_numb)
{
	 if(id_numb == null)
	 {
	   return false;
	 }

	jQuery.ajax({
	  url: base_url('admin/ajax_county_master'),
	  type: "POST",
	  data: {id : id_numb},
	  success: function(res)
	  {
		  var n = JSON.parse(res);
		  var st = 'Active';
		 var frm = '#upadtecountry '; 
	    jQuery(frm+'#name').val(n.m_loc_name);
		if(n.m6_status == 0) st= 'Inactive'; 
		jQuery(frm+'#cStatus').html(st);
		jQuery(frm+'#id').val(n.m_loc_id);
	  }
	});
}