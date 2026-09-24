$(function(){
	$( ".datepicker" ).datepicker({
		minDate: -30,
		maxDate: "+3m"
	});
	
	$.validator.addMethod(
      "lastNameInField", 
      function(value, element) {
      	var lastName = $("input[name='last_name']").val().toUpperCase();
      	value = value.toUpperCase();
      	
      	if(value.includes(lastName) && lastName != ''){
	      	return false;
      	}else{
	      	return true;
      	}
      },
      "Can't contain your last name"
  );
   
  
  $.validator.addMethod("validDate", function(value, element) {
  
	  function isValidDate(dateString)
		{
		    // First check for the pattern
		    if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
		        return false;
		
		    // Parse the date parts to integers
		    var parts = dateString.split("/");
		    var day = parseInt(parts[1], 10);
		    var month = parseInt(parts[0], 10);
		    var year = parseInt(parts[2], 10);
		
		    // Check the ranges of month and year
		    if(year < 1000 || year > 3000 || month == 0 || month > 12)
		        return false;
		
		    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		
		    // Adjust for leap years
		    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
		        monthLength[1] = 29;
		
		    // Check the range of the day
		    return day > 0 && day <= monthLength[month - 1];
		};
  

			return isValidDate(value);

	}, "Please enter a valid date in the format DD/MM/YYYY");
	
	$.validator.addMethod("notEqual", function(value, element, param) {
  	return this.optional(element) || value != $(param).val();
	}, "Your addresses are the same");
  
  

	
	$("#address-info-form").validate({
		rules: {
	    start_date: {
	      required: true,
	      validDate: true
	    },
	    stop_date: {
      	required: "#move_type_temp:checked",
      	validDate: true
			},
			business_name: {
      	required: "#who_business:checked"
			},
			phone: {
	      required: true,
	      phoneUS: true
	    },
	    old_street_address: { 
	    	required: true, 
	    	notEqual: "#new_street_address" 
	    }, 
	    old_apt_suite: {
        lastNameInField: true
			},
			new_apt_suite: {
        lastNameInField: true
			}
	  },
	  messages: {
	  		rent_own: "Do you rent or own your new address?",
	  		move_type: "Select either a permanent move or a temporary move",
        first_name: "Enter your first name",
        last_name: "Enter your last name",
        start_date: "Please enter a valid date in the format DD/MM/YYYY",
        stop_date: "Please enter a valid date in the format DD/MM/YYYY",
        email: "Enter your email address",
        old_street_address: {
        	required: "Enter your old street address",
        	notEqual: "Your old and new addresses can't be the same"
        },
        old_apt_suite: {
	        lastNameInField: "Your unit shouldn't contain your name"
        },
        old_city: "Enter your old city",
        old_state: "Enter your old state",
        new_street_address: "Enter your new street address",
        new_apt_suite: {
	        lastNameInField: "Your unit shouldn't contain your name"
        },
        new_city: "Enter your new city",
        new_state: "Enter your new state",
        phone: "Enter your phone number",
        who: "Select who is moving"
    },
    submitHandler: function(form) {
    	
    	data = $("#address-info-form").serialize();
    	$("#address-info-form button").text("Processing");
    	$("#address-info-form button").prop("disabled",true);
    	
			$(".error-bar").remove();
    	
    	$.ajax({
			  method: "POST",
			  url: "api/validate-address.php",
			  data: data
			})
				.done(function( msg ) {
					if(msg.startsWith("error")){
						// error, parse message and highlight forms
						var errors = msg.split("::");
						errors.forEach(function(item, index){
							var error_components = item.split("||");
							var element = $("." + error_components[1]);
							element.addClass('error');
								
							element.before("<p class='error-bar'>" + error_components[2] + "</p>");
							
							$("#address-info-form button").text("Continue");
							$("#address-info-form button").prop("disabled",false);
							
					    $('html, body').animate({
					        scrollTop: element.offset().top - 150
					    }, 500);
						});
					}else if(msg.startsWith("forward")){
						window.location.href = '/step-2-b?old=user&new=user';
					}else{
						$(".modal-body").html(msg);
						$('#form').modal();
						
						$("#address-info-form button").text("Continue");
						$("#address-info-form button").prop("disabled",false);
					}
				});
    	
    	return false;
		}
	});
	
	
	$("body").on('click','.my-version',function(e){
		e.preventDefault();
		var address_type = $(this).data("address-type");
		
		$(this).children("span").show();
		
		if(address_type == "old"){
			$(".old-address .corrected-version span").hide();
			$("#old_address_choice").val("user");
		}
		if(address_type == "new"){
			$(".new-address .corrected-version span").hide();
			$("#new_address_choice").val("user");
		}
		
		console.log( $("#old_address_choice").val() );
		console.log( $("#new_address_choice").val() );
		
		if( $("#old_address_choice").val() != "" && $("#new_address_choice").val() != ""){
			var url = '/step-2-b?old=' + $("#old_address_choice").val() + '&new=' + $("#new_address_choice").val();
			window.location.href = url;
		}
		
		return false;
		
	});
	
	
	$("body").on('click','.corrected-version',function(e){
		e.preventDefault();
		var address_type = $(this).data("address-type");
		
		$(this).children("span").show();
		
		if(address_type == "old"){
			$(".old-address .my-version span").hide();
			$("#old_address_choice").val("usps");
		}
		if(address_type == "new"){
			$(".new-address .my-version span").hide();
			$("#new_address_choice").val("usps");
		}
		
		console.log( $("#old_address_choice").val() );
		console.log( $("#new_address_choice").val() );
		
		if( $("#old_address_choice").val() != "" && $("#new_address_choice").val() != ""){
			var url = '/step-2-b?old=' + $("#old_address_choice").val() + '&new=' + $("#new_address_choice").val();
			window.location.href = url;
		}
		
		return false;
		
	});
	
	
	$("[name='rent_own']").click(function(){
		var rent_own = $(this).val();
		if(rent_own == "own"){
			$("#house_apt").show();
		}else{
			$("#house_apt").hide();
			$("#house_apt input").prop('checked', false);
			$("#solar_panels").hide();
			$("#solar_panels input").prop('checked', false);
		}
	});
	
	$("[name='house_apt']").click(function(){
		var house_apt = $(this).val();
		if(house_apt == "house"){
			$("#solar_panels").show();
		}else{
			$("#solar_panels").hide();
			$("#solar_panels input").prop('checked', false);
		}
	});
	
	$("[name='move_type']").click(function(){
		var moveType = $(this).val();
		if(moveType == "temporary"){
			$("#stop_forwarding").show();
		}else{
			$("#stop_forwarding").hide();
			$("#stop_forwarding input").val("");
		}
	});
	
	
	$("[name='who']").click(function(){
		var who = $(this).val();
		if(who == "business"){
			$("#business_name").show();
		}else{
			$("#business_name").hide();
			$("#business_name input").val("");
		}
	});

	
	
	
});