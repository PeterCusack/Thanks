
	var View = {
		startListeners: function(){
			$('.repo_search_ajaxed').children('button').on('click', function(event){
				event.preventDefault()
				debugger
				$.ajax({
					url: '/repositories/contributors',
					method: 'get',
				}).done(function(response){
						for ( var i = 0; i < response.length; i++){
							var currentUser = i;
							debugger
							var userName = response[currentUser][0][1];
							var userPhotoURL = response[currentUser][2][1];
							var userRawURL = response[currentUser][4][1];
							var userProfileUrl = response[currentUser][5][1];
							var userContributions = response[currentUser][17][1];
							$('.contributers-display').append("\
								<a href='"+ userProfileUrl +"'>"+ userName+" </a>\
								<h4>"+ userContributions+"</h4> <br>\
								"
								)
							console.log("we made it");
						};
				});
			});
		}
	}

$(document).ready(function(){
	View.startListeners()
});