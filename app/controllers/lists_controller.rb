class ListsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

    def show
    	 @list = current_user.boards.lists.find_by(id: params[:id])
    	  # binding.pry
    	 # @lists = @board.lists.paginate(page: params[:page])
    end

	def create
		@list = current_user.boards.lists.build(list_params)
		if @list.save
			flash[:success] = "List created successfully!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end
	

    def destroy
    	@list.destroy
    	flash[:success] = "List deleted successfully!"
    	redirect_to request.referrer || root_url
    end
     

	private

	def list_params
		params.require(:list).permit(:title)
	end

	def correct_user
		@list = current_user.boards.lists.find_by(id: params[:id])
		redirect_to root_url if @list.nil?
	end
end
