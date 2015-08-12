class BoardsController < ApplicationController
	
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

    def show
    	 @board = current_user.boards.find_by(id: params[:id])
    	  # binding.pry
    	 # @lists = @board.lists.all
    end

	def create
		@board = current_user.boards.build(board_params)
		if @board.save
			flash[:success] = "Board created successfully!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end
	

    def destroy
    	@board.destroy
    	flash[:success] = "Board deleted successfully!"
    	redirect_to request.referrer || root_url
    end
     

	private

	def board_params
		params.require(:board).permit(:title)
	end

	def correct_user
		@board = current_user.boards.find_by(id: params[:id])
		redirect_to root_url if @board.nil?
	end
end
