$( document ).ready(function() {
	$("#click").click( function()
			{ 
	        // get the form values
	        var user = $('#user').val();
	        var content = $('#content').val();
	        var date = $('#date').val();
	        $.ajax({ 
		        url: "http://guestbook-valentino.rhcloud.com/guestbook/reviews/addreviewque",
                type: "GET",
    	        data: "user=" + user + "&content=" + content+"&date="+date,
                success: function(resposeJsonObject){  
                	alert("Your review has been added for revaluation");
             }});
	      
	        });
});