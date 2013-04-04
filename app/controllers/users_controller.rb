class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    # p params[:user]
    # p params
    # puts '*' *30
    session[:user_id] = @user.id
    redirect_to users_profile_path
  end

  def profile
    if session[:user_id]
      @user = User.find(session[:user_id])
      @questions = @user.questions
    else
      redirect_to new_user_path
    end
    p @user
    puts '*' * 30
  end

end
