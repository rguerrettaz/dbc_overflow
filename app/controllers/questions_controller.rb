class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def destroy
  end

  def create
    @question = User.find(session[:user_id]).questions.create(params[:question])
    redirect_to @question
  end

  def show
    @question = Question.find(params[:id])

  end

  def index
  end
end
