class TopartistsController < ApplicationController

	def index
		@topartists = Topartist.all
		render json: @topartists
	end

end