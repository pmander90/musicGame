var ready = function ready () {	
	topArtistModel = new TopArtist();
	topArtistView = new TopArtistView(topArtistModel);

	updateScore = function () {
		$.ajax({
			type: 'PUT',
			dataType: 'json',
			url: '/scores'
		});
	}

	for(var i=0; i<4; i++){
		var songName = $("#songName").html();
		var compareName = $("#compareName").html();
		var button= $("#choice"+i);
		var result= $("#result");
		var offDivs= $(".choices");
		var showAns= $(".showAns");
		var nextButton= $(".nextButton");
		var video= $(".video");
		button.on("click", function(){
			if (event.toElement.value === compareName){
				result.html("You are correct! Title of the song is: " + songName);
				result.css('color', 'lime');
				var num = event.toElement.id.split("")[6];
				var div = $("#c" + num);
				div.css('color', 'lime');
				updateScore();
				if ($('.score').length === 1) {
					var currentScore = $('.score').children()[0].innerHTML;
					$('.score').children()[0].innerHTML = currentScore + ' +1';
					$('.score').css('color', 'lime');
				}
			} else {
				result.html("You are incorrect! The correct answer is: " + songName);
				result.css('color', 'red');
				var num = event.toElement.id.split("")[6];
				var div = $("#c" + num);
				div.css('color', 'red');
			}
			offDivs.hide();
			showAns.append(event.toElement.parentElement);
			nextButton.show();
			video.show();
		});
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);





