class StaticPagesController < ApplicationController
  def home
  	@board = current_user.boards.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
