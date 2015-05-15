class ScoresController < ApplicationController

	def update
		@user = current_user
		@score = Score.find_by(user_id: @user.id)
		@add = @score.score+1
		@score.update(score: @add)
	end

end
