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
		Genius.access_token= ENV['genius_access_token']
		# Genius.text_format= 'html'
		fetcher = Lyricfy::Fetcher.new

		RapGenius::Client.access_token = ENV['genius_access_token']
		# max artist id = 87014
		random = rand(19)
		@name = RapGenius.search_by_artist(@artist)[0].artist.name

		@song0 = RapGenius.search_by_artist(@artist)[random].title
		@song1 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@song2 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@song3 = RapGenius.search_by_artist(@artist)[rand(19)].title
		@songs = [@song0,@song1,@song2,@song3].shuffle
		
		@id = RapGenius.search_by_artist(@artist)[random].id

		@media = Genius::Song.find(@id).media[0]
		if @media['provider'] == "youtube"
			@works = true
			@videoId = @media['url'].split("=").last
		else
			@works = false
		end

		songLines = fetcher.search(@artist, @song0)
		numLines = songLines.lines.length-1
		random2 = rand(0...numLines)
		@lyric1 = songLines.lines[random2]
		while @lyric1 == "" || @lyric1.split().length < 5
			random2 = rand(0...numLines) 
			@lyric1 = songLines.lines[random2]
		end
	end

end






