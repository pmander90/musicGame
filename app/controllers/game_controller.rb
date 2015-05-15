class GameController < ApplicationController

	def home

	end

	def show
		if user_signed_in?
			@user = current_user
			if @user.score
				@score = @user.score.score
			else
				id = @user.id
				@score = Score.create(user_id: id, score: 0).score

			end
		end

		@artist = params[:artist]
		random = rand(19)
		@name = RapGenius.search_by_artist(@artist)[1].artist.name

		@song0 = RapGenius.search_by_artist(@artist)[random].title
		@song1 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@song2 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@song3 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@songs = [@song0,@song1,@song2,@song3].shuffle
		
		@media = RapGenius.search_by_artist(@artist)[random].media[0]
		if @media.provider == "youtube"
			@works = true
			@videoId = @media.url.split("=").last
		else
			@works = false
		end

		numLines = RapGenius.search_by_artist(@artist)[random].lines.length-1
		random2 = rand(0...numLines)
		@lyric1 = RapGenius.search_by_artist(@artist)[random].lines[random2].lyric
		while @lyric1 == "" || @lyric1.split().length < 5
			random2 = rand(0...numLines) 
			@lyric1 = RapGenius.search_by_artist(@artist)[random].lines[random2].lyric
		end
	end

end






