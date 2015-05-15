var TopArtistView = function (model){
	this.model = model;
	this.container = $("#top");
	this.model.findArtists();
}

TopArtistView.prototype = {
	render: function(){
		for(var i=0; i<this.model.topArtists.length; i++){
			var aTag = $('<a>',{
    			text: this.model.topArtists[i],
    			 href: 'https://guessthelyrics.herokuapp.com/show/?artist=' + this.model.topArtists[i]
			});
			newDiv = $('<div></div>').append(aTag);
			this.container.append(newDiv);
		}
	}
}