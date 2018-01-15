jQuery(document).ready(function(){
								
	///// TRANSFORM CHECKBOX /////							
	jQuery('input:checkbox').uniform();
	
	///// LOGIN FORM SUBMIT /////
	jQuery('#login').submit(function(){
	
		if(jQuery('#username').val() == '' && jQuery('#password').val() == '') {
			jQuery('.nousername').fadeIn();
			jQuery('.nopassword').hide();
			return false;	
		}
		if(jQuery('#username').val() != '' && jQuery('#password').val() == '') {
			jQuery('.nopassword').fadeIn().find('.userlogged h4, .userlogged a span').text(jQuery('#username').val());
			jQuery('.nousername,.username').hide();
			return false;;
		}
	});
	
	///// ADD PLACEHOLDER /////
	jQuery('#username').attr('placeholder','Username');
	jQuery('#password').attr('placeholder','Password');
});





jQuery(document).ready(function(){
	
	///// FORM TRANSFORMATION /////
	jQuery('input:checkbox, input:radio, select, input:file').uniform();


	///// DUAL BOX /////
	var db = jQuery('#dualselect').find('.ds_arrow .arrow');	//get arrows of dual select
	var sel1 = jQuery('#dualselect select:first-child');		//get first select element
	var sel2 = jQuery('#dualselect select:last-child');			//get second select element
	
	sel2.empty(); //empty it first from dom.
	
	
	
	
	///// FORM VALIDATION /////
	jQuery("#registration").validate({
		rules: {
			name: "required",
			username: "required",
			email: {
				required: true,
				email: true,
			},
			confirm_email: {
				equalTo: email				
			},			
			password: "required",
			confirm_password: {equalTo:password},
			referal: "required",
			country: "required"
			
		},
		messages: {		
			referal: "This Referal id is not found "
		},
		
		
	});
	
	
	///// TAG INPUT /////
	
	jQuery('#tags').tagsInput();

	
	///// SPINNER /////
	
	jQuery("#spinner").spinner({min: 0, max: 100, increment: 2});
	
	
	///// CHARACTER COUNTER /////
	
	jQuery("#textarea2").charCount({
		allowed: 120,		
		warning: 20,
		counterText: 'Characters left: '	
	});
	
});
