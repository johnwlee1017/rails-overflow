class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end


  def new
    @question = Question.new
  end

  def create
    @user = User.find(1) # pass user session id 
    @question = @user.questions.new(question_params)
    @question.save
   
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
