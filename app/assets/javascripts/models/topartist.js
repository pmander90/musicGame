var TopArtist = function(){
	this.topArtists = [];
}

TopArtist.prototype = {
	findArtists: function (){
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: '/topartists'
		}).done(function(data){
			for(var i=0; i<data.length; i++){
				topArtistModel.topArtists.push(data[i].name);
			}

		});
	}
}